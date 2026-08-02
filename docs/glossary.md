# Glossary

```{glossary}
AccessPoint
    A logical point of access, independent of the device that realizes it.
    The type is one of `DOOR`, `BARRIER`, `GATE`, `TURNSTILE`, `ELEVATOR` or `LOCKER`.

AccessRule
    The only form a permission takes in PAC: `Group × (AccessPoint | Zone) × TimeModel`, plus a validity period and a provisioning mode.

ACU
    Access Control Unit.
    The OSDP term for the controller.

CredentialPolicy
    The set of credential technologies that a given access point accepts.

Desired state
    The complete set of entries PAC expects a controller to hold.

Device gateway
    The PAC component that lives in the controller network, speaks to controllers and readers, and is the only component that can decrypt key material.

Drift
    A difference between the actual state of a controller and its desired state that PAC did not cause.

EncodingProfile
    The transformation from the canonical person identifier into the encoding that a specific reader and controller combination expects.

LEGIC Orbit
    The network service used to assign a reader to an institution's LEGIC segment.

OSDP
    Open Supervised Device Protocol.
    The protocol between controller and reader, standardized as IEC 60839-11-5 and maintained by the Security Industry Association.

OSDP-SC
    OSDP Secure Channel.
    The authenticated and encrypted session between controller and reader.

OSS-SO
    Standard Offline Organisation.
    The offline access standard whose specification both institutions can influence as members.

PD
    Peripheral Device.
    The OSDP term for the reader.

Reconciler
    The component that reads the actual state of a controller, compares it with the desired state, and converges the two.

SCBK
    Secure Channel Base Key.
    The OSDP key shared between a controller and one reader, individual per reader.

Zone
    A grouping of access points that cuts across the site hierarchy.
```
