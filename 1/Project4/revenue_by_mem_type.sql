/*
	Project:	Project 4 - Data Reporting
	Report:		Revenue by Membership Type
	Author:		Terrell Alexis-Wilson
	Date:		2025-12-12

	This report allows the fitness center to see what types of memberships are the most performant.
	With this information they can see which memberships should be cancelled and come up with new membership types
	based on the success of pre-existing ones.
 */
SELECT
	ms.membership_id,
	ms.name AS membership_name,
	SUM(mm.fee) AS total_fee,
	COUNT(*) AS num_memberships
FROM fit_member_membership mm,
	 fit_membership ms
WHERE mm.membership_id = ms.membership_id
GROUP BY
	ms.membership_id,
	ms.name
HAVING
	SUM(mm.fee) > 500
ORDER BY
	total_fee DESC;
