# Calendar authority

Review these with the small central unit inside estate management that maintains institution-wide calendars.

This audience is deliberately narrow.
`PAC-ADM-10` gives it institution-wide reach, so a mistake here affects every site at once.

## US-CAL-01 Maintain the academic calendar

As a member of the calendar authority, I want to define the lecture period, the lecture-free period and the examination period once for the whole institution, so that every building follows the academic year without anybody editing individual schedules.

Acceptance criteria:

- I can define periods with a start and an end date, and give each one a name.
- A time model can refer to a period rather than to dates.
- Changing a period date changes the behavior of every time model that refers to it, without further edits.
- The change propagates to the affected controllers within the standard latency.

Draws on `PAC-TIM-01`, `PAC-TIM-02`, `PAC-ADM-10`, `PAC-NFR-02`.

## US-CAL-02 Close the institution for public holidays

As a member of the calendar authority, I want to maintain a holiday calendar institution-wide, so that buildings behave correctly on days when the institution is closed, without every area owner remembering to do it.

Acceptance criteria:

- I can maintain holidays for a whole year in one place.
- A holiday overrides the weekly pattern and the academic calendar.
- I can define a closure spanning several days, such as a year-end closure.

Draws on `PAC-TIM-01`, `PAC-TIM-03`.

## US-CAL-03 Open a site for a special event

As a member of the calendar authority, I want to define a special event with its own access behavior for a specific date and location, so that a summer festival or an open day works without permanently changing anything.

Acceptance criteria:

- I can define an event with a date range, a set of access points or zones, and its own behavior.
- The event takes precedence over holidays, the academic calendar and the weekly pattern.
- The event expires on its own; nobody has to remember to remove it.

Draws on `PAC-TIM-01`, `PAC-AUT-05`.

## US-CAL-04 See the effect before it happens

As a member of the calendar authority, I want to preview which access points a calendar change will affect, so that an institution-wide edit does not surprise a site.

Acceptance criteria:

- Before saving, I see how many access points and which sites are affected.
- I can see, for a chosen date, what a given time model will resolve to.

Draws on `PAC-TIM-01`, `PAC-ADM-10`.

## Open question for the review

May a site define its own special events, or must every event go through the central unit?
The current design says central, following `PAC-ADM-10`.
A campus summer festival is the case that will test this.
