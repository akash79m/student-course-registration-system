
USE student_course_registration;

-- 1. Calculate available seats for each course
SELECT
    c.course_code,
    c.course_name,
    c.capacity,
    COUNT(e.student_id) AS enrolled_students,
    c.capacity - COUNT(e.student_id) AS available_seats
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
GROUP BY
    c.course_id,
    c.course_code,
    c.course_name,
    c.capacity
ORDER BY available_seats ASC;

-- 2. Calculate the average grade for each course
SELECT
    c.course_code,
    c.course_name,
    COUNT(g.grade) AS graded_enrollments,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
LEFT JOIN Grades g
    ON e.student_id = g.student_id
    AND e.course_id = g.course_id
GROUP BY
    c.course_id,
    c.course_code,
    c.course_name
ORDER BY average_grade DESC;

-- 3. Find students with an average grade of at least 85
SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM Students s
JOIN Grades g
    ON s.student_id = g.student_id
WHERE g.grade IS NOT NULL
GROUP BY
    s.student_id,
    s.first_name,
    s.last_name
HAVING AVG(g.grade) >= 85
ORDER BY average_grade DESC;

-- 4. Count courses offered by each department
SELECT
    d.department_name,
    COUNT(c.course_id) AS total_courses
FROM Departments d
LEFT JOIN Courses c
    ON d.department_id = c.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY total_courses DESC;

-- 5. Find enrollments that do not yet have a grade
SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_code,
    c.course_name,
    e.enrollment_date
FROM Enrollments e
JOIN Students s
    ON e.student_id = s.student_id
JOIN Courses c
    ON e.course_id = c.course_id
LEFT JOIN Grades g
    ON e.student_id = g.student_id
    AND e.course_id = g.course_id
WHERE g.student_id IS NULL;

-- 6. Identify courses with enrollment at or above 80% capacity
SELECT
    c.course_code,
    c.course_name,
    c.capacity,
    COUNT(e.student_id) AS enrolled_students,
    ROUND(
        COUNT(e.student_id) * 100.0 / c.capacity,
        2
    ) AS capacity_percentage
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
GROUP BY
    c.course_id,
    c.course_code,
    c.course_name,
    c.capacity
HAVING COUNT(e.student_id) >= c.capacity * 0.80
ORDER BY capacity_percentage DESC;

-- 7. Display each student's number of registered courses
SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    COUNT(e.course_id) AS registered_courses
FROM Students s
LEFT JOIN Enrollments e
    ON s.student_id = e.student_id
GROUP BY
    s.student_id,
    s.first_name,
    s.last_name
ORDER BY registered_courses DESC;

-- 8. Validate that all grades are within the permitted range
SELECT
    student_id,
    course_id,
    grade
FROM Grades
WHERE grade < 0
   OR grade > 100;