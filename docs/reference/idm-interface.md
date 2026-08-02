# Identity management interface

| ID | Requirement |
|---|---|
| `PAC-ING-01` | Kafka is the single ingress channel for identity data. |
| `PAC-ING-02` | An institution whose identity management cannot produce events uses a pull adapter that writes into Kafka. The adapter is not part of the PAC core and must not write to PAC directly. |
| `PAC-ING-03` | The PAC team defines the interface contract. The identity management team operates it. The schema follows the identity federation agreements of GÉANT and the national research and education networks. |
| `PAC-ING-04` | Identity data must be current to the day. Propagation latency follows `PAC-NFR-02`. |
| `PAC-ING-05` | Ingest is idempotent and tolerant of replay and out-of-order delivery. Reconciliation repairs any loss, as defined in {doc}`provisioning`. |

## Data PAC consumes

| Element | Purpose |
|---|---|
| Canonical person identifier | The only identity PAC holds. |
| Group membership | The sole basis of every permission. |
| Credential identifier, technology, validity and status | Input to the encoding profile. |

## Data PAC never receives

Names, student numbers, contact details, employment details, and anything else that would allow PAC to identify a person on its own.

```{important}
Keeping this list empty is a requirement, not an implementation detail.
`PAC-NFR-06` depends on the interface contract never widening.
```
