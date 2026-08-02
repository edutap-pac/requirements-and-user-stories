# About one identifier and many encodings

## The symptom

Both institutions have lived with the same defect.
A single person ends up represented by several credential entries that differ only in how the same number is written.
In one deployment this reached four encodings per credential, which turned a population in the tens of thousands into several hundred thousand controller entries and made provisioning slow.

It is tempting to blame the readers.
That is wrong, and getting the cause right matters, because it changes the fix.

## The cause

OSDP gives a controller two ways to learn what a reader saw.

`osdp_RAW` reports a raw bit array.
The controller receives bits and no interpretation.

`osdp_FMT` reports a formatted character array.
The controller receives a decoded, formatted value.

While a controller supports only the raw form, interpretation has to happen somewhere else.
And interpretation is not trivial, because the credential technologies in use do not agree with each other.
LEGIC Advant, NXP MIFARE, Apple VAS and Apple Access, Google Smart Tap and Samsung Access differ in application layout and segment structure.
The same logical number arrives with different bit lengths, sometimes as ASCII and sometimes as hexadecimal, sometimes little-endian and sometimes big-endian.

Faced with a controller that cannot format and a fleet of technologies that do not agree, the pragmatic answer was to store every variant.
That answer works and it does not scale.

## The fix

PAC keeps exactly one canonical person identifier.
Everything else is derived.

An encoding profile is a function of three things: the credential technology, the reader model, and what the controller can do.
Where the controller supports formatted card data, PAC uses it.
Where it does not, PAC computes the correct encoding at provisioning time and writes that.

Multiple stored encodings for one person are therefore a defect, not a feature.

## The second half of the fix

There is a further reason the numbers were large, and it turns out to be an opportunity.

Not every credential technology is relevant at every door.
A library learning center reads library cards.
A teaching room reads student cards.
Nothing is gained by teaching a library turnstile about a technology it will never see.

PAC therefore gives every access point a credential policy: the set of technologies accepted there.
A mass entrance that accepts exactly one technology needs one entry per person, not one per technology.

This started as a capacity argument and ended up being a genuine feature.
A door that accepts the wrong medium is a real operational annoyance at a university, and no commercial product models it, because in an office building everyone carries the same badge.

```{seealso}
The corresponding requirements are in {doc}`../reference/domain-model`.
```
