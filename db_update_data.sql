USE usis;

-- Physics belongs to the faculty of science
UPDATE department
SET faculty_id = 1 
WHERE dept_id=2;

-- Update the student email
UPDATE student
SET email = 'newjohnpaul@gmail.com'
WHERE reg_number = 'CS2021';

-- Changes the student enrollment status
UPDATE enrollment
SET status = 'Graduated'
WHERE student_id = 1 AND course_id = 1 AND session_id = 1;

-- update course fee per semester
UPDATE course
SET fee_per_semester = 110000
WHERE course_name = 'BSc Computer Science';

-- Update a student's next of kin information
UPDATE student
SET next_of_kin_name = 'Michael Paul', next_of_kin_phone = '0701234567', next_of_kin_relationship = 'Brother'
WHERE reg_number = 'CS2021';

-- Update the assessment name from mid-term to cat
UPDATE assessment
SET assessment_name = 'CAT'
WHERE assessment_id = 1;

-- Update the current year of studey for a stuednt in their enrollment
UPDATE enrollment
SET current_year = 2, current_semester = 1
WHERE student_id = 2 AND course_id = 1 AND session_id = 1;


