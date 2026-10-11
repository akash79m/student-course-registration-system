
USE student_course_registration;

-- 1. Display all students
SELECT *
FROM Students;

-- 2. Display students in Computer Science
SELECT
    student_id,
    first_name,
    last_name,
    email
FROM Students
WHERE department_id = 1;

-- 3. Display courses with their department names
SELECT
    c.course_code,
    c.course_name,
    c.credits,
    d.department_name
FROM Courses c
JOIN Departments d
    ON c.department_id = d.department_id;

-- 4. Display students with their department names
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    d.department_name
FROM Students s
JOIN Departments d
    ON s.department_id = d.department_id
ORDER BY s.last_name;

-- 5. Display courses taught by each instructor
SELECT
    c.course_code,
    c.course_name,
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name
FROM Courses c
LEFT JOIN Instructors i
    ON c.instructor_id = i.instructor_id
ORDER BY c.course_code;

-- 6. Display courses with their enrollment counts
SELECT
    c.course_code,
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
GROUP BY
    c.course_id,
    c.course_code,
    c.course_name
ORDER BY enrollment_count DESC;

-- 7. Find students enrolled in a particular course
-- Example: course_id = 1
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_code,
    c.course_name
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Courses c
    ON e.course_id = c.course_id
WHERE c.course_id = 1;

-- 8. Display students who have no registrations
SELECT
    s.student_id,
    s.first_name,
    s.last_name
FROM Students s
LEFT JOIN Enrollments e
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;