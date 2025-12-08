/*
	Project:	Project 4 - Data Reporting
	Report:		Class Participation
	Author:		Terrell Alexis-Wilson
	Date:		2025-12-12

	This report allows managers to see if a class is under-enrolled so they can be cancelled or rescheduled for a better time. 
	Managers will also be able to see which classes are popular and should be expanded in some way. This can also help the
	fitness center come up with promotional material.
 */
SELECT
	c.class_id,
	c.name AS class_name,
	c.max_number_participants,
	COUNT(e.member_id) AS enrolled_count,
	(SELECT AVG(cnt)
		FROM(
			SELECT COUNT(*) AS cnt
			FROM fit_enrollment
			GROUP BY class_id
		)
	) AS avg_enrollment_across_classes
FROM fit_class c,
	 fit_enrollment e
WHERE 	c.class_id = e.class_id(+)
	AND c.max_number_participants IS NOT NULL
	AND c.max_number_participants > 0
GROUP BY
	c.class_id,
	c.name,
	c.max_number_participants
ORDER BY
	enrolled_count ASC,
	c.name;
