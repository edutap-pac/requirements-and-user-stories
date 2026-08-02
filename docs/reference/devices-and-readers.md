# Device drivers and reader lifecycle

## Drivers

| ID | Requirement |
|---|---|
| `PAC-DRV-01` | Controller access is encapsulated behind a driver interface offering: report capabilities, read actual state, apply desired state, direct door control, fetch events, and report health. |
| `PAC-DRV-02` | A driver reports its capabilities, covering at least maximum entries, formatted card data support, schedule model, supported access point types, and firmware pass-through. The core adapts the desired state to the reported capabilities rather than assuming them. |
| `PAC-DRV-03` | Version one ships a driver for the Axis A12xx door controllers and the A9212, A9910 and A9920 input and output relay modules, using the documented VAPIX physical access control interface. |
| `PAC-DRV-04` | Further drivers, such as those for the existing installed base, must not require changes to the domain model. |
| `PAC-DRV-05` | A controller simulator implementing the same driver interface is part of version one and forms the basis for automated testing, as required by `PAC-NFR-10`. |

## Reader lifecycle

Reader lifecycle management is a separate component inside the device gateway, because it handles key material.

| ID | Requirement |
|---|---|
| `PAC-RDR-01` | PAC identifies readers through the OSDP identification and capability reports, so that a reader states its own manufacturer, model, firmware and capabilities. |
| `PAC-RDR-02` | Commissioning uses installation mode with the default secure channel key, then sets an individual secure channel base key per reader. Installation mode ends automatically on success. |
| `PAC-RDR-03` | A reader without an individual secure channel key is not commissioned. PAC raises an alarm. |
| `PAC-RDR-04` | PAC assigns a reader to the institution's LEGIC segment over the network. Prerequisites are open under `HW-07`. |
| `PAC-RDR-05` | PAC distributes reader firmware through the OSDP file transfer mechanism. Because MIFARE, Apple and Google keys are embedded in reader firmware, this is key distribution and requires signed artifacts, staged rollout, a rollback path, and four-eyes approval. Feasibility is open under `HW-03`. |
| `PAC-RDR-06` | PAC supports planned and emergency key rotation, with evidence of which reader carries which key generation. |
| `PAC-RDR-07` | Key material is stored encrypted and can be decrypted only by the device gateway. The core must never have access to it. |
| `PAC-RDR-08` | Commissioning must be executable entirely from the office, after the installers have left the site. The system must not require any on-site software action, installer account or installer tool, as required by `PAC-ADM-11`. |
| `PAC-RDR-09` | A newly installed device is untrusted until verified. Before any key is written, PAC records what the device reports about itself and makes it comparable with what was ordered for that installation position. |

```{warning}
`PAC-RDR-05` makes firmware distribution equivalent to key distribution.
Treat any change to that pipeline as a change to the key management system.
```

## The handover boundary

A door passes through two hands before it works.

An installer, frequently an external firm, fits the controller, the reader, the door opener and the wiring.
When they leave, the door is mechanically and electrically complete and electronically inert.

Device administration then takes it into service from the office: verifies what was installed, sets an individual secure channel key, binds it to an access point, and lets provisioning fill it.

`PAC-RDR-08` and `PAC-RDR-09` exist to keep that boundary intact.
Without them the obvious implementation is a technician with a laptop at the door, which is exactly the arrangement the institutions want to avoid.

## Why the reader lifecycle is its own component

Card key material is otherwise out of scope and belongs to the card issuing office.
Two functions are exceptions, because they run over the network through the controller rather than at the card desk: assigning a reader to a segment, and distributing firmware that contains keys.

Both touch secrets, both are irreversible in the field, and both need approval workflows that no other part of PAC needs.
Scattering them across the provisioning code would bury security-critical operations inside routine ones.
