# Open items

Working list of things people must clarify, decide or negotiate.
These are not implementation tasks.

Items are grouped by the audience that owns them, not by individual.
Status values are `open`, `in progress`, `done` and `dropped`.

```{important}
Keep this page free of confidential vendor information and free of institution-specific data.
Where a verification depends on non-public knowledge, record the question and the outcome, not the vendor internals.
```

## Hardware and vendor verification

Owner: device administration, through whichever institution holds the closest vendor relationship.

| # | Item | Why it matters | Status |
|---|---|---|---|
| `HW-01` | Clarify whether the controller supports a host-based decision for an unknown credential, which is option A in {doc}`../reference/provisioning` | Decides the tiered provisioning model | open |
| `HW-02` | Confirm the effective credential and event-log capacity of the pilot controllers under PAC-style use | Thresholds for the capacity guard in `PAC-PRV-05`, and feasibility of option D | open |
| `HW-03` | Confirm whether the controller passes OSDP file transfer through to the reader | Prerequisite for `PAC-RDR-05` | open |
| `HW-04` | Confirm whether the controller supports OSDP transparent mode | Prerequisite for card writing on the offline roadmap | open |
| `HW-05` | Confirm whether higher-density controller models are manageable through the open interface rather than a vendor-bundled stack | Determines the scale-out path beyond the pilot | open |
| `HW-06` | Clarify whether the controller interface supports mutual TLS client authentication | Target state in `PAC-SEC-04` | open |
| `HW-07` | Clarify network commissioning of readers onto a credential segment: prerequisites, licensing, interface | Blocks `PAC-RDR-04` | open |

## Identity management integration

Owner: IT operations, together with the identity management team.

| # | Item | Why it matters | Status |
|---|---|---|---|
| `IDM-01` | Define the interface contract, covering topics, schema, event types, ordering and replay | Single ingress channel; blocks the whole ingest component | open |
| `IDM-02` | Confirm that the groups area owners think in already exist in identity management | If they do not, the gap is in identity management and surfaces first in PAC | open |

## Data protection and staff representation

Owner: data protection officer, staff representation and estate management.

| # | Item | Why it matters | Status |
|---|---|---|---|
| `LEG-01` | Agree retention periods, with a proposed default of 7 days and a maximum of 6 months | Legal basis for `PAC-EVT-02` | open |
| `LEG-02` | Confirm the national regulatory requirements of each operating institution | Compliance scope in `PAC-NFR-08` | open |
| `LEG-03` | Define the auditor role split by group or area concretely | Implements `PAC-EVT-05` | open |
| `LEG-04` | Decide whether the organizational six-eyes procedure is sufficient for version one, or whether cryptographic enforcement is required from the start | Would move `PAC-EVT-07` from roadmap into version one | open |
| `LEG-05` | Decide whether the control room may see a name or photograph when acting, and on what legal basis | The current design says no; this is where it will be challenged | open |

## Estate and rollout

Owner: the calendar authority, estate administration and device administration.

| # | Item | Why it matters | Status |
|---|---|---|---|
| `EST-01` | Record the target number of online access points per operating institution | Sizing of the reconciler, the database and the rollout plan | open |
| `EST-02` | Finalize timeline and procurement for the pilot hardware | Project plan | in progress |
| `EST-03` | Align lockdown requirements with security staff, fire-alarm control panel operators and the police | Version two, but the controller-side design anticipates it | open |
| `EST-04` | Define the target picture for each existing installed base and the priority of a connector | Driver roadmap | open |
| `EST-05` | Define which access points each porter's lodge may act on | Scope of the control room role | open |
| `EST-06` | Decide who may approve a firmware rollout, and confirm that this is a different person from the one who commissions readers | Four-eyes only works with separate roles, see `PAC-ADM-07` | open |
| `EST-07` | Define the boundary between device administration and the parties who physically install hardware | Answered: building operations administers and registers the controllers; installers get no system access. Recorded as D18 and D19, implemented by `PAC-ADM-11` and `PAC-RDR-08` | done |
| `EST-08` | Confirm site scoping, including ownership of an access point serving more than one site | Answered: separation follows areas, shared access points do not occur. A car park entrance belongs to the estate unit of its area; a door belongs to the unit that formally holds the room. Recorded as D20, implemented by `PAC-ADM-12` and `PAC-ADM-13` | done |
| `EST-09` | Decide whether a site may define its own special events, or whether all events stay institution-wide | Implements `PAC-ADM-10` | open |
| `EST-10` | Identify the authoritative source of room allocation | Answered: a computer-aided facility management system maintained by estate planning holds rooms, floor plans and organizational assignment, and an export in map and file form exists. Recorded as D21, implemented by `PAC-ADM-14` and `PAC-STR-05` | done |
| `EST-11` | Define the facility management import contract: identifiers, format, update cadence, and what happens when a room changes owner | Delegation under `PAC-ADM-13` depends on it, and a room reassignment silently changes who administers a door | open |
| `EST-12` | Decide how much of the floor plan data to carry, and whether plan-based views are wanted in the control room or only in administration | Scopes `PAC-UIX-06` | open |

## Project and governance

Owner: the core team.

| # | Item | Why it matters | Status |
|---|---|---|---|
| `GOV-01` | Set up repository layout, merge rights and the contributor agreement | Open-source project under EUPL-1.2 | open |
| `GOV-02` | Decide which languages the project maintains itself and which are left to community contribution | Implements `PAC-UIX-05`; the rule replaced a fixed language list | open |
| `GOV-03` | Decide whether the htmx fallback is built for the control room only | Implements `PAC-UIX-03` | open |
| `GOV-04` | Review the draft user stories with the audiences named on each page | Turns proposals into agreed scope | open |

## Blocked design decisions

| Decision | Blocked by |
|---|---|
| D16, the tiered provisioning model | `HW-01`, `HW-02` |
| D17, the scope of the htmx fallback | `GOV-03` |
