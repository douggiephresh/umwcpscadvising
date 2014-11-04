SELECT * FROM *;

/************************************
*****	Enter Information Page	*****
************************************/

###
# FROM Database
###

--This will return the list of advisors from the DB
SELECT advisor_last_name from advisor;
SELECT track_name from track;

###
# TO Database
###

--Enter a new student to student table
	--Generated "magic ID"
	--Last Name
	--First Name
	--Email
	--Year
	--Graduation Semester
INSERT INTO student (magic_id, student_last_name, student_first_name, student_email, student_year, student_graduation_semester)
VALUES (magic, last, first, email, year, semester);

--Match them with a track
	--Track Name
	--Magic ID
INSERT INTO student_track (student_id, track_id) VALUES (SELECT student_id FROM student WHERE magic_id = magic, SELECT track_id FROM track WHERE track_name = track);

--Match them with their advisor
	--Advisor_Last
	--Magic ID
INSERT INTO student_advisor (student_id, advisor_id) VALUES (SELECT student_id FROM student WHERE magic_id = magic, SELECT advisor_id FROM advisors WHERE advisor_last_name = advisor_last);