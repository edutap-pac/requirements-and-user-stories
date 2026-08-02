# Provisioning

## Deriving the desired state

```text
for controller C:
  AccessPoints(C)
    → AccessRules (direct and through zones)
      → Groups → persons (identity management memberships)
        → Credentials filtered by CredentialPolicy(AccessPoint)
          → EncodingProfile(technology × reader × controller capability)
            → concrete identifier entries
  + time models resolved to controller schedules
  + door parameters, permanent-unlock windows, lockdown rule set, input and output assignment
```

## Requirements

| ID | Requirement |
|---|---|
| `PAC-PRV-01` | PAC maintains a versioned desired state per controller. Every change records who changed it, when, and why. |
| `PAC-PRV-02` | Reconciliation runs on four triggers: an identity event, an emergency revocation, a periodic full run, and a controller returning from an unreachable state. |
| `PAC-PRV-03` | An emergency revocation takes a priority path that overtakes all running reconciliation work and meets `PAC-NFR-03`. |
| `PAC-PRV-04` | Drift is a security event. PAC corrects the controller and raises an alarm. |
| `PAC-PRV-05` | A capacity guard knows each controller's limit and refuses a desired state that would exceed it, before applying anything. |
| `PAC-PRV-06` | Reconciliation is idempotent, rate-limited, and fair across controllers. |
| `PAC-PRV-07` | A controller that has been unreachable converges automatically on return, without manual intervention. |
| `PAC-PRV-08` | Just-in-time provisioning, where used, is expressed as a desired-state entry with an expiry, triggered by an access event at an outer access point. |
| `PAC-PRV-09` | Assignment of a group to resident or tiered mode is an explicit configuration decision by estate administration or device administration. PAC must not classify automatically. |
| `PAC-PRV-10` | Where tiered mode is used, the degradation on central outage is documented and accepted. An access point where that degradation is unacceptable must be fully resident. |

## Triggers and deadlines

| Trigger | Effect | Deadline |
|---|---|---|
| Identity event from Kafka | Targeted run for the affected controllers | 30 minutes per `PAC-NFR-02`, in practice seconds |
| Emergency revocation | Priority path | 1 minute per `PAC-NFR-03` |
| Periodic full run | Drift detection across all controllers | Operational |
| Controller returns online | Automatic convergence | Immediate |

## Tiered provisioning

Groups are either resident, meaning always held in the controller, or tiered, meaning resolved centrally for rarely used groups.
Four options were evaluated.

| Option | Approach | Assessment |
|---|---|---|
| A | Host-based decision at the door | Simplest if the controller supports it. Not described in public vendor documentation. To be verified under `HW-01` and `HW-02`. |
| B | An application running on the controller | Technically sound, but it contradicts the constraint that the project develops software only, and it places project code on security-relevant hardware. |
| C | Event-driven just-in-time provisioning | Stays within the documented controller interface and does not violate `PAC-NFR-01`. Trades controller memory for provisioning load. |
| D | Everything resident | Simplest. Feasibility depends on confirmed controller capacity combined with the credential policy of each access point. |

```{note}
The decision is pending on `HW-01` and `HW-02`.
Until it is taken, the design assumes option D with option C as the fallback.
```
