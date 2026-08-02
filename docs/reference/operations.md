# Operations

| ID | Requirement |
|---|---|
| `PAC-OPS-01` | Kafka and PostgreSQL are provided redundantly by the existing cluster at each institution. |
| `PAC-OPS-02` | One set of container images serves both institutions. Configuration lives in files following Linux conventions, as required by `PAC-NFR-09`. |
| `PAC-OPS-03` | Availability is 99.9 percent. The recovery point objective is covered by point-in-time recovery. Restore procedures are exercised rather than assumed. |
| `PAC-OPS-04` | The system exposes operational metrics for provisioning latency, drift rate, controller reachability, per-controller capacity utilization, and the age of the oldest unapplied desired state. |
| `PAC-OPS-05` | Schema migrations are versioned and reversible. Upgrades are rolling. |

## Metrics that steer operations

Provisioning latency
:   Time from an identity event to the change being present in the controller.
    This is the number that proves `PAC-NFR-02` in production rather than on paper.

Drift rate
:   How often the actual state of a controller diverges without PAC causing it.
    A rising drift rate means somebody is working around the system.

Controller reachability
:   Share of controllers reachable, and duration of unreachability.
    Expected to fluctuate with building outages, which is normal rather than alarming.

Capacity utilization per controller
:   How close each controller is to its entry limit.
    Feeds the capacity guard in `PAC-PRV-05`.

Age of the oldest unapplied desired state
:   The single best indicator that provisioning is falling behind.

## Environments

Production runs in the institution's data center on at least three nodes, under Docker Swarm or Kubernetes, operated by the institution's own teams.

Development runs on a laptop with Compose and the controller simulator, with deliberately reduced security requirements.
There is no shared test environment with real hardware, which is why `PAC-NFR-10` exists.
