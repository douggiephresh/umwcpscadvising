DROP DATABASE CPSCAdvisor;

CREATE USER 'website'@'localhost' IDENTIFIED BY PASSWORD 'CPSCAdvisorsecret';


CREATE DATABASE IF NOT EXISTS CPSCAdvisor;
GRANT ALL PRIVILEGES ON CPSCAdvisor.* to 'CPSCadvising'@'localhost' identified by 'S1mpleS1mple';
USE CPSCAdvisor;



CREATE TABLE IF NOT EXISTS advisor (
	advisor_id INT NOT NULL AUTO_INCREMENT,
	advisor_user_name VARCHAR(25) NOT NULL,
	advisor_last_name VARCHAR(25) NOT NULL,
	advisor_first_name VARCHAR(25) NOT NULL,
	advisor_password VARCHAR(25) NOT NULL,
	PRIMARY KEY (advisor_id)
);


CREATE TABLE IF NOT EXISTS student (
	student_id INT NOT NULL AUTO_INCREMENT,
	magic_id INT NOT NULL,
	student_last_name VARCHAR(25) NOT NULL,
	student_first_name VARCHAR(25) NOT NULL,
	student_email VARCHAR(25) NOT NULL,
	student_year INT NOT NULL,
	student_graduation_semester VARCHAR(25) NOT NULL,
	PRIMARY KEY (student_id)
);


CREATE TABLE IF NOT EXISTS track (
	track_id INT NOT NULL AUTO_INCREMENT,
	track_name VARCHAR(25) NOT NULL,
	PRIMARY KEY (track_id)
);


CREATE TABLE IF NOT EXISTS course  (
	course_id INT NOT NULL AUTO_INCREMENT,
	course_number VARCHAR(25) NOT NULL,
	course_name VARCHAR(25) NOT NULL,
	course_description VARCHAR(250) NOT NULL,
	PRIMARY KEY (course_id)
);


CREATE TABLE IF NOT EXISTS student_advisor (
	student_id INT NOT NULL,
	advisor_id INT NOT NULL,
	FOREIGN KEY(student_id ) REFERENCES student(student_id),
	FOREIGN KEY(advisor_id) REFERENCES advisor(advisor_id)
);


CREATE TABLE IF NOT EXISTS student_track (	
	student_id INT NOT NULL,
	track_id INT NOT NULL,
	FOREIGN KEY(student_id ) REFERENCES student(student_id),
	FOREIGN KEY(track_id) REFERENCES track(track_id)
);


CREATE TABLE IF NOT EXISTS track_course (
	track_id INT NOT NULL,
	course_id INT NOT NULL,
	FOREIGN KEY(track_id ) REFERENCES track(track_id),
	FOREIGN KEY(course_id) REFERENCES course(course_id)
);


CREATE TABLE IF NOT EXISTS student_course (
	student_id INT NOT NULL,
	course_id INT NOT NULL,
	FOREIGN KEY(student_id ) REFERENCES student(student_id),
	FOREIGN KEY(course_id) REFERENCES course(course_id)
);

INSERT INTO advisor (advisor_id, advisor_user_name, advisor_last_name, advisor_first_name, advisor_password) VALUES
(1, 'ifinlayson', 'finlayson', 'ian', 'bananas');

INSERT INTO course (course_id, course_number, course_name, course_description) VALUES
(1, 'cpsc430', 'Software Design', 'We play games to learn about team problem solving.');

INSERT INTO student (student_id, student_user_name, student_last_name, student_first_name, student_email, student_year) VALUES
(1, 'dradoye', 'radoye', 'douglas', 'test@test.com', 'Senior');


