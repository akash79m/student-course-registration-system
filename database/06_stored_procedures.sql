
USE student_course_registration;

DELIMITER $$

CREATE PROCEDURE RegisterStudent(
    IN p_student_id INT,
    IN p_course_id INT
)
BEGIN
    DECLARE v_student_exists INT DEFAULT 0;
    DECLARE v_course_exists INT DEFAULT 0;
    DECLARE v_already_enrolled INT DEFAULT 0;
    DECLARE v_capacity INT DEFAULT 0;
    DECLARE v_enrolled_count INT DEFAULT 0;

    SELECT COUNT(*)
    INTO v_student_exists
    FROM Students
    WHERE student_id = p_student_id;

    IF v_student_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student does not exist';

    ELSE
        SELECT COUNT(*)
        INTO v_course_exists
        FROM Courses
        WHERE course_id = p_course_id;

        IF v_course_exists = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Course does not exist';

        ELSE
            SELECT COUNT(*)
            INTO v_already_enrolled
            FROM Enrollments
            WHERE student_id = p_student_id
              AND course_id = p_course_id;

            IF v_already_enrolled > 0 THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT =
                    'Student is already enrolled in this course';

            ELSE
                SELECT capacity
                INTO v_capacity
                FROM Courses
                WHERE course_id = p_course_id;

                SELECT COUNT(*)
                INTO v_enrolled_count
                FROM Enrollments
                WHERE course_id = p_course_id;

                IF v_enrolled_count >= v_capacity THEN
                    SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Course is full';

                ELSE
                    INSERT INTO Enrollments (
                        student_id,
                        course_id,
                        enrollment_date
                    )
                    VALUES (
                        p_student_id,
                        p_course_id,
                        CURRENT_DATE
                    );

                    SELECT
                        'Student successfully registered'
                        AS message;
                END IF;
            END IF;
        END IF;
    END IF;
END$$

DELIMITER ;