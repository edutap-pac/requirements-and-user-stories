# Risks and assumptions

## Assumptions that need verification

The following are assumptions, not established facts.
The design currently rests on them, and each is tracked in {doc}`open-items`.

| Assumption | Tracked as | Consequence if it turns out false |
|---|---|---|
| The controller can defer an unknown credential to a host, or all required credentials fit resident | `HW-01`, `HW-02` | The tiered provisioning model and the capacity planning are both open |
| The published per-controller capacity is sufficient for the mass access points once credential policies are applied | `HW-02` | Mass access points need option C, which is just-in-time provisioning |
| The controller passes OSDP file transfer through to the reader | `HW-03` | Reader firmware maintenance stays an on-site task |
| The controller supports OSDP transparent mode | `HW-04` | Offline card writing needs separate write stations |
| Higher-density controller models can be managed through the open interface | `HW-05` | The scale-out path beyond the pilot changes |
| The controller interface supports mutual TLS | `HW-06` | Communication falls back to HTTPS with authentication |
| Reader commissioning onto a credential segment is usable over the network under the institution's licence | `HW-07` | Reader commissioning stays manual |
| The groups area owners think in already exist in identity management | `IDM-02` | Delegated administration needs group work in identity management before it can start |

## Top risks

**The tiered provisioning decision is unresolved.**
Until `HW-01` and `HW-02` are answered, both the provisioning model and the capacity planning stay open.
Mitigation: the design assumes the simplest option and keeps just-in-time provisioning as a fallback that fits the same desired-state mechanism.

**The identity management contract is the only ingress.**
If `IDM-01` slips, nothing in version one can be integrated end to end, because there is no second path into the system by design.
Mitigation: agree the contract early and stub it with recorded events for development.

**Losing firmware pass-through changes the operating model.**
If `HW-03` comes back negative, reader maintenance becomes an on-site task across hundreds of buildings.
Mitigation: know this before rollout planning, not after.

**Duplicated user interfaces would consume the budget.**
Three interfaces built twice is six interfaces, which a small team cannot carry alongside the rest of version one.
Mitigation: `GOV-03`, limiting the fallback to the control room.

## Risks that are deliberately accepted

Tiered groups lose access when the central system is unavailable.
This degradation is documented and accepted under `PAC-PRV-10`, because the realistic failure is a building outage rather than a data center outage.

A database administrator can technically read access events in version one.
This is covered organizationally and closed technically on the roadmap under `PAC-EVT-07`, subject to `LEG-04`.
