# About the system boundary

## PAC is not in the critical path

The single most important property of this design is that PAC is never asked whether someone may enter.
The controller at the door holds the permissions, holds the schedules, has its own uninterruptible power supply, and decides on its own.
PAC provisions it and then gets out of the way.

This is a knock-out criterion, not a preference.
It is also the property that makes everything else affordable.
Because no door waits for a server, the central system does not need extreme availability, does not need geographic redundancy, and does not need to be reachable from the buildings at all times.

The failure that actually happens is instructive.
Central virtual machines in a university data center are extraordinarily reliable.
What fails is a building: a power cut, a switch, a cut fiber, a construction crew.
A design that centralizes decisions optimizes against the failure that does not occur and ignores the one that does.

If PAC is completely unavailable, every door continues to behave exactly as it was last provisioned.
Only *changes* are delayed.

## What sits outside

Several things that a commercial product would absorb stay outside PAC on purpose.

Credential issuing belongs to eduTAP and the card issuing office.
PAC consumes identifiers and never mints them.

Persons and group memberships belong to identity management.
PAC references groups by a stable identifier and never edits a membership.

Application and approval workflows belong to identity management as well.
Whether a professor approved a laboratory request, and whether a safety briefing was completed, are conditions on group membership.
By the time PAC sees anything, the answer is already yes.

Mechanical key management stays outside because the institutions do not want it.
The target state is digital credentials only, with no keys and no transponders to hand out.

Card key material stays with the issuing office, with two deliberate exceptions described in {doc}`../reference/devices-and-readers`.

## Safety is not security

PAC is a security system.
It is never a safety system.

Escape routes, panic hardware and unlocking on fire alarm are solved mechanically and electromechanically, independently of PAC and independently of mains power.
Software must never be able to trap a person in a building.
There is always a way out, including during a total power failure.

What PAC contributes during a fire is the opposite direction: keeping unauthorized people from walking *into* an evacuated building.
That is a security function, and it is why the fire brigade needs credentials of its own rather than an exception in the software.

```{important}
No requirement in this specification may be read as making an escape route depend on PAC.
If a future requirement appears to do so, it is wrong.
```
