# Events, control room and emergency

## Two separate stores

| | Technical events | Access events |
|---|---|---|
| Content | Door held open, forced door, tamper, controller offline, mains or supply failure, reader unreachable, reconciliation result, drift | Access granted or denied, with the canonical person identifier |
| Storage | Standard observability stack | Separate, access-restricted store |
| Access | Operations, technology and monitoring, without restriction | Six-eyes procedure only |
| Retention | Operational | Configurable per access point |

| ID | Requirement |
|---|---|
| `PAC-EVT-01` | Technical and access events are stored separately. Operation, alarming, monitoring and troubleshooting must work entirely on technical events. |
| `PAC-EVT-02` | Retention for access events is configurable per access point or controller. An unset value means the default of 7 days. The configurable maximum is 6 months. |
| `PAC-EVT-03` | Where retention is explicitly zero, PAC must not fetch that access point's access events at all. Controllers buffer locally regardless. |
| `PAC-EVT-04` | Evaluation of access events is a procedure, not a query. An investigation request states reason, access point and period, and requires approval by estate management, staff representation and IT operations. Only then does a scoped, time-limited query open. |
| `PAC-EVT-05` | The auditor role is scoped per group or area, so that data protection and staff representation each receive a bounded view. |
| `PAC-EVT-06` | An append-only, hash-chained audit log covers configuration changes, desired-state versions, driver actions, remote actions and every evaluation procedure. |
| `PAC-EVT-07` | Cryptographic hardening of the access-event store through threshold encryption is a configurable option on the roadmap. It is not part of version one. |

```{seealso}
{doc}`../explanation/data-protection` explains why the stores are separated and why version one stops short of encryption.
```

## Control room

| ID | Requirement |
|---|---|
| `PAC-CTR-01` | The control room shows access point states and alarms in real time. |
| `PAC-CTR-02` | Three remote actions are available per access point: momentary release, permanently unlocked, and permanently locked. |
| `PAC-CTR-03` | Every remote action is permission-bound, requires a reason, and is audited. |
| `PAC-CTR-04` | Remote actions execute through the driver directly, not through the reconciler. A subsequent reconciliation run must not undo them. |

## Emergency

| ID | Requirement |
|---|---|
| `PAC-CTR-05` | Emergency revocation on individual controllers takes effect within 1 minute, on the priority path defined in `PAC-PRV-03`. |
| `PAC-CTR-06` | As a second and independent lever, PAC triggers and records remote deactivation of the wallet credential through eduTAP. PAC does not own that function. |
| `PAC-CTR-07` | Lockdown is a pre-provisioned controller state, not a centrally computed one. The rule set and the exception group reside permanently in the controller. Lockdown ships in version two. |
| `PAC-CTR-08` | Lockdown has two independent triggers: a hard-wired input from the fire-alarm control panel through the relay modules, which works without network and without PAC, and the application interface or control room. |
| `PAC-CTR-09` | During lockdown a reduced authorization logic applies, covering a police escort group, security staff and named individuals. Release is possible only by named roles. |
| `PAC-CTR-10` | Fire brigade credentials form their own group. The credentials are deposited at the fire-alarm control panel. |
| `PAC-CTR-11` | Although lockdown ships in version two, the data model and the driver interface must carry it from version one, so that version two is an addition rather than a rebuild. |

## Intrusion detection

| ID | Requirement |
|---|---|
| `PAC-CTR-12` | Arming and disarming the intrusion detection system through the access reader and the relay modules is part of version one. |
