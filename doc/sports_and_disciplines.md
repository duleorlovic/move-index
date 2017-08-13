Sport is model that represents all disciplines that are organized on one event.
If there is a new popular kind of running (for example night running), it is
separate sport.

Activity is used for easier searching, for example: kayak polo belongs to
kayaking activity. Triatlong belongs to running, cycling and swimming activity.

Every sport usually have disciplines: man, woman, age range, distance.

Event can be multidays and has many races.
Events can be edited by any user until it is approved.
Event belongs to organization. Organization has and belongs to many users, so
they can edit them and their approved events.
Events has many sports through disciplines.

Discipline has text representation, but also lenght in m and belongs to sport.
It is different for each event (next year event has different disciplines with
same values).

Registration is actual connection between discipline and user. It have and
belongs to many participation using table registraitons_participations.
Participations can have one or many registrations, for example in group kayaking
or in relay race (multiple competitors in same discipline). Participation
belongs to race.

Race is needed for actual semifinals and finals. It belongs to discipline and
usual there is only one race. It has start_at.
Race has many participant.

Result is a time and on some distance in a race for participant, so it belongs
to race and participant. Since participant can have many users (like in relay
race) we record result for each of them. Also for thriatlon (three disciplines
with one competitor) there are three results. We generate total result with
compound disciplines and participants. For example

Multiuser (like K4 kayaking): one result for participant that has 4 users

Relay (like 4x5km running): 4 results for 4 participants on discipline 5km, 1
result for participant with 4 user on discipline 4x5km.

Thriatlon (like 0.5m swimming 10km running 40km bicucling): 3 results for 3
partipants on discipline 0.5km, 10km, 40km and 1 compound result on discipline
triatlon (this result is calculated from each result).

We can search events by name, location on map, starts_at. Also search events by
disciplines.gender, disciplines.distance_m, disciplines.age_min age_max. Gender
and age could be used from profile.
