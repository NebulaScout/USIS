use usis;

-- display a list of students along with their enrolled courses
CREATE VIEW student_course_view AS
SELECT 
    s.student_id,
    s.reg_number,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_id,
    c.course_name,
    e.current_year,
    e.current_semester,
    e.status AS enrollment_status
FROM 
    student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id;

-- show students their assessments and the grades they received
CREATE VIEW student_grades_view AS
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    a.assessment_name,
    g.score,
    g.grade_letter,
    g.remarks,
    u.unit_name
FROM 
    grade g
JOIN assessment a ON g.assessment_id = a.assessment_id
JOIN unit u ON a.unit_id = u.unit_id
JOIN student s ON g.student_id = s.student_id;

-- display a summary of courses, their departments and faculties
CREATE VIEW course_overview_view AS
SELECT 
    c.course_id,
    c.course_name,
    d.dept_name AS department,
    f.faculty_name AS faculty,
    c.duration_years,
    c.fee_per_semester,
    c.total_units
FROM 
    course c
JOIN department d ON c.dept_id = d.dept_id
JOIN faculty f ON d.faculty_id = f.faculty_id;

-- list the students and the units that they registered for
CREATE VIEW unit_registration_view AS
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    u.unit_code,
    u.unit_name,
    u.credit_hours,
    ur.registration_date,
    ur.status AS registration_status
FROM 
    unit_registration ur
JOIN unit u ON ur.unit_id = u.unit_id
JOIN student s ON ur.student_id = s.student_id;

-- get semester information including the number of enrolled students
CREATE VIEW semester_summary_view AS
SELECT 
    sem.session_id,
    sem.session_name,
    sem.start_date,
    sem.end_date,
    sem.is_current,
    COUNT(e.enrollment_id) AS total_students_enrolled
FROM 
    semester sem
LEFT JOIN enrollment e ON sem.session_id = e.session_id
GROUP BY sem.session_id, sem.session_name, sem.start_date, sem.end_date, sem.is_current;

-- display the total number of students enrolled in courses under each faculty
CREATE VIEW faculty_enrollment_view AS
SELECT 
    f.faculty_name,
    COUNT(e.enrollment_id) AS total_enrollments
FROM 
    faculty f
JOIN department d ON f.faculty_id = d.faculty_id
JOIN course c ON d.dept_id = c.dept_id
JOIN enrollment e ON c.course_id = e.course_id
GROUP BY f.faculty_name;



SELECT * FROM student_course_view;

SELECT * FROM student_grades_view WHERE grade_letter = 'A';

SELECT * FROM course_overview_view;

SELECT * FROM unit_registration_view WHERE registration_status = 'Registered';

SELECT * FROM semester_summary_view WHERE is_current = 1;

SELECT * FROM faculty_enrollment_view;