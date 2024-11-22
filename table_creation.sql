CREATE DATABASE USIS;

USE USIS;

CREATE TABLE faculty (
  faculty_id INT PRIMARY KEY AUTO_INCREMENT,
  faculty_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE department (
  dept_id INT PRIMARY KEY AUTO_INCREMENT,
  dept_name VARCHAR(255) UNIQUE NOT NULL,
  faculty_id INT NOT NULL,
  hod_name VARCHAR(255)
);

CREATE TABLE course (
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  course_name VARCHAR(255) UNIQUE NOT NULL,
  dept_id INT NOT NULL,
  duration_years INT NOT NULL,
  fee_per_semester DECIMAL NOT NULL,
  total_units INT NOT NULL
);

CREATE TABLE student (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  reg_number VARCHAR(255) UNIQUE NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone_number VARCHAR(255) UNIQUE,
  next_of_kin_name VARCHAR(255) NOT NULL,
  next_of_kin_phone VARCHAR(255) NOT NULL,
  next_of_kin_relationship VARCHAR(255)
);

CREATE TABLE semester (
  session_id INT PRIMARY KEY AUTO_INCREMENT,
  session_name VARCHAR(255) UNIQUE NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  is_current BOOLEAN DEFAULT FALSE
);

CREATE TABLE enrollment (
  enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  session_id INT NOT NULL,
  current_year INT NOT NULL,
  current_semester INT NOT NULL,
  enrollment_date DATE NOT NULL,
  status VARCHAR(200) NOT NULL -- status enum(Active, Inactive, Graduated, Withdrawn) NOT NULL
);

CREATE TABLE unit (
  unit_id INT PRIMARY KEY AUTO_INCREMENT,
  unit_code VARCHAR(255) UNIQUE NOT NULL,
  unit_name VARCHAR(255) NOT NULL,
  course_id INT NOT NULL,
  credit_hours INT NOT NULL,
  year_offered INT NOT NULL,
  semester_offered INT NOT NULL,
  is_core BOOLEAN DEFAULT TRUE,
  prerequisites TEXT
);

CREATE TABLE unit_registration (
  registration_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  unit_id INT NOT NULL,
  session_id INT NOT NULL,
  registration_date DATE NOT NULL,
  status VARCHAR(200) NOT NULL -- status enum(Registered, Dropped, Completed) NOT NULL
);

CREATE TABLE assessment_type (
  type_id INT PRIMARY KEY AUTO_INCREMENT,
  type_name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT
);

-- ALter TABLE assessment_type

CREATE TABLE assessment (
  assessment_id INT PRIMARY KEY AUTO_INCREMENT,
  unit_id INT NOT NULL,
  type_id INT NOT NULL,
  assessment_name VARCHAR(255) NOT NULL,
  max_score DECIMAL NOT NULL,
  weight_percentage DECIMAL NOT NULL,
  assessment_date DATE NOT NULL
);

CREATE TABLE grade (
  grade_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  assessment_id INT NOT NULL,
  score DECIMAL NOT NULL,
  grade_letter VARCHAR(2),
  remarks TEXT,
  graded_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table dummy_table (
id int primary key auto_increment,
first_name varchar(200),
last_name varchar(200)
);

CREATE UNIQUE INDEX enrollment_index_0 ON enrollment (student_id, course_id, session_id);

CREATE UNIQUE INDEX unit_registration_index_1 ON unit_registration (student_id, unit_id, session_id);

CREATE UNIQUE INDEX grade_index_2 ON grade (student_id, assessment_id);

-- Add foreign keys in the database
ALTER TABLE department ADD FOREIGN KEY (faculty_id) REFERENCES faculty (faculty_id);

ALTER TABLE course ADD FOREIGN KEY (dept_id) REFERENCES department (dept_id);

ALTER TABLE enrollment ADD FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE enrollment ADD FOREIGN KEY (course_id) REFERENCES course (course_id);

ALTER TABLE enrollment ADD FOREIGN KEY (session_id) REFERENCES semester (session_id);

ALTER TABLE unit ADD FOREIGN KEY (course_id) REFERENCES course (course_id);

ALTER TABLE unit_registration ADD FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE unit_registration ADD FOREIGN KEY (unit_id) REFERENCES unit (unit_id);

ALTER TABLE unit_registration ADD FOREIGN KEY (session_id) REFERENCES semester (session_id);

ALTER TABLE assessment ADD FOREIGN KEY (unit_id) REFERENCES unit (unit_id);

ALTER TABLE assessment ADD FOREIGN KEY (type_id) REFERENCES assessment_type (type_id);

ALTER TABLE grade ADD FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE grade ADD FOREIGN KEY (assessment_id) REFERENCES assessment (assessment_id);
