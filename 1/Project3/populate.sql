-- Clear existing data
DELETE FROM fit_class_trainer;
DELETE FROM fit_enrollment;
DELETE FROM fit_class_equipment;
DELETE FROM fit_member_membership;
DELETE FROM fit_class;
DELETE FROM fit_equipment;
DELETE FROM fit_trainer;
DELETE FROM fit_member;
DELETE FROM fit_certification;
DELETE FROM fit_specialty;
DELETE FROM fit_membership;

-- Fitness Memberships
INSERT ALL
    INTO fit_membership (membership_id, name) VALUES (01, 'Basic')
    INTO fit_membership (membership_id, name) VALUES (02, 'Premium')
    INTO fit_membership (membership_id, name) VALUES (03, 'VIP')
    INTO fit_membership (membership_id, name) VALUES (04, 'Family')
    INTO fit_membership (membership_id, name) VALUES (05, 'Student')
    INTO fit_membership (membership_id, name) VALUES (06, 'Senior')
    INTO fit_membership (membership_id, name) VALUES (07, 'Corporate')
    INTO fit_membership (membership_id, name) VALUES (08, 'Group')
    INTO fit_membership (membership_id, name) VALUES (09, 'Trial')
    INTO fit_membership (membership_id, name) VALUES (10, 'Lifetime')
SELECT * FROM dual;

-- Fitness Members
INSERT ALL
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (01, 'John', 'Wick', DATE '1978-05-15', '5045647890', 'johndoe@wicknet.org')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (02, 'Jane', 'Smith', DATE '1995-09-22', '5049874325', 'jane@janescape.net')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (03, 'Alice', 'Johnson', DATE '1988-11-03', '5042324545', 'alice@janescape.net')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (04, 'Bob', 'Brown', DATE '1976-04-19', '4016789982', 'bob@fitnet.com')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (05, 'Charlie', 'Garcia', DATE '1988-07-28', '6988897768', 'charles@netmail.net')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (06, 'Diana', 'Martinez', DATE '1990-12-08', '6984342211', 'diana90@cloudmail.com')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (07, 'Ethan', 'Lopez', DATE '1985-01-25', '5044156131', 'ethanlopez@wicknet.org')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (08, 'Fiona', 'Wilson', DATE '1972-06-14', '5048192070', 'fionawilson@wicknet.org')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (09, 'George', 'Miller', DATE '1958-03-31', '4013242526', 'gmiller@fitnet.com')
    INTO fit_member (member_id, first_name, last_name, dob, phone_number, email) 
		VALUES (10, 'Hannah', 'Montana', DATE '1987-08-12', '5048293031', 'hannahmontana@janescape.net')
SELECT * FROM dual;

-- Fitness Member Memberships
INSERT ALL
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (01, 02, DATE '2003-11-11', DATE '2025-11-07', 59.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (02, 03, DATE '2004-01-02', DATE '2025-11-07', 79.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (03, 03, DATE '2004-01-02', DATE '2023-09-01', 79.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (04, 04, DATE '2004-01-23', DATE '2025-11-07', 49.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (05, 05, DATE '2004-02-12', DATE '2011-12-20', 19.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (06, 01, DATE '2006-08-21', DATE '2024-06-01', 29.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (07, 07, DATE '2008-07-05', DATE '2025-11-07', 59.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (08, 07, DATE '2008-11-28', DATE '2025-11-07', 59.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (09, 06, DATE '2009-06-09', DATE '2025-11-07', 29.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (10, 03, DATE '2010-02-02', DATE '2025-11-07', 79.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (01, 01, DATE '2015-03-15', DATE '2018-03-15', 29.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (02, 02, DATE '2016-06-20', DATE '2019-06-20', 59.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (03, 05, DATE '2017-09-10', DATE '2020-09-10', 19.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (04, 06, DATE '2018-01-05', DATE '2021-01-05', 29.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (05, 01, DATE '2019-04-12', DATE '2022-04-12', 29.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (06, 02, DATE '2020-07-22', DATE '2023-07-22', 59.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (07, 03, DATE '2021-10-30', DATE '2024-10-30', 79.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (08, 04, DATE '2022-02-14', DATE '2025-02-14', 49.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (09, 05, DATE '2023-05-18', DATE '2025-11-07', 19.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (10, 01, DATE '2024-08-25', DATE '2025-11-07', 29.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (01, 10, DATE '2020-01-01', DATE '2025-11-07', 999.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (02, 04, DATE '2021-03-10', DATE '2024-03-10', 49.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (03, 06, DATE '2022-06-15', DATE '2025-06-15', 29.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (04, 07, DATE '2023-09-20', DATE '2025-11-07', 59.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (05, 08, DATE '2024-01-25', DATE '2025-11-07', 39.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (06, 09, DATE '2025-02-01', DATE '2025-03-01', 9.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (07, 10, DATE '2019-05-05', DATE '2025-11-07', 999.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (08, 01, DATE '2020-08-10', DATE '2023-08-10', 29.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (09, 02, DATE '2021-11-15', DATE '2024-11-15', 59.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (10, 05, DATE '2022-02-20', DATE '2025-02-20', 19.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (01, 08, DATE '2023-06-01', DATE '2025-11-07', 39.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (02, 09, DATE '2024-09-05', DATE '2024-10-05', 9.99, 0)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (03, 10, DATE '2021-12-10', DATE '2025-11-07', 999.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (04, 01, DATE '2022-03-15', DATE '2025-03-15', 29.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (05, 02, DATE '2023-06-20', DATE '2025-11-07', 59.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (06, 03, DATE '2024-09-25', DATE '2025-11-07', 79.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (07, 04, DATE '2025-01-01', DATE '2025-11-07', 49.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (08, 05, DATE '2024-04-05', DATE '2025-11-07', 19.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (09, 08, DATE '2025-07-10', DATE '2025-11-07', 39.99, 1)
    INTO fit_member_membership (member_id, membership_id, start_date, end_date, fee, active_flag) 
		VALUES (10, 09, DATE '2025-10-15', DATE '2025-11-15', 9.99, 1)
SELECT * FROM dual;

-- Fitness Trainer Specialties
INSERT ALL
    INTO fit_specialty (speciality_id, name) VALUES (01, 'Weightlifting')
    INTO fit_specialty (speciality_id, name) VALUES (02, 'Yoga')
    INTO fit_specialty (speciality_id, name) VALUES (03, 'Pilates')
    INTO fit_specialty (speciality_id, name) VALUES (04, 'Cardio')
    INTO fit_specialty (speciality_id, name) VALUES (05, 'Zumba')
    INTO fit_specialty (speciality_id, name) VALUES (06, 'CrossFit')
    INTO fit_specialty (speciality_id, name) VALUES (07, 'Boxing')
    INTO fit_specialty (speciality_id, name) VALUES (08, 'Swimming')
    INTO fit_specialty (speciality_id, name) VALUES (09, 'Dancing')
    INTO fit_specialty (speciality_id, name) VALUES (10, 'Tai Chi')
SELECT * FROM dual;

-- Fitness Certifications
INSERT ALL
    INTO fit_certification (certification_id, name) VALUES (01, 'Certified Personal Trainer')
    INTO fit_certification (certification_id, name) VALUES (02, 'Certified Yoga Instructor')
    INTO fit_certification (certification_id, name) VALUES (03, 'Certified Pilates Instructor')
    INTO fit_certification (certification_id, name) VALUES (04, 'Group Exercise Instructor')
    INTO fit_certification (certification_id, name) VALUES (05, 'CrossFit Level 1 Trainer')
    INTO fit_certification (certification_id, name) VALUES (06, 'Swim Coach Captain')
    INTO fit_certification (certification_id, name) VALUES (07, 'ACSM Exercise Physiologist')
    INTO fit_certification (certification_id, name) VALUES (08, 'NDIA Certification')
    INTO fit_certification (certification_id, name) VALUES (09, 'Les Mills Master Trainer')
    INTO fit_certification (certification_id, name) VALUES (10, 'Certified Tai Chi Master')
SELECT * FROM dual;

-- Fitness Trainers
INSERT ALL
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (01, 'Marcus', 'Strong', 01, 01, '5551234567')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (02, 'Sarah', 'Zen', 02, 02, '5551234568')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (03, 'Emily', 'Core', 03, 03, '5551234569')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (04, 'David', 'Runner', 04, 04, '5551234570')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (05, 'Maria', 'Rhythm', 05, 04, '5551234571')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (06, 'Tyler', 'Beast', 06, 05, '5551234572')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (07, 'Rocky', 'Balboa', 07, 04, '5551234573')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (08, 'Michael', 'Phelps', 08, 06, '5551234574')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (09, 'Jennifer', 'Moves', 09, 09, '5551234575')
    INTO fit_trainer (trainer_id, first_name, last_name, speciality_id, certification_id, phone_number) VALUES (10, 'Chen', 'Peace', 10, 10, '5551234576')
SELECT * FROM dual;

-- Fitness Equipment
INSERT ALL
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (01, 'Treadmill', 'Exercise machine for running or walking', DATE '2003-05-10')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (02, 'Dumbbells', 'Set of weights for strength training', DATE '2003-08-03')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (03, 'Yoga Mat', 'Provides grip and cushioning for Yoga', DATE '2005-11-11')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (04, 'Resistance Bands', 'Assists with muscle toning', DATE '2006-02-23')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (05, 'Stationary Bike', 'Exercise machine for cycling indoors', DATE '2007-06-09')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (06, 'Pull-Up Bar', 'Upper body strengthening bar', DATE '2009-10-29')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (07, 'Elliptical Trainer', 'Combines running and cycling', DATE '2012-03-14')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (08, 'Weight Bench', 'Variety of strength training equipment', DATE '2013-09-19')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (09, 'Jump Rope', 'Rope that users jump over for cardio', DATE '2015-07-23')
    INTO fit_equipment (equipment_id, name, description, purchase_date) 
		VALUES (10, 'Kettlebell', 'Cast iron weight for strength training', DATE '2020-12-10')
SELECT * FROM dual;

-- Fitness Classes
INSERT ALL
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (01, 'Powerlifting Workshop', 'Focuses on developing strength through heavy weight lifting.', 10)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (02, 'Morning Yoga', 'Gentle yoga for beginners.', 30)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (03, 'Pilates Reformer', 'Focuses on core strength and flexibility.', 25)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (04, 'Cardio Kickboxing', 'High-intensity training with boxing moves', 40)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (05, 'Zumba Dance Class', 'Dance workout to Latin music.', 50)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (06, 'CrossFit Training', 'High-intensity training with a variety of movements', 40)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (07, 'Boxing Basics', 'Learn basic boxing techniques.', 35)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (08, 'Swimming Lessons', 'Learn how to swim successfully.', 20)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (09, 'Dance Fitness Fusion', 'Combines dance styles like salsa, tango, and hip-hop', 45)
    INTO fit_class (class_id, name, description, max_number_participants) 
		VALUES (10, 'Tai Chi for Beginners', 'Introduction to Tai Chi with easy to follow moves.', 25)
SELECT * FROM dual;

-- Fitness Enrollment
INSERT ALL
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (01, 01, DATE '2023-06-01')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (02, 02, DATE '2023-06-05')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (03, 03, DATE '2023-06-10')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (04, 04, DATE '2023-10-10')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (05, 05, DATE '2023-12-14')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (06, 06, DATE '2024-01-01')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (07, 07, DATE '2024-01-13')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (08, 08, DATE '2024-11-23')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (09, 09, DATE '2025-01-11')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (10, 10, DATE '2025-02-22')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (01, 02, DATE '2023-07-15')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (01, 03, DATE '2023-08-20')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (02, 01, DATE '2023-09-01')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (02, 04, DATE '2023-10-05')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (03, 05, DATE '2023-11-10')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (03, 06, DATE '2023-12-15')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (04, 07, DATE '2024-01-20')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (04, 08, DATE '2024-02-25')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (05, 09, DATE '2024-03-01')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (05, 10, DATE '2024-04-05')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (06, 01, DATE '2024-05-10')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (06, 02, DATE '2024-06-15')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (07, 03, DATE '2024-07-20')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (07, 04, DATE '2024-08-25')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (08, 05, DATE '2024-09-01')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (08, 06, DATE '2024-10-05')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (09, 07, DATE '2024-11-10')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (09, 08, DATE '2024-12-15')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (10, 09, DATE '2025-01-20')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (10, 01, DATE '2025-02-25')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (01, 04, DATE '2025-03-01')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (02, 05, DATE '2025-03-05')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (03, 07, DATE '2025-03-10')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (04, 09, DATE '2025-03-15')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (05, 01, DATE '2025-03-20')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (06, 03, DATE '2025-03-25')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (07, 05, DATE '2025-04-01')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (08, 07, DATE '2025-04-05')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (09, 02, DATE '2025-04-10')
    INTO fit_enrollment (class_id, member_id, enrollment_date) VALUES (10, 04, DATE '2025-04-15')
SELECT * FROM dual;

-- Fitness Class Equipment
INSERT ALL
    INTO fit_class_equipment (class_id, equipment_id) VALUES (01, 02)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (01, 08)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (01, 10)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (01, 06)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (02, 03)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (02, 04)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (03, 03)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (03, 04)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (04, 09)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (04, 01)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (04, 07)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (05, 09)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (06, 02)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (06, 10)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (06, 06)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (06, 09)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (06, 08)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (07, 02)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (07, 09)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (08, 03)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (09, 09)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (10, 03)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (01, 04)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (02, 09)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (03, 02)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (04, 05)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (05, 03)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (06, 01)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (07, 04)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (08, 04)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (09, 05)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (10, 04)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (01, 05)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (02, 02)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (03, 10)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (04, 02)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (05, 04)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (07, 08)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (09, 01)
    INTO fit_class_equipment (class_id, equipment_id) VALUES (10, 02)
SELECT * FROM dual;

-- Fitness Class Trainer
INSERT ALL
    INTO fit_class_trainer (class_id, trainer_id) VALUES (01, 01)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (02, 02)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (03, 03)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (04, 04)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (05, 05)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (06, 06)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (07, 07)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (08, 08)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (09, 09)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (10, 10)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (01, 02)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (01, 06)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (02, 03)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (02, 10)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (03, 02)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (03, 04)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (04, 07)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (04, 01)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (05, 09)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (05, 04)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (06, 01)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (06, 04)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (07, 04)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (07, 06)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (08, 08)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (08, 02)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (09, 05)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (09, 02)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (10, 02)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (10, 03)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (01, 04)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (02, 05)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (03, 06)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (04, 08)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (05, 10)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (06, 07)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (07, 09)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (08, 03)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (09, 06)
    INTO fit_class_trainer (class_id, trainer_id) VALUES (10, 04)
SELECT * FROM dual;

-- Update 1: Change membership fee for premium memberships
UPDATE fit_member_membership 
SET fee = 69.99 
WHERE membership_id = 02 AND active_flag = 1;

-- Update 2: Update trainer specialty
UPDATE fit_trainer 
SET speciality_id = 06 
WHERE trainer_id = 01;

-- Update 3: Update class max participants
UPDATE fit_class 
SET max_number_participants = 35 
WHERE class_id = 02;

-- Update 4: Update member email
UPDATE fit_member 
SET email = 'john.wick@continental.com' 
WHERE member_id = 01;

-- Update 5: Update equipment description
UPDATE fit_equipment 
SET description = 'Heavy duty cast iron weight for advanced strength training' 
WHERE equipment_id = 10;

-- Update 6: Update membership end date for active members
UPDATE fit_member_membership 
SET end_date = DATE '2026-11-07' 
WHERE member_id = 10 AND active_flag = 1;

-- Update 7: Change certification name
UPDATE fit_certification 
SET name = 'Certified Personal Trainer (CPT)' 
WHERE certification_id = 01;

-- Delete 1: Remove expired trial memberships
DELETE FROM fit_member_membership 
WHERE membership_id = 09 AND active_flag = 0;

-- Delete 2: Remove old enrollment records from 2023
DELETE FROM fit_enrollment 
WHERE enrollment_date < DATE '2023-07-01' AND class_id = 01 AND member_id = 01;

-- Delete 3: Remove duplicate class equipment assignment
DELETE FROM fit_class_equipment 
WHERE class_id = 10 AND equipment_id = 02;

-- Delete 4: Remove a class trainer assignment
DELETE FROM fit_class_trainer 
WHERE class_id = 10 AND trainer_id = 04;

-- Delete 5: Remove inactive member's old membership
DELETE FROM fit_member_membership 
WHERE member_id = 05 AND active_flag = 0 AND end_date < DATE '2015-01-01';
