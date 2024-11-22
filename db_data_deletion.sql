USE usis;

-- Delete a table
DROP TABLE dummy_table;

-- delete a specific student
DELETE FROM student
WHERE reg_number = 'CS2023';

-- delete student from a specific course
DELETE FROM enrollment
WHERE course_id = 1;

-- delete a student's enrollment in a particular course and session 
DELETE FROM enrollment
WHERE student_id = 2 AND course_id = 1 AND session_id = 1;

-- delete a unit
DELETE FROM unit
WHERE unit_code = 'CS101';

-- delete all grade records for a student
DELETE FROM grade
WHERE student_id = 3;

-- deleting a department

-- delete the units associated under the departments courses
DELETE u
FROM unit u
JOIN course c ON u.course_id = course_id
JOIN department d ON c.dept_id = d.dept_id
WHERE d.dept_name = 'Computer Science';
-- delete the courses under the department
DELETE FROM course
WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'Computer Science');
-- delete the department 
DELETE FROM department 
WHERE dept_name = 'Computer Science';

-- delete an  assessment type
DELETE FROM assessment_type
WHERE type_name = 'CAT';

-- delete all students with no enrollments
DELETE FROM student
WHERE student_id NOT IN (SELECT student_id FROM enrollment);

