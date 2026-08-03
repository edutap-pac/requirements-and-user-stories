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
| D22 | The VAPIX client is a standalone package in its own repository, not part of PAC. | It is not PAC-specific, it can be tested against real hardware independently of the PAC release cycle, and separating it keeps the device gateway to reconciliation logic rather than protocol handling. It is also what makes the open hardware questions answerable before PAC exists. |
| D23 | Open items and component epics are tracked as GitHub issues rather than in the documentation. | Discussion belongs where the stakeholders are. A second list in the documentation would drift from the first. |
| D24 | The VAPIX client is written rather than adopted, after evaluating what already exists. | Nothing available covers the physical access control interfaces asynchronously under a usable licence. See the evaluation below. |

## Why the VAPIX client is written rather than adopted

Building a protocol client that already exists is an expensive way to be wrong, so D22 was checked against what is actually available before any code was written.

**The vendor publishes no VAPIX client, in any language.**
Its public repositories fall into three groups: software development kits for applications that run *on* the device, media streaming libraries for the browser, and documentation.
The interface itself is documented in full, including the physical access control section, and consuming it from a host application is left to integrators.
That is a deliberate position rather than a gap.

**Three community packages exist, and none of them fits.**

| Package | Domain | Style | Licence | Access control coverage |
|---|---|---|---|---|
| The most active one | Cameras, events, pan-tilt-zoom, messaging | Asynchronous, on a different HTTP library | Permissive | None. Its two dozen interface modules contain nothing about doors, schedules or credentials. |
| A smaller camera wrapper | Cameras, pan-tilt-zoom | — | Permissive | None. |
| The one that touches the domain | The previous generation of door controller | **Synchronous** | **None declared** | Doors and schedules, but **no credentials** |

The third is the interesting case, and it fails on two counts that have nothing to do with taste.
Without a declared licence, full copyright applies: it cannot be used, forked or redistributed inside an EUPL project.
And it has no public repository, so there is nothing to contribute to.
Beyond that it targets the previous controller generation, is synchronous where the rest of the stack is asynchronous, and does not cover credentials, which is the one thing PAC provisions most.

Contributing access control support to the camera library was considered and rejected: it would mean pushing an entire unrelated domain into somebody else's project, against a different HTTP library and a different purpose.

**What follows.**
There is no asynchronous Python client for the VAPIX physical access control interfaces under a usable licence.
Writing one is therefore not duplication, and the result has value well beyond this project — which is the argument for keeping it in a repository of its own under D22, and for moving it somewhere neutral later if it earns an audience.

One residual question stays open as `HW-08`: whether something unpublished exists that the vendor could point to.
The public answer is unambiguous, so this is confirmation rather than investigation.

## Decisions still open

| # | Question | Blocked by |
|---|---|---|
| D16 | Tiered provisioning: host-based decision at the door, or everything resident | `HW-01` and `HW-02` in {doc}`../project/open-items` |
| D17 | Whether the htmx fallback is built for the control room only | `GOV-03` in {doc}`../project/open-items` |
