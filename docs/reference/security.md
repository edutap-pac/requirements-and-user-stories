# Security

| ID | Requirement |
|---|---|
| `PAC-SEC-01` | Controllers live in separate network segments without free address assignment. Devices are registered by hardware address in advance. |
| `PAC-SEC-02` | There is no direct connection from the campus network to a controller. The device gateway is the only path. |
| `PAC-SEC-03` | The PAC environment is reachable only from designated networks through jump servers. |
| `PAC-SEC-04` | Controller communication uses HTTPS with authentication as a minimum. Mutual TLS from the institution's own certificate authority is the target state. Feasibility is open under `HW-06`. |
| `PAC-SEC-05` | OSDP Secure Channel is mandatory. A reader operating without it is a fault condition and raises an alarm. The default installation key is permitted only during commissioning. |
| `PAC-SEC-06` | Secure channel base keys are individual per reader, stored with envelope encryption, rotatable, and never written to logs. |
| `PAC-SEC-07` | The supply chain requires signed firmware artifacts, a software bill of materials, dependency scanning in continuous integration, and minimal container images that do not run as root. |

## Threat model

| Threat | Mitigation |
|---|---|
| Tampering with a reader | The reader reports tamper status, which becomes a technical event and an alarm. |
| Eavesdropping or injection on the reader bus | Mandatory OSDP Secure Channel with individual keys per reader. |
| Network access inside the controller segment | Hardware address registration, no free address assignment, mutual TLS as the target state. |
| Manipulation through a controller's own web interface | The reconciler detects drift, corrects it, and raises an alarm. |
| A compromised administrator | Append-only audit log, and four-eyes approval for firmware and key rollout. |
| Curiosity about access records | Six-eyes procedure, separated stores, and minimization at the source. |

## What is deliberately not mitigated in version one

A database administrator with direct storage access can read access events.
The organizational rules forbid it, and `PAC-EVT-07` describes the technical closure as a roadmap option.

This is recorded so that an auditor sees a considered decision rather than an oversight.
