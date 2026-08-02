# Device administration

Review these with the specialist team inside building operations that administers controllers and readers.

These are staff, not contractors.
Installers make a door work physically and then leave; this team takes the device into service from the office.
`PAC-ADM-11` and `PAC-RDR-08` keep that boundary intact.

## US-DEV-01 Take over a door the installers have left behind

As a device administrator, I want to take a newly installed controller into service without going to the door, so that the boundary between the installing firm and the institution stays intact.

Acceptance criteria:

- I can commission the device entirely from my workplace.
- No installer account, installer tool or on-site software step is involved anywhere in the process.
- The device is usable only after I have commissioned it, never before.

Draws on `PAC-ADM-11`, `PAC-RDR-08`.

## US-DEV-02 Check what was actually installed

As a device administrator, I want to compare what a new device reports about itself with what was ordered for that position, so that I notice a wrong model or an unexpected firmware before I write a key to it.

Acceptance criteria:

- PAC records manufacturer, model, firmware and capabilities as reported by the device.
- I can compare that against what the installation position expects.
- A mismatch blocks commissioning until I accept it explicitly, with a reason.

Draws on `PAC-RDR-01`, `PAC-RDR-09`.

## US-DEV-03 Commission a door without vendor tooling

As a device administrator, I want to take controllers and readers into service from PAC, so that I do not need a separate vendor tool and a separate set of credentials for every installation.

Acceptance criteria:

- PAC sets an individual secure channel key per reader and confirms it.
- A reader that has not received its own key is visibly not commissioned.
- I need no platform or database privilege to do any of this.

Draws on `PAC-RDR-02`, `PAC-RDR-03`, `PAC-ADM-08`.

## US-DEV-04 Replace a failed controller

As a device administrator, I want to register a replacement controller and have it converge on its own, so that a hardware fault does not turn into a permissions rebuild.

Acceptance criteria:

- I register the replacement against the same installation position.
- PAC detects that the device is empty and provisions the complete desired state without me listing anything.
- Permissions are unchanged throughout, because a device change is not a permission change.
- The physical swap can be done by an installer without any system access.

Draws on `PAC-DEV-03`, `PAC-PRV-07`, `PAC-ADM-11`.

## US-DEV-05 Know what a door actually contains

As a device administrator, I want to see the difference between what PAC intends and what a controller holds, so that I can prove the system is in the state it claims.

Acceptance criteria:

- I can view desired state and actual state side by side for one controller.
- Any drift is shown explicitly, together with when it was first detected.
- Drift raises an alarm rather than being corrected quietly.

Draws on `PAC-PRV-01`, `PAC-PRV-04`.

## US-DEV-06 Learn about a capacity limit before it bites

As a device administrator, I want a warning before a controller runs out of room, so that a mass access point does not fail during a rollout.

Acceptance criteria:

- PAC compares the computed desired state against the controller limit before applying it.
- Exceeding the limit is refused with a clear message naming the controller and the shortfall.
- Utilization per controller is visible to me without asking IT operations for a dashboard.

Draws on `PAC-PRV-05`, `PAC-OPS-04`.

## US-DEV-07 Roll out reader firmware safely

As a device administrator, I want to distribute reader firmware in stages with a rollback path, so that a firmware containing new card keys does not take out an entire campus.

Acceptance criteria:

- Firmware artifacts are signed and their origin is verifiable.
- A rollout targets a defined set of readers rather than everything.
- A second person from a different reporting line approves the rollout before it starts.
- I can see which reader carries which firmware and key generation.

Draws on `PAC-RDR-05`, `PAC-RDR-06`, `PAC-SEC-07`, `PAC-ADM-07`.
Depends on `HW-03`.

## US-DEV-08 Keep an inventory that matches reality

As a device administrator, I want the device inventory to reflect what is actually installed, so that planning a rollout does not start with a survey of the estate.

Acceptance criteria:

- Every controller and reader records model, firmware and key generation as reported by the device.
- A device that stops answering is visible as such, with the time it was last reached.
- The inventory distinguishes a device that is offline from one that was removed.
- I see only devices in my own sites.

Draws on `PAC-DEV-04`, `PAC-RDR-01`, `PAC-ADM-09`, `PAC-OPS-04`.

## Open question for the review

Who may approve a firmware rollout, and is that the same person who may commission a reader?
Four-eyes approval only means something if the two roles sit in genuinely separate reporting lines.
Tracked as `EST-06`.
