# Constraints and quality attributes

| ID | Requirement |
|---|---|
| `PAC-NFR-01` | Access decisions are always local. A controller must decide correctly without any connection to PAC. Loss of the central system must not affect operation of already provisioned access points. **Knock-out criterion.** |
| `PAC-NFR-02` | Activation or deactivation of a credential must take effect within 30 minutes under normal conditions. |
| `PAC-NFR-03` | An emergency revocation on individual controllers must take effect within 1 minute. |
| `PAC-NFR-04` | Central service availability is 99.9 percent. An outage of 4 hours is uncritical. An outage becomes critical after 24 hours, aligned with the uninterruptible power supply runtime of the controllers. |
| `PAC-NFR-05` | The design optimizes for loss of power or network in a building, which is the realistic failure, rather than for failure of the central system. |
| `PAC-NFR-06` | PAC stores a canonical person identifier only. It must not store names or student numbers. Resolution to a person happens in the identity management system. |
| `PAC-NFR-07` | Access events must not be routinely evaluable. Evaluation requires a police order or the six-eyes procedure defined in {doc}`events-and-control-room`. |
| `PAC-NFR-08` | The system must be fully auditable against NIS2, ENISA guidance and the applicable national IT baseline protection standard of each operating institution. |
| `PAC-NFR-09` | One set of container images serves both institutions. All site-specific behavior lives in configuration files. Overrides through the database or the user interface are a named exception. |
| `PAC-NFR-10` | A controller simulator is part of version one. Without it, test-driven development is not possible and the development team cannot work without hardware. |
| `PAC-NFR-11` | User interfaces are internationalized from the start. Code and documentation are English. The supported language list is a user interface requirement and is defined in `PAC-UIX-05`. |
| `PAC-NFR-12` | The data model carries all access point types from the start. Version one implements the door behavior profile only. |
