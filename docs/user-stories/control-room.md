# Control room

Review these with the porter's lodge and the security service.
These people use the system under stress, often at night, and rarely by choice.

## US-CTR-01 Let someone in remotely

As a porter, I want to release a door briefly from my workstation, so that I can let in a delivery or someone who forgot their credential, without walking there.

Acceptance criteria:

- I can trigger a momentary release for an access point I am responsible for.
- I state a reason, chosen from a short list or typed.
- The door reports back that it opened, or that it did not.
- The action is recorded with my name and the reason.

Draws on `PAC-CTR-02`, `PAC-CTR-03`.

## US-CTR-02 Hold a door open or keep it shut

As a porter, I want to set a door to permanently unlocked or permanently locked, so that I can react to a delivery window, an event, or an incident.

Acceptance criteria:

- I can set and clear both states.
- The current state is visible at a glance and clearly distinguishable from the scheduled state.
- A background provisioning run does not silently undo my setting.

Draws on `PAC-CTR-02`, `PAC-CTR-04`.

```{important}
`PAC-CTR-04` exists because of this story.
A porter who finds their setting reverted a few minutes later stops trusting the system, and then stops using it.
```

## US-CTR-03 See what is wrong right now

As a security officer, I want a live view of alarms and door states, so that I notice a forced door or a failed controller without checking a report.

Acceptance criteria:

- Alarms appear without me reloading anything.
- I can tell the difference between a door held open too long, a forced door, a tamper alarm and a controller that has gone offline.
- The view shows technical state only and no personal data.

Draws on `PAC-CTR-01`, `PAC-EVT-01`.

## US-CTR-04 Keep working when things degrade

As a security officer, I want the control room to remain usable on a simple device or a degraded network, so that an incident that takes out part of the infrastructure does not also take out my ability to respond.

Acceptance criteria:

- A reduced view exists that needs no client build and minimal browser capability.
- The three remote actions work in that view.

Draws on `PAC-UIX-03`.
Depends on decision `GOV-03`.

## US-CTR-05 Block a credential immediately

As a security officer, I want to block a specific credential at specific access points within a minute, so that a lost card or an acute incident does not wait for the normal update cycle.

Acceptance criteria:

- The block takes effect at the named controllers within one minute.
- I see confirmation per controller, including any controller that could not be reached.
- The action is recorded.

Draws on `PAC-NFR-03`, `PAC-CTR-05`, `PAC-PRV-03`.

## Open questions for the review

Which access points may a given porter's lodge act on?
The scope has to be defined per lodge, and nobody has drawn those boundaries yet.

Does the control room need to see a photograph or a name when acting, and if so, on what legal basis?
The current design says no, and this is the story where that will be challenged.
