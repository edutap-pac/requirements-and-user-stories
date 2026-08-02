# Domain model

The model has four layers.
Separating the logical access point from the device is what allows further drivers to be added without changing the model.

## Spatial structure

```{mermaid}
:alt: Site contains buildings, buildings contain floors, floors contain access points, and zones group access points across the hierarchy.

graph LR
    Site --> Building
    Building --> Floor
    Floor --> AccessPoint
    Zone -.->|n:m| AccessPoint
```

| ID | Requirement |
|---|---|
| `PAC-STR-01` | The hierarchy `Site → Building → Floor → AccessPoint` is supported. |
| `PAC-STR-02` | A `Zone` groups access points across the hierarchy in an n:m relation. |
| `PAC-STR-03` | An `AccessPoint` carries a type: `DOOR`, `BARRIER`, `GATE`, `TURNSTILE`, `ELEVATOR` or `LOCKER`. |
| `PAC-STR-04` | Each type maps to a behavior profile. `DOOR`, `BARRIER`, `GATE` and `TURNSTILE` share the door behavior profile, optionally without door-state monitoring. `ELEVATOR` requires floor-selective behavior and `LOCKER` requires its own profile. Neither is implemented in version one. |
| `PAC-STR-05` | An access point carries a reference to the room it serves, using the identifier of the institution's room register. The reference is recorded in version one even where no plan-based view exists yet. |

## Device layer

| ID | Requirement |
|---|---|
| `PAC-DEV-01` | `Controller`, `Reader` and `IOModule` are modeled separately from access points. |
| `PAC-DEV-02` | An `AccessPointBinding` links an access point to a controller port, one or more readers, and relays. |
| `PAC-DEV-03` | Replacing a controller changes only the binding. It must never change permissions. |
| `PAC-DEV-04` | Each controller records the capabilities its driver reports, as defined in {doc}`devices-and-readers`. |

## Authorization

A permission has exactly one form.

```text
AccessRule = Group × (AccessPoint | Zone) × TimeModel
             + validity period
             + provisioning mode (resident | just-in-time)
```

| ID | Requirement |
|---|---|
| `PAC-AUT-01` | Permissions are exclusively group-based. PAC must not hold a person-to-permission assignment. |
| `PAC-AUT-02` | A `Group` is a reference to an identity management group through a stable identifier. PAC must not edit memberships. |
| `PAC-AUT-03` | Each access point carries a `CredentialPolicy` naming the credential technologies it accepts. |
| `PAC-AUT-04` | A rule may target an access point or a zone. Zone rules expand to their members. |
| `PAC-AUT-05` | A rule carries a validity period. Expired rules are removed from the desired state automatically. |

## Time

| Layer | Content | Maintained by |
|---|---|---|
| `WeeklyPattern` | Weekly grid | Area owners |
| `AcademicCalendar` | Lecture period, lecture-free period, examination period | Estate management, centrally |
| `HolidayCalendar` | Public holidays, year-end closure | Estate management, centrally |
| `SpecialEvent` | University ball, summer festival, open day | Estate management, centrally |

| ID | Requirement |
|---|---|
| `PAC-TIM-01` | A `TimeModel` composes the four layers with explicit precedence: `SpecialEvent > HolidayCalendar > AcademicCalendar > WeeklyPattern`. |
| `PAC-TIM-02` | The academic calendar is a first-class dimension. It must not be expressed as a weekly pattern with start and end dates. |
| `PAC-TIM-03` | Holiday and special-event rules are maintained institution-wide by the calendar authority, as required by `PAC-ADM-10`. |
| `PAC-TIM-04` | A time model resolves to the schedule representation the target controller supports. |

## Identity and encoding

| ID | Requirement |
|---|---|
| `PAC-CRD-01` | A `Person` holds the canonical person identifier only. |
| `PAC-CRD-02` | A `Credential` holds technology, identifier, validity and status. Supported technologies include LEGIC Advant, NXP MIFARE, Apple VAS, Apple Access, Google Smart Tap and Samsung Access. |
| `PAC-CRD-03` | One canonical identifier per person is the target state. Multiple stored encodings for one person are a defect. |
| `PAC-CRD-04` | An `EncodingProfile` derives the concrete encoding from credential technology, reader model and controller capability. It covers ASCII and hexadecimal representation, endianness, bit length, and segment or application identifier structure. |
| `PAC-CRD-05` | Where a controller supports formatted card data through `osdp_FMT`, PAC must prefer it over the raw bit array of `osdp_RAW`. Where only the raw form is available, PAC normalizes at provisioning time. |

```{seealso}
{doc}`../explanation/credential-encoding` explains why this layer exists.
```

## Administration

| ID | Requirement |
|---|---|
| `PAC-ADM-01` | An `OrgUnit` models faculty, institute and chair, and carries delegation. |
| `PAC-ADM-02` | Three authorities exist, orthogonal to each other. The calendar authority owns the institution-wide calendars. Building operations owns sites, buildings, zones, access points, closing times and controller administration, scoped per site. Area owners own access rules for their assigned access points. See {doc}`roles-and-interfaces`. |
| `PAC-ADM-03` | An area owner must not be able to see access points outside their scope. The same restriction applies between building operations units of different sites. |
| `PAC-ADM-04` | Multi-tenancy is not required for version one. |
| `PAC-ADM-14` | Room allocation and the organizational assignment of rooms are imported from the institution's computer-aided facility management system. PAC is not the master of that data and must not offer a way to edit it. |

### Rooms come from facility management

Universities already run a computer-aided facility management system that holds every room, its floor plan and the organizational unit it belongs to.
That system is maintained by the estate planning department and is the authority on room allocation.

Because `PAC-ADM-13` derives delegation from room allocation, PAC consumes that data rather than duplicating it.
The same import carries the plan references that `PAC-UIX-06` will later use.

This is the same principle as the identity management boundary in {doc}`idm-interface`, applied to space instead of people: PAC references what another system owns, and never becomes a second place where it is edited.
