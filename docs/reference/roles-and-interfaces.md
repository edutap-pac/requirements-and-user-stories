# Roles and user interfaces

## Roles

Access control at a university is not owned by one department.
It is split across several units inside the estate organization, and none of them is the IT department.

| Role | Scope | Typical home |
|---|---|---|
| Calendar authority | Academic calendar, holiday calendar, special events. Institution-wide, a small unit. | Central estate management |
| Estate administration, scoped per site | Sites, buildings, zones, access points, closing times, delegation to area owners. | Infrastructural building operations, usually one unit per campus |
| Device administration, scoped per site | Controllers, readers, commissioning, keys, firmware, device inventory. | A specialist team inside infrastructural building operations |
| Area owner, delegated to chair level | Group, own access point, time model. | Faculty, institute, chair |
| Control room | Real-time states, remote actions, later lockdown. | Porter's lodge, security service |
| IT operations | Platform, database, message broker, network segments, the identity management interface. | IT department |
| Auditor, scoped per group or area | Access to personal access events, jointly only. | Data protection, staff representation, IT operations |

## The role that has no access

| Non-role | What they do | What they may touch in PAC |
|---|---|---|
| Installers | Fit doors, controllers, readers, door openers, low-voltage wiring and network cabling. Often contracted external firms, commissioned by a public building authority or a central workshop. | Nothing. |

Installers are a party in every rollout and a user of nothing.
They make a door physically work.
They never configure the system that governs it.

```{important}
Physical installation and system commissioning are separate steps, performed by different parties, at different times.
`PAC-ADM-11` and `PAC-RDR-08` exist so that this separation survives contact with a rollout schedule.
```

## Requirements

| ID | Requirement |
|---|---|
| `PAC-ADM-05` | PAC manages no users. Authentication uses the institution's existing mechanism through OIDC or SAML. PAC roles map to identity management groups. Privileged roles require multi-factor authentication. |
| `PAC-ADM-06` | Access to PAC ends automatically with the employment or enrolment relationship, because the mapping in `PAC-ADM-05` is the only source of authorization. |
| `PAC-ADM-07` | Estate administration, device administration and IT operations are separate roles with disjoint permissions. Operating the platform must not grant any ability to administer an access point, commission a device, roll out firmware or handle key material. |
| `PAC-ADM-08` | Device administration must be able to commission and service devices without any platform or database privilege. |
| `PAC-ADM-09` | Estate administration and device administration are scoped per site. A unit administers only its own sites and must not be able to see or change another site's access points, controllers or delegations. |
| `PAC-ADM-10` | The calendar authority is institution-wide. Academic calendar, holiday calendar and special events apply across all sites. A site may reference them but must not redefine them. |
| `PAC-ADM-11` | Parties who install hardware have no access to PAC. The system must never require an installer account, an installer tool, or any on-site software action to take a device into service. |
| `PAC-ADM-12` | Every access point belongs to exactly one site. The responsible building operations unit follows from that site. Access points shared between sites do not exist. |
| `PAC-ADM-13` | The organizational unit delegated an access point is the unit that formally owns the room behind it. Delegation follows room allocation rather than being chosen freely. |

## Why these roles are separate

The people who fit a controller into a door frame, pull the cable and wire the door opener are frequently not employed by the institution at all.
They are contracted firms working for a building authority or a central workshop, and they leave when the door works mechanically and electrically.

The people who then take that controller into service, give it its keys and bind it to an access point work in building operations.
They are technicians too, but they are staff, they are accountable, and they are the ones who hold the credentials to the system.

Between those two groups runs a trust boundary, and the requirements enforce it in three ways.

**Commissioning happens from the office, not at the door.**
`PAC-RDR-08` requires that a device can be taken into service remotely, after the installers have gone.
Any design that assumes a technician standing at the door with a laptop quietly reopens the boundary.

**A freshly installed device is treated as untrusted until verified.**
`PAC-RDR-09` requires that what was installed can be checked against what was ordered before any key is written to it.

**Nobody needs privileges outside their remit.**
A platform administrator has no reason to hold a secure channel key.
A device administrator has no reason to change a delegation.
An estate administrator has no reason to hold a database credential.

Three further consequences follow from the site scoping.

**Site scoping is real, not cosmetic.**
A campus unit that can see another campus's access points is a finding in an audit, not a convenience.
`PAC-ADM-09` states this explicitly because the default in most products is a single global administrator role.

**Ownership is never ambiguous.**
Every access point belongs to exactly one site, and shared ownership does not occur in practice.
A car park entrance belongs to the estate unit responsible for that area; a door belongs to the organizational unit that formally holds the room behind it.
`PAC-ADM-12` and `PAC-ADM-13` turn that into a rule, which also means delegation is derived from room allocation rather than negotiated case by case.

**The four-eyes rule for firmware becomes meaningful.**
Firmware distribution is key distribution, as {doc}`devices-and-readers` sets out.
An approval only means something when the approver sits in a different reporting line than the requester.

## User interfaces

| ID | Requirement |
|---|---|
| `PAC-UIX-01` | The system is API-first. Every function of every interface is available through the application interface. |
| `PAC-UIX-02` | Three interfaces exist: administration, control room, and device administration. React with WebSocket support is the primary implementation. |
| `PAC-UIX-03` | An htmx variant is built only where it adds value. The proposal is the control room as a degraded-operation view that needs no build step and minimal client capability. The decision is open under `GOV-03`. |
| `PAC-UIX-04` | Interfaces are internationalized from the start, following `PAC-NFR-11`, with a community translation workflow. |
| `PAC-UIX-05` | English is the source language of the interfaces. The shipped language set is not fixed in code: an institution operating the system adds its own language through the translation workflow without a code change. The project maintains translations for English and for the languages of the institutions operating the system; every further language is community-contributed. The language follows the user account, not the server. |
| `PAC-UIX-06` | Plan-based views are a roadmap capability. Version one carries the room reference from `PAC-STR-05` so that floor plans can be added later without a data migration. |

Administration
:   Sites, buildings, zones, access points, time models, group assignment, delegation.
    Form-driven work by people who use it occasionally.
    Audience: the calendar authority, estate administration and area owners, each seeing only their own scope.

Control room
:   Real-time states and alarms, three remote actions, and later lockdown.
    Used under stress, so it must stay legible when something is going wrong.
    Audience: porter's lodge and security service.

Device administration
:   Controllers, readers, firmware, keys, commissioning, inventory.
    Used by people who know exactly what they are doing and need precision rather than guidance.
    Audience: the device administration team inside building operations.

IT operations has no interface of its own.
It works through the platform's own tooling, the observability stack and the application interface.
