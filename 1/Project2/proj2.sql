-- Drop child first, and then parent
DROP TABLE IF EXISTS fit_class_trainer;
DROP TABLE IF EXISTS fit_enrollment;
DROP TABLE IF EXISTS fit_class_equipment;
DROP TABLE IF EXISTS fit_class;
DROP TABLE IF EXISTS fit_equipment;
DROP TABLE IF EXISTS fit_trainer;
DROP TABLE IF EXISTS fit_certification;
DROP TABLE IF EXISTS fit_specialty;
DROP TABLE IF EXISTS fit_member_membership;
DROP TABLE IF EXISTS fit_member;
DROP TABLE IF EXISTS fit_membership;

CREATE TABLE fit_membership (
	membership_id				NUMBER PRIMARY KEY,
	name						VARCHAR2(30)
);

CREATE TABLE fit_member (
	member_id					NUMBER PRIMARY KEY,
	first_name					VARCHAR2(30),
	last_name					VARCHAR2(30) NOT NULL,
	dob							DATE,
	phone_number				VARCHAR2(12),
	email						VARCHAR2(30)
);

CREATE TABLE fit_member_membership (
	member_id					NUMBER REFERENCES fit_member(member_id),
	membership_id				NUMBER REFERENCES fit_membership(membership_id),
	CONSTRAINT PK_member 		PRIMARY KEY (member_id, membership_id),
	start_date					DATE,
	end_date					DATE,
	fee							NUMBER,
	active_flag					CHAR(1)
);

CREATE TABLE fit_specialty (
	specialty_id				NUMBER PRIMARY KEY,
	name						VARCHAR2(30)
);

CREATE TABLE fit_certification (
	certification_id			NUMBER PRIMARY KEY,
	name						VARCHAR2(30)
);

CREATE TABLE fit_trainer (
	trainer_id					NUMBER PRIMARY KEY,
	first_name					VARCHAR2(30),
	last_name					VARCHAR2(30) NOT NULL,
	certification_id			NUMBER REFERENCES fit_certification(certification_id),
	specialty_id				NUMBER REFERENCES fit_specialty(specialty_id),
	phone_number				VARCHAR2(12)
);

CREATE TABLE fit_equipment (
	equipment_id				NUMBER PRIMARY KEY,
	name						VARCHAR2(30),
	description					VARCHAR2(100),
	purchase_date				DATE
);

CREATE TABLE fit_class (
	class_id					NUMBER PRIMARY KEY,
	name						VARCHAR2(30) NOT NULL,
	description					VARCHAR2(100),
	max_number_participants		NUMBER
);

CREATE TABLE fit_class_equipment (
	class_id					NUMBER REFERENCES fit_class(class_id),
	equipment_id				NUMBER REFERENCES fit_equipment(equipment_id),
	CONSTRAINT PK_class_equip	PRIMARY KEY (class_id, equipment_id)
);

CREATE TABLE fit_enrollment (
	class_id					NUMBER REFERENCES fit_class(class_id),
	member_id					NUMBER REFERENCES fit_member(member_id),
	CONSTRAINT PK_enrollment	PRIMARY KEY (class_id, member_id),
	enrollment_date				DATE
);

CREATE TABLE fit_class_trainer (
	class_id					NUMBER REFERENCES fit_class(class_id),
	trainer_id					NUMBER REFERENCES fit_trainer(trainer_id),
	CONSTRAINT PK_class_train	PRIMARY KEY (class_id, trainer_id)
);

