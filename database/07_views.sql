
USE student_course_registration;

CREATE OR REPLACE VIEW student_course_report AS
SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email,
    c.course_code,
    c.course_name,
    i.first_name AS instructor_first_name,
    i.last_name AS instructor_last_name,
    e.enrollment_date,
    g.grade,
    g.graded_on
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Courses c
    ON e.course_id = c.course_id
LEFT JOIN Instructors i
    ON c.instructor_id = i.instructor_id
LEFT JOIN Grades g
    ON e.student_id = g.student_id
    AND e.course_id = g.course_id;