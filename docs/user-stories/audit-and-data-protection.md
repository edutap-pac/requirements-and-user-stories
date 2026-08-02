# Audit and data protection

Review these with staff representation and the data protection officer of each operating institution.

These stories are the ones most likely to change the design, so hold this session early.

## US-AUD-01 Rely on access records not being read

As a staff representative, I want it to be technically impossible to browse access records in day-to-day operation, so that the agreement we sign is enforced by the system and not only by good intentions.

Acceptance criteria:

- No interface offers a general search over access events.
- Operations, monitoring and fault diagnosis work entirely without personal data.
- An attempt to access personal events outside the formal procedure fails and is recorded.

Draws on `PAC-NFR-07`, `PAC-EVT-01`, `PAC-EVT-04`.

## US-AUD-02 Approve a specific investigation

As a staff representative, I want to approve a narrowly defined enquiry together with estate management and IT operations, so that a genuine incident can be investigated without opening general access.

Acceptance criteria:

- A request names a reason, an access point and a time period, and nothing wider.
- All three parties approve before anything opens.
- The resulting query is limited to what was approved and expires on its own.
- Approvals, query and result are recorded permanently.

Draws on `PAC-EVT-04`, `PAC-EVT-06`.

## US-AUD-03 See that the procedure was followed

As a data protection officer, I want to see which investigations took place, without seeing the access records themselves, so that I can supervise the process rather than participate in every case.

Acceptance criteria:

- I can see requests, approvals, scope and timing.
- I cannot see the personal events unless I am one of the approving parties.

Draws on `PAC-EVT-05`, `PAC-EVT-06`.

```{note}
This story is why `PAC-EVT-05` scopes the auditor role.
A single unrestricted auditor role would give oversight and access to the same person, which defeats the arrangement.
```

## US-AUD-04 Keep records only as long as agreed

As a staff representative, I want retention set per location, so that a laboratory with a genuine security need can keep records longer while an ordinary teaching room keeps almost nothing.

Acceptance criteria:

- Retention is configurable per access point, defaulting to seven days.
- The configured maximum cannot be exceeded through the interface.
- Where retention is set to zero, no record is created centrally at all.

Draws on `PAC-EVT-02`, `PAC-EVT-03`.

## US-AUD-05 Demonstrate the system to an auditor

As a data protection officer, I want to show what a given door was configured to allow on a given date, so that I can answer an audit without touching personal data.

Acceptance criteria:

- Desired state is versioned and can be shown for a past date.
- Each version records who changed it, when and why.
- Nothing in this view contains a person.

Draws on `PAC-PRV-01`, `PAC-NFR-08`.

## Open questions for the review

Is the six-eyes procedure sufficient in version one, or is cryptographic enforcement required from the start?
The roadmap option exists in `PAC-EVT-07`, and this is the session where that decision belongs.
Tracked as `LEG-04`.

Which retention period applies where, and who decides it?
The default of seven days is a proposal, not an agreement.
Tracked as `LEG-01`.
