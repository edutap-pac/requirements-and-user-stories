# IT operations

Review these with the team that runs the platform.

IT operations provides the servers, the database, the message broker and the network segments the controllers live in, and it operates the interface to identity management.
It never touches a controller.
That work belongs to {doc}`device-administration`.

## US-ITO-01 Operate the system without seeing personal data

As a platform operator, I want monitoring, alerting and fault diagnosis to work entirely on technical events, so that running the system does not give me access to who went where.

Acceptance criteria:

- All operational metrics and alarms are available without any personal identifier.
- Technical events reach the standard observability stack.
- Nothing in my normal working set requires the access-event store.

Draws on `PAC-EVT-01`, `PAC-OPS-04`, `PAC-NFR-07`.

## US-ITO-02 Feed identity data through one channel

As a platform operator, I want exactly one ingress for identity data, so that there is a single contract to operate and a single place to look when something is missing.

Acceptance criteria:

- Identity events arrive through the agreed message contract and nowhere else.
- An institution whose identity management cannot produce events uses an adapter that writes into the same channel, not a second path into PAC.
- Replayed or out-of-order events are handled without manual repair.

Draws on `PAC-ING-01`, `PAC-ING-02`, `PAC-ING-05`.
Depends on `IDM-01`.

## US-ITO-03 Know that provisioning is keeping up

As a platform operator, I want to see how far provisioning is behind, so that I notice a backlog before an area owner reports that a change did not take effect.

Acceptance criteria:

- Provisioning latency from event to controller is a metric.
- The age of the oldest unapplied desired state is a metric.
- Both have thresholds that alert before the 30-minute commitment is at risk.

Draws on `PAC-OPS-04`, `PAC-NFR-02`.

## US-ITO-04 Survive an outage without drama

As a platform operator, I want a central outage to be uneventful, so that a failed upgrade or a database restore does not become a building access incident.

Acceptance criteria:

- Doors continue to work throughout a complete outage of the central system.
- After restore, controllers converge without manual intervention.
- The restore procedure is exercised rather than assumed.

Draws on `PAC-NFR-01`, `PAC-NFR-04`, `PAC-PRV-07`, `PAC-OPS-03`.

## US-ITO-05 Keep the controller network isolated

As a platform operator, I want controllers to be unreachable from the campus network, so that a compromised workstation cannot talk to a door.

Acceptance criteria:

- Only the device gateway can reach a controller.
- The administration interface never needs a route into the controller segment.
- Devices are registered in advance and unknown devices get no address.

Draws on `PAC-SEC-01`, `PAC-SEC-02`, `PAC-SEC-03`.

## Development environment

Review this one with the core development team rather than with platform operations.

### US-ITO-06 Develop without hardware

As a developer, I want to run the whole system against a controller simulator on my laptop, so that I can write tests first and work without access to a hardware lab.

Acceptance criteria:

- The simulator implements the same driver interface as the real device.
- It can simulate an offline controller, a full controller, and drift.
- The development environment starts from a single command.

Draws on `PAC-NFR-10`, `PAC-DRV-05`.

## Open question for the review

Where does responsibility for the device gateway sit?
It runs on the platform, which suggests IT operations, but it holds key material and speaks to controllers, which suggests device administration.
The current design places operation with IT operations and all device and key actions with device administration, separated by `PAC-ADM-07` and `PAC-ADM-08`, but this boundary deserves an explicit agreement.
