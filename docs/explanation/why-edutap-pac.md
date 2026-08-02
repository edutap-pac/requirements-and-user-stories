# About the need for eduTAP PAC

## The market gap

Almost every access control product on the market is a complete system.
It owns persons, credentials, permissions, doors and decisions, and it expects to be the authority on all of them.
That design serves corporations well.
It serves universities badly.

A university already runs an identity management system that is far more capable than anything an access control vendor ships.
It knows every student, every member of staff, every guest researcher and every affiliate.
It knows enrolment status, employment status and organizational membership, and it keeps them current through primary systems that predate any access control project.
Asking such an institution to maintain a second, parallel population inside a door management product is asking it to maintain a copy that will be wrong within a week.

Universities also differ from corporations in ways that reach deep into the data model:

Their rhythm is the semester, not the calendar year.
A building opens differently during the lecture period than during the lecture-free period, and differently again during examinations.

Their populations are large and volatile.
Tens of thousands of people arrive and leave every year, and re-enrolment alone changes the status of a substantial share of them.

Their authority is distributed.
A chair decides who enters its own laboratory.
Estate management decides when the building itself is open.
Neither can decide for the other.

Their events are irregular and important.
A summer festival, an open day or a university ball changes access for a single evening across a whole site.

Their mobility is constant.
Exchange students, guest researchers, contractors and cleaning staff come and go on their own schedules.

None of these are exotic requirements.
They are simply not what a product designed for an office building optimizes for.

## What follows from that

eduTAP PAC takes the opposite starting point.
The identity management system keeps what it is good at: persons, memberships and credentials.
PAC takes only what the identity management system has no opinion about: which door, at which time, for which group.

This is why permissions in PAC are group-based without exception.
There is no place in the system to grant a person access, because the system does not know persons in that sense.
It knows a canonical identifier and the groups that identifier belongs to, and it turns group membership into entries in a controller.

The result is a smaller system than a commercial product, and a much sharper one.

## The trigger

The immediate trigger differs at each institution.
At one institution the previous controller hardware reached end of life and cannot be purchased any more, which forced a decision about what comes next.
At another a large installed base needs a management layer that university logic can actually be expressed in.

The common trigger is eduTAP itself.
Both institutions are introducing new credentials in mobile wallets and on chip cards.
The moment a university touches its credentials is the moment to also fix what those credentials open.
