USE USIS;

-- Retrieve all students
SELECT * FROM student;

-- Get specific student data
SELECT * FROM student 
WHERE reg_number = 'CS2021';

--  View all student enrollments, including the course and session information
SELECT e.enrollment_id, s.reg_number, s.first_name, s.last_name, c.course_name, se.session_name, e.enrollment_date, e.status 
FROM enrollment e
JOIN student s ON e.student_id = s.student_id
JOIN course c ON e.course_id = c.course_id
JOIN semester se ON e.session_id = se.session_id;

-- View a list of all courses along with their corresponding departments
SELECT c.course_name, d.dept_name, f.faculty_name 
FROM course c
JOIN department d ON c.dept_id = d.dept_id
JOIN faculty f ON d.faculty_id = f.faculty_id;

-- View the units a particular student has registered for
SELECT s.reg_number, s.first_name, u.unit_code, u.unit_name, ur.registration_date, ur.status
FROM unit_registration ur
JOIN student s ON ur.student_id = s.student_id
JOIN unit u ON ur.unit_id = u.unit_id
WHERE s.reg_number = 'CS2002';

-- View the grades that a particular student has
SELECT s.reg_number, s.first_name, a.assessment_name, g.score, g.grade_letter, g.remarks
FROM grade g
JOIN student s ON g.student_id = s.student_id
JOIN assessment a ON g.assessment_id = a.assessment_id
WHERE s.reg_number = 'CS2023';

-- List of faculties and their departments
SELECT f.faculty_name, d.dept_name
FROM faculty f
JOIN department d ON f.faculty_id = d.faculty_id;

-- Retrieve a list of students registered in a particular unit
SELECT s.reg_number, s.first_name, s.last_name, c.course_name
FROM enrollment e
JOIN student s ON e.student_id = s.student_id
JOIN course c ON e.course_id = c.course_id
WHERE c.course_name = 'BSc Computer Science';

-- Get all semesters in progress
SELECT session_id, session_name, start_date, end_date, is_current
FROM semester;

-- Get the number of students enrolled in a course
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM enrollment e
JOIN course c ON e.course_id = c.course_id
GROUP BY c.course_name;


