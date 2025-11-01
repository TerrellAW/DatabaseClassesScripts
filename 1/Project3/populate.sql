-- Fitness Memberships
INSERT INTO fit_membership 	(membership_id, name)
	 VALUES 				(01, 			'Basic'),
							(02, 			'Premium'),
							(03, 			'VIP'),
							(04, 			'Family'),
							(05, 			'Student'),
							(06, 			'Senior'),
							(07, 			'Corporate'),
							(08, 			'Group'),
							(09, 			'Trial'),
							(10, 			'Lifetime');

-- Fitness Members
INSERT INTO fit_member 	(member_id, first_name, last_name, dob, phone_number, email)
	   VALUES 			(01,		'John', 	'Wick',		'1978-05-15', 	'5045647890', 	'johndoe@wicknet.org'),
						(02,		'Jane', 	'Smith', 	'1995-09-22',	'5049874325',	'jane@janescape.net'),
						(03,		'Alice',	'Johnson',	'1988-11-03',	'5042324545',	'alice@janescape.net'),
						(04,		'Bob',		'Brown',	'1976-04-19',	'4016789982',	'bob@fitnet.com'),
						(05,		'Charlie',	'Garcia',	'1988-07-28',	'6988897768',	'charles@netmail.net'),
						(06,		'Diana',	'Martinez',	'1990-12-08',	'6984342211',	'diana90@cloudmail.com'),
						(07,		'Ethan',	'Lopez',	'1985-01-25',	'5044156131',	'ethanlopez@wicknet.org'),
						(08,		'Fiona',	'Wilson',	'1972-06-14',	'5048192070',	'fionawilson@wicknet.org'),
						(09,		'George',	'Miller',	'1958-03-31',	'4013242526',	'gmiller@fitnet.com'),
						(10,		'Hannah',	'Montana',	'1987-08-12',	'5048293031',	'hannahmontana@janescape.net');

-- Fitness Member Memberships
INSERT INTO fit_member_membership 	(member_id, membership_id, start_date, end_date, fee, active_flag)
	   VALUES 						(01,		02, 	'2003-11-11',	'2025-11-07',	59.99,	true),
									(02,		03,		'2004-01-02',	'2025-11-07',	79.99,	true),
									(03,		03,		'2004-01-02',	'2023-09-01',	79.99,	false),
									(04,		04,		'2004-01-23',	'2025-11-07',	49.99,	true),
									(05,		05,		'2004-02-12',	'2011-12-20',	19.99,	false),
									(06,		01,		'2006-08-21',	'2024-06-01',	29.99,	false),
									(07,		07,		'2008-07-05',	'2025-11-07',	59.99,	true),
									(08,		07,		'2008-11-28',	'2025-11-07',	59.99,	true),
									(09,		06,		'2009-06-09',	'2025-11-07',	29.99,	true),
									(10,		03,		'2010-02-02',	'2025-11-07',	79.99,	true);
									
-- Fitness Trainer Specialties
INSERT INTO fit_specialty	(specialty_id, 	name)
	 VALUES					(01,			'Weightlifting'),
							(02,			'Yoga'),
							(03,			'Pilates'),
							(04,			'Cardio'),
							(05,			'Zumba'),
							(06,			'CrossFit'),
							(07,			'Boxing'),
							(08,			'Swimming'),
							(09,			'Dancing'),
							(10,			'Tai Chi');

-- Fitness Certifications
INSERT INTO fit_certification	(certification_id, 	name)
	 VALUES						(01,				'Certified Personal Trainor'),
								(02,				'Certified Yoga Instructor'),
								(03,				'Certified Pilates Instructor'),
								(04,				'Group Exercise Instructor'),
								(05,				'CrossFit Class 1 Trainer'),
								(06,				'Swim Coach Captain'),
								(07,				'ACSM Exercise Physiologist'),
								(08,				'NDIA Certification'),
								(09,				'Les Mills Master Trainer'),
								(10,				'Certified Tai Chi Master');

-- Fitness Equipment
INSERT INTO fit_equipment	(equipment_id,	name,	description,	purchase_date)
	 VALUES					(01,			'Treadmill',	'Exercise machine for running or walking',	'2003-05-10'),
							(02,			'Dumbbells',	'Set of weights for strength training',		'2003-08-03'),
							(03,			'Yoga Mat',		'Provides grip and cushioning for Yoga',	'2005-11-11'),
							(04,			'Resistance Bands',	'Assists with muscle toning',			'2006-02-23'),
							(05,			'Stationary Bike',	'Exercise machine for cycling indoors',	'2007-06-09'),
							(06,			'Pull-Up Bar',	'Upper body strengthening bar',				'2009-10-29'),
							(07,			'Elliptical Trainer',	'Combines running and cycling',		'2012-03-14'),
							(08,			'Weight Bench',	'Variety of strength training equipment',	'2013-09-19'),
							(09,			'Jump Rope',	'Rope that users jump over for cardio',		'2015-07-23'),
							(10,			'Kettlebell',	'Cast iron weight for strength training',	'2020-12-10');

-- Fitness Classes
INSERT INTO fit_class	(class_id,	name,	description,	max_number_participants)
	 VALUES				(01,		'Powerlifting Workshop',	'Focuses on developing strength through heavy weight lifting.',	10),
						(02,		'Morning Yoga',				'Gentle yoga for beginners.',	30),
						(03,		'Pilates Reformer',			'Focuses on core strength and flexibility.',	25),
						(04,		'Cardio Kickboxing',		'High-intensity training with boxing moves',	40),
						(05,		'Zumba Dance Class',		'Dance workout to Latin music.',	50),
						(06,		'CrossFit Training',		'High-intensity training with a variety of movements',	40),
						(07,		'Boxing Basics',			'Learn basic boxing techniques.',	35),
						(08,		'Swimming Lessons',			'Learn how to swim successfully.',	20),
						(09,		'Dance Fitness Fusion',		'Combines dance styles like salsa, tango, and hip-hop',	45),
						(10,		'Tai Chi for Beginners',	'Introduction to Tai Chi with easy to follow moves.',	25);

-- Fitness Enrollment
INSERT INTO fit_enrollment	(class_id,	member_id,	enrollment_date)
	 VALUES					(01,		01,			'2023-06-01'),
							(02,		02,			'2023-06-05'),
							(03,		03,			'2023-06-10'),
							(04,		04,			'2023-10-10'),
							(05,		05,			'2023-12-14'),
							(06,		06,			'2024-01-01'),
							(07,		07,			'2024-01-13'),
							(08,		08,			'2024-11-23'),
							(09,		09,			'2025-01-11'),
							(10,		10,			'2025-02-22');

