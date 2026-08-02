# About desired-state reconciliation

## The choice

There are two honest ways to get permissions into a controller.

The first is to push changes.
An event arrives from identity management, PAC works out what changed, and sends that change to the affected controllers.
It is simple and it is fast.

The second is to converge on a desired state.
PAC computes what a controller *should* contain, reads what it *does* contain, and eliminates the difference.
Events do not carry changes; they only trigger a run.

PAC uses the second.

## Why

Three requirements make the choice for us.

**Auditability.**
A regulator, an auditor or a staff representative body will eventually ask what a given door actually contained on a given day, and why.
A push-based system cannot answer that question.
It knows what it sent, not what arrived, and it has no way to distinguish a message that was applied from one that was lost.
A reconciling system knows both, because comparing them is its normal mode of operation.

**Building outages as the normal case.**
A controller will be unreachable for hours or days at a time, and this is not an incident but a fact of campus life.
With push, every change during that window is lost unless a separate replay mechanism catches it, and that mechanism becomes a second source of truth.
With reconciliation, the controller simply converges when it returns.
No operator does anything.

**Devices get replaced.**
When a controller is swapped, a push-based system has no idea what the new device contains.
A reconciling system reads it, finds it empty, and fills it.

## Drift is a security event

There is a fourth benefit that only appears once the mechanism exists.

If the actual state of a controller differs from the desired state and PAC did not cause the difference, then somebody changed something outside PAC, most likely through the controller's own web interface.
In an access control system that is not a synchronization problem.
It is a security incident.

The reconciler therefore does two things when it finds drift.
It corrects the controller, and it raises an alarm.

## What this costs

Reconciliation is more work to build than a push loop.
It needs a representation of desired state, a way to read actual state through every driver, a diff, and a scheduler that is fair across thousands of controllers.

It also needs a capacity guard.
Because PAC computes a complete desired state before applying it, it can compare that state against the controller's known limits and refuse, loudly, before a provisioning run fails silently in the field.
A push-based system discovers the limit at the worst possible moment.

The pattern is not novel.
It is what Kubernetes does with a cluster, and for the same reasons.

## Latency

Reconciliation is sometimes assumed to be slow because it sounds periodic.
It is not periodic here.

An identity event triggers a targeted run for the affected controllers within seconds.
The periodic full run exists only to catch drift, not to deliver changes.
An emergency revocation takes a priority path that overtakes everything else and meets a one-minute deadline.

```{seealso}
The corresponding requirements are in {doc}`../reference/provisioning`.
```
