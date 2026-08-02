# eduTAP PAC

eduTAP PAC (Physical Access Control) is a management and provisioning system for electronic access control at higher-education institutions.
European higher-education institutions develop it jointly as an open-source project under EUPL-1.2.

This site holds the requirements, the specification and the outline design.
It contains no implementation.

## The central design decision

> PAC manages doors, time models and group-based permissions, and provisions them into autonomous edge controllers.
> Persons and their group memberships belong to the institution's identity management system.
> Permissions exist in PAC exclusively as `Group × AccessPoint/Zone × TimeModel`.

PAC issues no credentials, holds no group memberships, and never decides an access request.
Every access decision is taken locally by the controller.

## Where to start

`````{grid} 1 1 2 2
:gutter: 3

````{grid-item-card} Explanation
:link: explanation/index
:link-type: doc

Why the system exists, where its boundary lies, and why each major decision went the way it did.
Start here if you are new to the project.
````

````{grid-item-card} Reference
:link: reference/index
:link-type: doc

The numbered requirements, the domain model, the architecture, and the release scope.
Start here if you need to look something up or audit the system.
````

````{grid-item-card} User stories
:link: user-stories/index
:link-type: doc

Draft stories per role, written for alignment with stakeholders.
These are proposals, not agreed scope.
````

````{grid-item-card} Project
:link: project/index
:link-type: doc

Open items for the people involved, plus the assumptions that still need verification.
````
`````

```{toctree}
:hidden:
:maxdepth: 2

explanation/index
reference/index
user-stories/index
project/index
glossary
```
