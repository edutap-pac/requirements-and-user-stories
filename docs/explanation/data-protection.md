# About access records and data protection

## The starting position

At both institutions, who opened which door and when is close to untouchable.
Reading such records requires a police order, or a six-eyes procedure involving estate management, staff representation and IT operations.

This is not a constraint the project works around.
It is a design input, and taken seriously it produces a better system.

## Separating the two kinds of event

A door produces two very different kinds of information, and conflating them is what makes access control systems privacy problems.

Technical events say something about the building.
A door was held open too long.
A door was forced.
A reader reported tampering.
A controller went offline.
Mains power failed and the uninterruptible supply took over.
A reconciliation run found drift.

Access events say something about a person.
This identifier was granted or denied entry here, at this time.

PAC stores them in separate places.
Technical events go into a standard observability stack, where operations, monitoring and troubleshooting can use them freely, because none of them carry a personal reference.
Access events go into a separate, access-restricted store.

The consequence is worth stating plainly: **nobody in normal operation ever needs the personal store.**
Alarms, dashboards, fault diagnosis and capacity planning all run on technical events.
The restricted store is touched only when there is a formal reason to touch it.

## Minimization at the source

Retention is configurable per access point.
The default is seven days, and particular areas may go up to six months.

Where retention is set to zero, PAC does not collect that access point's access events at all.
This is a deliberate inversion of the usual pattern.
Rather than collecting everything centrally and deleting it on schedule, PAC never creates the record.
The controller buffers locally regardless, so nothing operational is lost.

Data that was never collected cannot leak, cannot be subpoenaed by accident, and cannot be forgotten in a backup.

## Six eyes as a procedure, not a query

The interesting part of the six-eyes rule is that it is usually implemented as a promise.
An organization writes it into an agreement, and then a database administrator can still read everything.

PAC implements it as a procedure at the application interface.
An evaluation is not a query but a request: it states a reason, an access point and a period.
Estate management, staff representation and IT operations each approve.
Only then does a narrow, time-limited query open.
Every approval, every query and every result is recorded in an append-only audit log.

The auditor role is scoped by group or area, so that data protection and staff representation each receive a bounded view rather than a master key.

## What version one does not do

A database administrator with direct access to the storage can still read the data.
They are not permitted to, and the organizational rules cover that case.

Closing this hole technically requires encrypting access events and splitting the key across the three roles, so that decryption is impossible without all three.
That is a genuine improvement and it carries a genuine risk: lose a share, lose the data.

It is therefore a roadmap option that can be switched on by configuration, not a version one requirement.
Choosing the simpler mechanism first is a considered decision, recorded as D10 in {doc}`decisions`.

```{seealso}
The corresponding requirements are in {doc}`../reference/events-and-control-room`.
```
