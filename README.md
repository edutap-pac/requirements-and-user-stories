# eduTAP PAC — requirements and user stories

Requirements, specification, outline design and user stories for **eduTAP PAC** (Physical Access
Control), a management and provisioning system for electronic access control at higher-education
institutions, developed jointly by European higher-education institutions.

This repository contains documentation only. No implementation.

## The central design decision

> PAC manages doors, time models and group-based permissions, and provisions them into autonomous
> edge controllers. Persons and their group memberships belong to the institution's identity
> management system. Permissions exist in PAC exclusively as `Group × AccessPoint/Zone × TimeModel`.

PAC issues no credentials, holds no group memberships, and never decides an access request.
Every access decision is taken locally by the controller.

## Build the documentation

```shell
make venv
make html
make serve
```

`make help` lists the available targets.

Every push and pull request builds the documentation in CI and uploads it as the
`documentation` artifact, which reviewers can download and open locally.

Publishing to GitHub Pages is prepared but switched off. GitHub Pages is
unavailable for private repositories on the Free plan, so the deploy job stays
inert until the repository is public and Pages is enabled with **GitHub Actions**
as its source. Then:

```shell
gh variable set PUBLISH_DOCS --body true
```

## Layout

| Path | Content |
|------|---------|
| `docs/explanation/` | Why the system exists and why each decision went the way it did |
| `docs/reference/` | The numbered requirements, domain model, architecture and release scope |
| `docs/user-stories/` | Draft stories per role, for alignment with stakeholders |
| `docs/project/` | Open items and unverified assumptions |

## Licence

EUPL-1.2
