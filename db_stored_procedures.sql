USE usis;

-- procedure to insert a new student
DELIMITER // 

CREATE PROCEDURE addStudent (
IN reg_number VARCHAR(255),
IN firs_name VARCHAR(100),
IN last_name VARCHAR(100),
IN date_of_birth DATE,
IN gender VARCHAR(10),
IN email VARCHAR(100),
IN phone_number VARCHAR(15),
IN next_of_kin_name VARCHAR(100),
IN next_of_kin_phone VARCHAR(15),
IN next_of_kin_relationship VARCHAR(30)
)
BEGIN
INSERT INTO student(
reg_number, first_name, last_name, date_of_birth, gender, email,
phone_number, next_of_kin_name, next_of_kin_phone, next_of_kin_relationship
)
VALUES(
reg_number, first_name, last_name, date_of_birth, gender, email,
phone_number, next_of_kin_name, next_of_kin_phone, next_of_kin_relationship
);
END //

-- DELIMITER ;

-- DELIMITER //
-- Add a new enrollment for a student
CREATE PROCEDURE enrollStudent(
IN student_id INT,
IN course_id INT,
IN session_id INT,
IN current_year INT,
IN current_semester INT,
IN enrollment_date DATE,
IN status VARCHAR(100)
)

BEGIN 
INSERT INTO enrollment(
student_id, course_id, session_id, current_year, current_semester, enrollment_date, status
)
VALUES (
student_id, course_id, session_id, current_year, current_semester, enrollment_date, status
);
END //

-- update a student's contact
CREATE PROCEDURE updateStudentContact(
    IN reg_number VARCHAR(255),
    IN new_email VARCHAR(255),
    IN new_phone_number VARCHAR(255)
)
BEGIN
    UPDATE student
    SET email = new_email, phone_number = new_phone_number
    WHERE reg_number = reg_number;
END //

-- retrieves all students enrolled in a course
CREATE PROCEDURE getStudentsByCourse(IN course_id INT)
BEGIN
    SELECT s.reg_number, s.first_name, s.last_name, e.enrollment_date, e.status
    FROM enrollment e
    JOIN student s ON e.student_id = s.student_id
    WHERE e.course_id = course_id;
END //

-- fetch grades for a specific student
CREATE PROCEDURE getStudentGrades(IN student_id INT)
BEGIN
    SELECT g.grade_id, a.assessment_name, g.score, g.grade_letter, g.remarks
    FROM grade g
    JOIN assessment a ON g.assessment_id = a.assessment_id
    WHERE g.student_id = student_id;
END //

-- delete student records
CREATE PROCEDURE deleteStudent(IN student_id INT)
BEGIN
    DELETE FROM grade WHERE student_id = student_id;
    DELETE FROM unit_registration WHERE student_id = student_id;
    DELETE FROM enrollment WHERE student_id = student_id;
    DELETE FROM student WHERE student_id = student_id;
END //

DELIMITER ;

-- call procedures
CALL addStudent (
'CS2008', 'Jakes', 'Manson', '2002-02-16', 'Female', 'manson@gmail.com',
'0701234567', 'Emily Manson', '0701234567', 'Mother'
);

CALL enrollStudent(5, 1, 1, 1, 1, '2024-11-01', 'Active');

CALL updateStudentContact('CS2008', 'jakesnewmanson@gmail.com', '0723456789');

CALL getStudentsByCourse(1);

CALL getStudentGrades(2);

CALL deleteStudent();

