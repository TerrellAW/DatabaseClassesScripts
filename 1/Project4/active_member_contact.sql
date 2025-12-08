/*
	Project:	Project 4 - Data Reporting
	Report:		Active Members Contact List
	Author:		Terrell Alexis-Wilson
	Date:		2025-12-12

	This report will help the fitness center know who its active members are so they can be notified of schedule changes, cancellations, etc.
	Having up-to-date contact information prevents messages being sent to the wrong people. The contact list can also be used for sending
	promotional material such as discounts, referral campaigns and special events.
 */
SELECT 
	m.member_id, 
	UPPER(m.last_name) AS last_name_upper, 
	m.first_name, 
	m.phone_number, 
	m.email, 
	ms.name AS membership_name, 
	mm.active_flag
FROM fit_member m,
     fit_member_membership mm,
     fit_membership ms
WHERE m.member_id = mm.member_id
    AND mm.membership_id = ms.membership_id
	AND mm.active_flag = 'Y'
	AND m.email IS NOT NULL
ORDER BY
	m.last_name,
	m.first_name;
