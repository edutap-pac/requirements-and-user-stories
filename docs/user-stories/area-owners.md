# Area owners

Review these with faculty, institute and chair representatives.
This is the largest and least technical audience, so their stories decide whether the administration interface succeeds.

## US-ARE-01 Give a group access to my room

As a chair administrator, I want to grant a group access to my laboratory during defined hours, so that the people who need to work there can get in.

Acceptance criteria:

- I can select a group, one of my access points, and a time model.
- I do not have to name individual people, and the interface offers me no way to do so.
- The rule takes effect within the standard latency.
- I can see when the rule was created and by whom.

Draws on `PAC-AUT-01`, `PAC-AUT-02`, `PAC-NFR-02`.

## US-ARE-02 Grant access for a limited period

As a chair administrator, I want a rule to expire on a date I set, so that access for a project or a semester ends without me having to remember it.

Acceptance criteria:

- I can set a validity period when creating a rule.
- The rule stops taking effect at the end date without further action.
- An expired rule disappears from the controllers automatically.

Draws on `PAC-AUT-05`, `PAC-PRV-01`.

## US-ARE-03 Understand why someone cannot get in

As a chair administrator, I want to check whether a group currently has access to one of my rooms and at which times, so that I can answer a colleague's question without contacting IT.

Acceptance criteria:

- I can view the effective rules for one of my access points, including rules inherited from a zone.
- I can see which time model applies and what it currently resolves to.
- I see this without seeing any access events or any personal data.

Draws on `PAC-AUT-04`, `PAC-NFR-06`, `PAC-NFR-07`.

```{note}
This story is the reason the administration interface must expose *effective* rules rather than stored rules.
A rule inherited from a zone is invisible otherwise, and the resulting support calls land on IT.
```

## US-ARE-04 Work in my own language

As a chair administrator, I want the interface in my own language, so that I do not misconfigure access because of a translation I misread.

Acceptance criteria:

- The interface is available in my language, or my language can be contributed without waiting for a release.
- The language follows my account, not the server.

Draws on `PAC-NFR-11`, `PAC-UIX-04`, `PAC-UIX-05`.

## Open questions for the review

Which groups do area owners actually work with, and are those groups available in identity management today?
If the groups they think in do not exist yet, the gap is in identity management, and it will surface here first.

Do area owners need to see that a rule exists but was created by building operations, or is that noise to them?
