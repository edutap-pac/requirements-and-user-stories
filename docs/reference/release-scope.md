# Release scope

## Version one

The pilot covers 2 to 5 doors per institution.

| Area | Content |
|---|---|
| Ingest | Kafka ingest against the agreed identity management contract |
| Domain | Full domain model, implemented for the door behavior profile |
| Time | Time models including the academic calendar with precedence |
| Authorization | Group-based rules, credential policy, encoding profile |
| Provisioning | Desired-state reconciler with the first controller driver |
| Devices | Reader inventory and secure channel commissioning |
| Events | Two separated stores, retention, six-eyes procedure, audit log |
| Control room | Real-time states and the three remote actions |
| Emergency | Emergency revocation within one minute |
| Building systems | Intrusion detection arming through reader and relays |
| Interfaces | Administration interface with delegated administration and internationalization |
| Facility data | Import of room allocation and organizational assignment from facility management |
| Testing | Controller simulator |

## Version two

Lockdown.
Presence-conditioned release.
Room booking integration.
Plan-based views for administration and the control room, using the floor plans already imported from facility management.
Tiered provisioning, if the pending decision requires it.
Further access point types, starting with lockers.

## Version three and beyond

Offline operation following the OSS-SO standard.
Connectors for the existing installed base.
Multi-tenancy.
Threshold encryption of access events.
Support for mDoc under ISO 18013-5, PKOC and Aliro.

## What is deliberately absent

Mechanical key management is not planned for any version.
The target state is digital credentials only, recorded as D15 in {doc}`../explanation/decisions`.
