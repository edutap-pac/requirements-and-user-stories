# Building operations

Review these with the estate administration side of the infrastructural building operations units.

These are usually organized per campus, so hold one session per site and expect the scoping requirement `PAC-ADM-09` to be the most discussed item.

The device side of the same units has its own set in {doc}`device-administration`.

## US-BOP-01 Administer only my own site

As a building operations administrator, I want to see and change only the sites I am responsible for, so that I cannot affect another campus by accident and cannot see what does not concern me.

Acceptance criteria:

- My view contains only my own sites, buildings, zones, access points and controllers.
- Another site's objects are not visible, not searchable and not selectable.
- An attempt to act outside my scope fails and is recorded.

Draws on `PAC-ADM-09`, `PAC-ADM-03`.

## US-BOP-02 Set building opening hours

As a building operations administrator, I want to define when a building's entrances stand unlocked, so that people can enter during the day without presenting a credential.

Acceptance criteria:

- I can define permanent-unlock windows per access point in my scope.
- The windows respect the calendar precedence, so a holiday closes a building that would otherwise be open.
- The control room can override the current state at any time.

Draws on `PAC-TIM-01`, `PAC-CTR-02`.

## US-BOP-03 Register an access point and assign it to a controller

As a building operations administrator, I want to create an access point and bind it to a controller port, a reader and a relay, so that the logical door and the physical device are connected without me touching the device itself.

Acceptance criteria:

- I can create an access point, give it a type, and place it in the building hierarchy.
- I can bind it to a controller that device administration has already commissioned.
- Changing the binding does not change any permission.

Draws on `PAC-DEV-02`, `PAC-DEV-03`, `PAC-STR-01`.

## US-BOP-04 Group access points into a zone

As a building operations administrator, I want to group access points into a zone that cuts across buildings, so that a rule for a library area or a laboratory wing does not have to be repeated per door.

Acceptance criteria:

- A zone can contain access points from several buildings within my scope.
- A rule targeting the zone applies to all its members.
- Adding an access point to a zone applies the zone's existing rules to it.

Draws on `PAC-STR-02`, `PAC-AUT-04`.

## US-BOP-05 Delegate an area without losing oversight

As a building operations administrator, I want to assign access points to an organizational unit, so that a chair can manage access to its own rooms while I remain responsible for the building.

Acceptance criteria:

- I can assign an access point to an organizational unit.
- The area owner can create rules only for their assigned access points.
- The area owner cannot see access points outside their scope.
- I keep control of the building entrances regardless of any delegation inside.

Draws on `PAC-ADM-02`, `PAC-ADM-03`.

## US-BOP-06 Set retention for a sensitive area

As a building operations administrator, I want to set how long access events are kept for a given access point, so that a laboratory with a genuine security need differs from an ordinary teaching room.

Acceptance criteria:

- Retention is configurable per access point within the agreed bounds.
- I cannot exceed the institution-wide maximum.
- Setting retention to zero means no record is created centrally at all.

Draws on `PAC-EVT-02`, `PAC-EVT-03`.
Depends on `LEG-01`.

## US-BOP-07 Find a door on the plan

As a building operations administrator, I want to see my access points on the floor plan the facility management system already holds, so that I can find a door without decoding a room number.

Acceptance criteria:

- An access point references the room it serves, taken from the room register.
- Where a plan exists, I can locate the access point on it.
- I never edit room data here; it comes from facility management.

Draws on `PAC-STR-05`, `PAC-ADM-14`, `PAC-UIX-06`.
Plan-based views are a roadmap capability; version one records the reference.

## Open questions for the review

Does building operations want to approve an area owner's rules, or only to delegate and audit them?
The current design assumes delegation without approval, because approval workflows belong to identity management.

What happens when a room changes owner in facility management?
Under `PAC-ADM-13` the delegation follows, which means an import can silently move administrative control of a door from one chair to another.
Tracked as `EST-11`.
