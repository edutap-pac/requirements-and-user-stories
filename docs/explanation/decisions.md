# About the decisions taken

This page records the decisions that shaped the design, together with the reasoning behind them.
It exists so that a future contributor can tell the difference between a deliberate choice and an accident.

| # | Decision | Rationale |
|---|---|---|
| D1 | PAC manages doors, time and group permissions. Identity management owns persons and memberships. | Universities run far stronger identity management than any access control product provides. See {doc}`why-edutap-pac`. |
| D2 | Access decisions are always local, never central. | Knock-out criterion. The realistic failure is building power or network, not the data center. See {doc}`system-boundary`. |
| D3 | Kafka is the single ingress. Pull adapters write into Kafka, never into PAC. | One ingress path and one contract, regardless of how capable a given institution's identity management is. |
| D4 | One canonical identifier; encodings derived per target. | Removes the multi-encoding problem at its cause rather than its symptom. See {doc}`credential-encoding`. |
| D5 | Every access point carries a credential policy. | A functional requirement and a capacity bound in one mechanism. |
| D6 | The academic calendar is a first-class time dimension. | This is the difference between university logic and a weekly schedule with date ranges. |
| D7 | Desired-state reconciliation instead of delta push. | Self-healing, auditable, and survives building outages. See {doc}`provisioning-model`. |
| D8 | Two deployables: core and device gateway. | Follows the network segmentation, and isolates key material in the only component that needs it. |
| D9 | Safety is out of scope. | Software must never be able to trap a person. |
| D10 | Six eyes enforced organizationally at the API in version one; cryptographic hardening on the roadmap. | Proportionate. The legal duty exists either way. See {doc}`data-protection`. |
| D11 | EUPL-1.2. | Shared European higher-education infrastructure, weak copyleft, legally binding in 23 languages. |
| D12 | API-first; the htmx variant is built only where it adds value. | Three interfaces built twice would consume the development budget. |
| D13 | Driver abstraction from day one. | The installed base will be replaced over years, and connectors for other vendors are planned. |
| D14 | Multi-tenancy is not in version one. | One instance per institution is sufficient, and multi-tenancy would constrain every model decision. |
| D15 | No mechanical key management, ever. | The target state is digital credentials only. |
| D18 | Controllers are administered and registered by building operations, not by building services engineering and not by IT. | The unit that runs the estate runs the devices that govern it. Recorded after clarifying the real organizational split. |
| D19 | Installers have no access to PAC, and commissioning happens from the office. | Physical installation is frequently contracted out. The trust boundary between fitting a device and taking it into service must be a property of the system, not of the rollout schedule. |
| D20 | Every access point belongs to exactly one site, and delegation follows formal room allocation. | Shared ownership does not occur in practice, and negotiating delegation case by case would scale poorly across thousands of doors. |
| D21 | Room allocation and floor plans are imported from facility management, never edited in PAC. | The same principle as the identity boundary, applied to space: reference what another system owns instead of becoming a second place where it is edited. |

## Decisions still open

| # | Question | Blocked by |
|---|---|---|
| D16 | Tiered provisioning: host-based decision at the door, or everything resident | `HW-01` and `HW-02` in {doc}`../project/open-items` |
| D17 | Whether the htmx fallback is built for the control room only | `GOV-03` in {doc}`../project/open-items` |
