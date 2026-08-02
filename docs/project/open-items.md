# Open items

Open items are tracked as **GitHub issues**, not in this document.
That is where the discussion belongs, and keeping a second list here would guarantee the two drift apart.

```{seealso}
[All open items](https://github.com/edutap-pac/requirements-and-user-stories/issues?q=is%3Aissue+is%3Aopen+label%3Aclarification) ·
[Component epics](https://github.com/edutap-pac/requirements-and-user-stories/issues?q=is%3Aissue+is%3Aopen+label%3Aepic)
```

## How items are labelled

Each item carries an identifier of the form `<AREA>-<NN>`, used in the issue title and referenced from the requirements.

| Prefix | Subject | Owner |
|---|---|---|
| `HW` | Hardware and vendor verification | Device administration, through whichever institution holds the closest vendor relationship |
| `IDM` | Identity management integration | IT operations with the identity management team |
| `LEG` | Data protection and staff representation | Data protection officer, staff representation, estate management |
| `EST` | Estate organisation and rollout | Calendar authority, estate administration, device administration |
| `GOV` | Project governance | The core team |

Labels mirror this: `clarification` for questions people must answer, `epic` for components of the system, `decision` for choices to be taken and recorded, and `blocked` where a dependency is unresolved.

```{important}
Keep issues free of confidential vendor information and free of institution-specific data.
Where a verification depends on non-public knowledge, record the question and the outcome, not the vendor internals.
```

## The four most urgent

| # | Item | Why |
|---|---|---|
| `IDM-01` | Define the identity management interface contract | The single ingress into PAC. Nothing integrates end to end until it exists. |
| `HW-01` | Host-based decision for an unknown credential | Blocks the tiered provisioning model, decision D16 |
| `HW-02` | Effective controller capacity under PAC-style use | Blocks capacity planning and the same decision |
| `LEG-01` | Agreed retention periods | Legal basis for the access-event store |

## Items already answered

These were resolved during requirements elicitation and are recorded in {doc}`../explanation/decisions`.
They are listed here so that the reasoning stays findable.

| # | Question | Answer |
|---|---|---|
| `EST-07` | Who administers and registers the controllers, and where does the boundary to the installing parties run? | Building operations administers and registers them. Parties who install hardware get no system access at all. Recorded as D18 and D19, implemented by `PAC-ADM-11` and `PAC-RDR-08`. |
| `EST-08` | Who owns an access point serving more than one site? | The question does not arise: separation follows areas. A car park entrance belongs to the estate unit of its area; a door belongs to the unit that formally holds the room. Recorded as D20, implemented by `PAC-ADM-12` and `PAC-ADM-13`. |
| `EST-10` | What is the authoritative source of room allocation? | The institution's facility management system, maintained by estate planning, which holds rooms, floor plans and organisational assignment. Recorded as D21, implemented by `PAC-ADM-14` and `PAC-STR-05`. |
