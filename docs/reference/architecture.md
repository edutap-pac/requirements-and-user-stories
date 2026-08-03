# Architecture

## Components

```{mermaid}
:alt: Identity management feeds PAC Core through Kafka. PAC Core drives the device gateway, which talks to controllers and readers.

graph TD
    IDM[Identity management<br/>eDirectory / Active Directory] -->|Kafka| CORE
    EDUTAP[eduTAP / card office<br/>issues credentials] -.->|credential identifiers| IDM
    UI[Campus network<br/>via jump server] -->|HTTPS| CORE
    CORE[PAC Core<br/>domain · policy · desired state<br/>events · audit] --> DB[(PostgreSQL)]
    CORE -->|internal API| GW
    GW[PAC Device Gateway<br/>reconciler · driver · reader lifecycle<br/>holds key material] -->|HTTPS, target mTLS| CTRL
    CTRL[Door controllers<br/>autonomous · UPS] -->|OSDP-SC| RDR[Readers]
```

## Why two deployables

The split follows two boundaries that happen to coincide.

The network boundary comes first.
Controllers live in isolated networks reachable only from designated systems.
The administration interface must be reachable from the campus network.
A single deployable would have to straddle both, which the network design does not allow.

The security boundary comes second.
The gateway is the only component that decrypts key material, and the only one that speaks to devices.
Keeping it separate means the core, which carries the larger attack surface through its user interfaces, never holds a secure channel key.

Inside the core it remains a modular monolith.
Module boundaries are enforced in code, not by network calls.
At the current team size, further decomposition would add operational cost without enforcing any boundary that matters.

The one piece deliberately kept outside both deployables is the **VAPIX client**, which lives in its own repository and is consumed as a library.
It is not specific to access control, it can be exercised against real hardware without a PAC release, and separating it stops protocol handling from creeping into reconciliation logic.

## Technology

| Layer | Choice |
|---|---|
| Language | Python 3.12 or later, async throughout |
| Web framework | FastAPI |
| Models and validation | Pydantic v2 |
| Configuration | pydantic-settings, backed by configuration files per `PAC-NFR-09` |
| Persistence | SQLModel or SQLAlchemy on PostgreSQL |
| Messaging | Kafka |
| Controller protocol | A standalone VAPIX client package in its own repository, built on `httpx.AsyncClient` with digest authentication and Pydantic v2 models. See D22. |
| Primary user interface | React with WebSockets |
| Fallback user interface | htmx, where justified under `PAC-UIX-03` |
| Documentation | Sphinx with MyST |

## Deployment

| | Production | Development |
|---|---|---|
| Platform | Data center, at least three nodes, Docker Swarm or Kubernetes | Laptop, Compose |
| Security | Full hardening, network zones, mTLS | Deliberately reduced |
| Controllers | Real hardware | Simulator per `PAC-NFR-10` |
