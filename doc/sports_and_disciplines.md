# Sport

Sport is model that represents all disciplines that are organized on one event.
If there is a new popular kind of running (for example night running), it is
separate sport.

Activity is used for easier searching, for example: kayak polo belongs to
kayaking activity. Triatlong belongs to running, cycling and swimming activity.

Every sport usually have disciplines: man, woman, age range, distance.

Event belongs to one sport (if there are multiple sports, than create multiple
events). Event can be multidays and has many races.

Race belongs to discipline and event and has many participants.

Discipline has text representation, but also lenght in m and belongs to sport.

Participant can have many competitors, for example in group kayaking or in relay
race (multiple competitors in same discipline).

Result is a time and position in discipline, so it belongs to discipline and
participant. Since participant can have many competitors (like in K4 or relay
race) we record result for each of them. Also for thriatlon (three disciplines
with one competitor) there are three results. We generate total result with
compound disciplines and participants. For example

Multiuser (like K4 kayaking): one result for participant that has 4 users

Relay (like 4x5km running): 4 results for 4 participants on discipline 5km, 1 result for
participant with 4 user on discipline 4x5km.

Thriatlon (like 0.5m swimming 10km running 40km bicucling): 3 results for 3
partipants on discipline 0.5km, 10km, 40km and 1 compound result on discipline
triatlon.
