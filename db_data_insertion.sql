USE usis;

INSERT INTO faculty (faculty_name)
VALUES('Faculty of Science'), ('Faculty of Arts'), ('Faculty of Engineering');

INSERT INTO department (dept_name, faculty_id, hod_name) 
VALUE('Computer Science', 1, 'Dr. Smith'), ('Physics', 1, 'Dr.Johnson'), ('Mechanical engineering', 3, 'Dr.Brown');

INSERT INTO course( course_name, dept_id, duration_years, fee_per_semester, total_units)
VALUES('Bsc Computer Science', 1, 4, 100000, 40), ('BSc Physics', 2, 3, 90000, 35), ('BSc Mechanical Engineering', 3, 5, 120000, 45);

-- Student 1
INSERT INTO student (reg_number, first_name, last_name, date_of_birth, gender, email, phone_number, next_of_kin_name, next_of_kin_phone, next_of_kin_relationship) 
VALUES ('CS2021', 'John', 'Paul', '2000-05-15', 'Male', 'johnpaul@gmail.com', '0712345678', 'Jane Sawyer', '0712345679', 'Sister');

-- Student 2
INSERT INTO student (reg_number, first_name, last_name, date_of_birth, gender, email, phone_number, next_of_kin_name, next_of_kin_phone, next_of_kin_relationship) 
VALUES ('CS2002', 'Alice', 'Wangari', '2002-11-25', 'Female', 'alicewangari@gmail.com', '0712345677', 'Peter Wangari', '0712345676', 'Father');

-- Student 3
INSERT INTO student (reg_number, first_name, last_name, date_of_birth, gender, email, phone_number, next_of_kin_name, next_of_kin_phone, next_of_kin_relationship) 
VALUES ('CS2023', 'James', 'Omondi', '2001-03-14', 'Male', 'jamesomondi@gmail.com', '0712345675', 'Nancy Amondi', '0712345674', 'Mother');

INSERT INTO semester (session_name, start_date, end_date, is_current)
VALUES ('2024/2025 Semester 1', '2024-09-01', '2024-12-31', TRUE), ('2023/2024 Semester 2', '2024-01-01', '2024-04-30', FALSE);

-- Enrollment for John Paul
INSERT INTO enrollment (student_id, course_id, session_id, current_year, current_semester, enrollment_date, status)
VALUES(1,1,1,1,1, '2024-03-10', 'Acive');

-- Enrollment for  Alice Wangari
INSERT INTO enrollment (student_id, course_id, session_id, current_year, current_semester, enrollment_date, status) 
VALUES (2, 1, 1, 1, 1, '2024-09-10', 'Active');

-- Enrollment for James Omondi
INSERT INTO enrollment (student_id, course_id, session_id, current_year, current_semester, enrollment_date, status) 
VALUES (3, 1, 1, 1, 1, '2024-09-12', 'Active');

INSERT INTO unit(unit_code, unit_name, course_id, credit_hours, year_offered, semester_offered, is_core, prerequisites)
VALUES ('CS101', 'Introduction to Programming', 1, 3, 1, 1, TRUE, ''), ('ME201', 'Thermodynamics', 3, 4, 2, 1, TRUE, '');

-- Unit Registration for James Omondi
INSERT INTO unit_registration (student_id, unit_id, session_id, registration_date, status) 
VALUES (1, 1, 1, '2024-09-12', 'Registered');

-- Unit Registration for Alice Wangari
INSERT INTO unit_registration (student_id, unit_id, session_id, registration_date, status) 
VALUES (2, 1, 1, '2024-09-14', 'Registered');

-- Unit Registration for James Omondi
INSERT INTO unit_registration (student_id, unit_id, session_id, registration_date, status) 
VALUES (3, 1, 1, '2024-09-15', 'Registered');

INSERT INTO assessment_type (type_name, description) 
VALUES ('Exam', 'End of semester examination'), ('Assignment', 'Course assignment');

INSERT INTO assessment (unit_id, type_id, assessment_name, max_score, weight_percentage, assessment_date) 
VALUES (1, 1, 'Midterm Exam', 100, 40, '2024-10-15');

-- Grade for John Paul
INSERT INTO grade (student_id, assessment_id, score, grade_letter, remarks) 
VALUES (1, 1, 85, 'A', 'Excellent performance');

-- Grade for Alice Wangari
INSERT INTO grade (student_id, assessment_id, score, grade_letter, remarks) 
VALUES (2, 1, 78, 'B+', 'Good performance');

-- Grade for James Omondi
INSERT INTO grade (student_id, assessment_id, score, grade_letter, remarks) 
VALUES (3, 1, 92, 'A', 'Outstanding performance');



