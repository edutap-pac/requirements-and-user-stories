# User stories

```{warning}
Every story on these pages is a **draft written for discussion**.
None of them has been agreed with the stakeholders yet.
They exist so that the conversation starts from something concrete rather than from a blank page.

Agreeing them is tracked as `GOV-04` in {doc}`../project/open-items`.
```

## How to read a story

Each story states a role, a capability and a benefit, followed by acceptance criteria and the requirements it draws on.

Stories are grouped by audience, because that is how the review sessions will run.
Each audience reviews its own set.
A story that no audience claims is a story nobody needs.

Three of the audiences are easy to confuse, so they are kept apart deliberately:

Calendar authority
:   A small institution-wide unit that owns the academic and holiday calendars.

Estate administration
:   Administers sites, buildings, zones, access points and delegation, usually one unit per campus.

Device administration
:   Commissions and services controllers and readers, a specialist team inside the same unit.

None of these is the IT department.

There is also a party with no stories at all: the **installers** who fit doors, controllers and wiring.
They have no access to PAC by design, which is itself a requirement rather than an omission.
See {doc}`../reference/roles-and-interfaces` for the full role model.

Identifiers follow the pattern `US-<ROLE>-<NN>` and are never reused.

## What these stories deliberately do not cover

Nothing about issuing credentials, managing persons, or approving access requests.
Those belong to other systems, as set out in {doc}`../explanation/system-boundary`.

If a story in review turns out to need one of them, that is a signal about the *other* system, not about PAC.

```{toctree}
:maxdepth: 1

calendar-authority
building-operations
area-owners
control-room
device-administration
it-operations
audit-and-data-protection
```
