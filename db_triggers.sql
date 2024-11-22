use usis;

-- log every deletion of a student 
CREATE TABLE student_deletions (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reason VARCHAR(255)
);

DELIMITER //

CREATE TRIGGER after_student_delete
AFTER DELETE ON student
FOR EACH ROW
BEGIN
    INSERT INTO student_deletions (student_id, reason)
    VALUES (OLD.student_id, 'Deleted by admin');
END //

-- trigger to validate enrollment dates
CREATE TRIGGER before_enrollment_insert
BEFORE INSERT ON enrollment
FOR EACH ROW
BEGIN
    IF NEW.enrollment_date > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Enrollment date cannot be in the future';
    END IF;
END //

-- automatically set the is_current column of other semesters to false when a new semester is marked as current
CREATE TRIGGER before_update_semester
BEFORE UPDATE ON semester
FOR EACH ROW
BEGIN
    IF NEW.is_current = true THEN
        UPDATE semester
        SET is_current = false
        WHERE session_id != NEW.session_id;
    END IF;
END //

-- Ensure that grades entered for assessments do not exceed the max_score
CREATE TRIGGER before_grade_insert
BEFORE INSERT ON grade
FOR EACH ROW
BEGIN
    DECLARE max_score DECIMAL(10, 2);
    SELECT max_score INTO max_score
    FROM assessment
    WHERE assessment_id = NEW.assessment_id;

    IF NEW.score > max_score THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Score cannot exceed the maximum score for the assessment';
    END IF;
END //

-- Automatically populate the remarks column in the grade table based on the score
CREATE TRIGGER after_grade_insert
AFTER INSERT ON grade
FOR EACH ROW
BEGIN
    IF NEW.score >= 70 THEN
        UPDATE grade
        SET remarks = 'Excellent'
        WHERE grade_id = NEW.grade_id;
    ELSEIF NEW.score >= 50 THEN
        UPDATE grade
        SET remarks = 'Good'
        WHERE grade_id = NEW.grade_id;
    ELSE
        UPDATE grade
        SET remarks = 'Needs Improvement'
        WHERE grade_id = NEW.grade_id;
    END IF;
END //

DELIMITER ;
