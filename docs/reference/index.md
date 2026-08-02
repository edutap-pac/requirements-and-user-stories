# Reference

This part of the documentation states what the system must do.
It is factual and numbered.
For the reasoning behind these requirements, read {doc}`../explanation/index`.

## Requirement identifiers

Every requirement carries a stable identifier of the form `PAC-<AREA>-<NN>`.

| Area | Subject | Page |
|---|---|---|
| `NFR` | Constraints and quality attributes | {doc}`quality-attributes` |
| `STR` | Spatial structure | {doc}`domain-model` |
| `DEV` | Device layer | {doc}`domain-model` |
| `AUT` | Authorization | {doc}`domain-model` |
| `TIM` | Time | {doc}`domain-model` |
| `CRD` | Identity and encoding | {doc}`domain-model` |
| `ING` | Identity management interface | {doc}`idm-interface` |
| `PRV` | Provisioning | {doc}`provisioning` |
| `DRV` | Device drivers | {doc}`devices-and-readers` |
| `RDR` | Reader lifecycle | {doc}`devices-and-readers` |
| `EVT` | Events and data protection | {doc}`events-and-control-room` |
| `CTR` | Control room and emergency | {doc}`events-and-control-room` |
| `ADM` | Administration and roles | {doc}`roles-and-interfaces` |
| `UIX` | User interfaces | {doc}`roles-and-interfaces` |
| `SEC` | Security | {doc}`security` |
| `OPS` | Operations | {doc}`operations` |

Identifiers are never reused.
A withdrawn requirement keeps its number and is marked as withdrawn.

```{toctree}
:maxdepth: 1

context
quality-attributes
domain-model
idm-interface
provisioning
devices-and-readers
events-and-control-room
roles-and-interfaces
architecture
security
operations
release-scope
```
