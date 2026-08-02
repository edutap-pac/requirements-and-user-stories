# Context and sizing

## Parties

| Party | Role |
|---|---|
| Identity management | Owns persons, group memberships and credential identifiers. Typically a directory service such as eDirectory or Active Directory. |
| Credential issuing | Issues credentials as wallet passes and chip cards, and can revoke a wallet credential remotely. In this project, eduTAP. |
| eduTAP PAC | Manages access points, zones, time models and group permissions. Provisions controllers. |
| Calendar authority | Institution-wide academic calendar, holidays and special events. A small central unit. |
| Estate administration | Sites, buildings, zones, access points, closing times and delegation. Usually one unit per campus. |
| Device administration | Controllers, readers, commissioning, keys, firmware and inventory. A specialist team inside building operations. |
| Installers | Fit doors, controllers, readers, door openers and wiring. Often external firms working for a building authority or a central workshop. **No access to PAC.** |
| Area owners (faculty, institute, chair) | Delegated authority over their own access points. |
| Porter's lodge and security staff | Operate the control room. |
| IT operations | Platform, network segments and the identity management interface. Never touches a controller. |
| Staff representation and data protection | Oversight of any evaluation of access events. |

```{important}
Estate administration, device administration and IT operations are separate parties on purpose, and installers are a party with no system access at all.
Access control hardware belongs to the estate, not to the IT department, and administering an area is a different job from commissioning a device.
Both are typically organized per campus rather than centrally, which is why `PAC-ADM-09` scopes them per site.
See {doc}`roles-and-interfaces`.
```

## Sizing targets

The system is designed for a large European university.
These are design targets, not figures from any particular institution.
Each operating institution records its own numbers separately.

| Dimension | Design target |
|---|---|
| Population | 50,000 to 100,000 members, comprising students, staff, doctoral candidates and affiliates |
| Credentials per person | One canonical identifier per person, as required by `PAC-CRD-03` |
| Buildings | Several hundred |
| Online access points at full rollout | Order of 10,000 |
| Access points per pilot site | 2 to 5 |
| Permission groups | Order of 1,000 |
| Time models | Order of 20 |
| Concurrent administrators | Tens, spread across building operations units and delegated area owners |

Re-enrolment at a university spreads across roughly two months rather than a single day.
There is therefore no hard mass-change peak, which removes a dimensioning constraint that would otherwise dominate the provisioning design.

## Typical installed base

An institution adopting PAC is expected to bring a mixed estate rather than a clean slate:

- mechanical locking systems, often the largest share by door count
- offline electronic cylinders and fittings from one or more vendors
- online systems from a vendor whose management software cannot express university logic
- in some cases, controllers whose vendor no longer exists or whose product line has ended

The agreed target picture is replacement by open controller hardware over the years, with connectors for existing systems as a roadmap item.
This is why the driver abstraction exists from day one, recorded as D13 in {doc}`../explanation/decisions`.

## Regulatory framework

| Level | Framework |
|---|---|
| European | NIS2, ENISA guidance, GDPR |
| National | The applicable national baseline of each operating institution, such as a national IT baseline protection standard |
| Sectoral | Identity federation agreements through GÉANT and the national research and education networks |

The system must be fully auditable, as required by `PAC-NFR-08`.
Each operating institution confirms its own national requirements before going live.
