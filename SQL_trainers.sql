DROP TABLE IF EXISTS #trainerSchedule

SELECT
*
INTO #trainerSchedule
FROM
(
	SELECT
	1234 AS trainerid, '01/10/2018 08:30' starttime, '01/10/2018 09:00' endtime
	UNION
	SELECT
	1234, '01/10/2018 08:45', '01/10/2018 09:15'
	UNION
	SELECT
	1234, '01/10/2018 09:30', '01/10/2018 10:00'
	UNION
	SELECT
	2345 AS trainerid, '01/10/2018 08:45' AS starttime, '01/10/2018 09:15' AS endtime
	UNION
	SELECT
	2345, '01/10/2018 09:30', '01/10/2018 10:00'
	UNION
	SELECT
	2345, '01/10/2018 10:50', '01/10/2018 11:00'
	UNION
	SELECT
	2345, '01/10/2018 09:50', '01/10/2018 10:00'
) T

SELECT
A.trainerid, A.starttime, A.endtime
FROM
#trainerSchedule A
INNER JOIN #trainerSchedule B ON
A.trainerid = B.trainerid AND CAST(B.starttime AS DATETIME) < CAST(A.starttime AS DATETIME) AND CAST(B.endtime AS DATETIME) >= CAST(A.starttime AS DATETIME)