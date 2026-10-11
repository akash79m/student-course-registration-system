
USE student_course_registration;

-- 1. Departments
INSERT INTO Departments (department_name)
VALUES
    ('Computer Science'),
    ('Business Administration'),
    ('Mathematics'),
    ('Biology');

-- 2. Students
INSERT INTO Students
    (first_name, last_name, email, date_of_birth, department_id)
VALUES
    ('Alex', 'Martin', 'alex.martin@example.com', '2002-04-15', 1),
    ('Emma', 'Wilson', 'emma.wilson@example.com', '2001-09-22', 1),
    ('Daniel', 'Brown', 'daniel.brown@example.com', '2003-01-10', 2),
    ('Sophia', 'Taylor', 'sophia.taylor@example.com', '2002-07-18', 3),
    ('Liam', 'Anderson', 'liam.anderson@example.com', '2001-11-05', 1),
    ('Olivia', 'Thomas', 'olivia.thomas@example.com', '2003-03-27', 4);

-- 3. Instructors
INSERT INTO Instructors
    (first_name, last_name, email, department_id)
VALUES
    ('James', 'Carter', 'james.carter@example.com', 1),
    ('Sarah', 'Mitchell', 'sarah.mitchell@example.com', 2),
    ('Robert', 'Lee', 'robert.lee@example.com', 3),
    ('Emily', 'Clark', 'emily.clark@example.com', 4);

-- 4. Courses
INSERT INTO Courses
    (course_code, course_name, credits, capacity, department_id, instructor_id)
VALUES
    ('CS101', 'Introduction to Programming', 3, 30, 1, 1),
    ('CS201', 'Database Systems', 3, 25, 1, 1),
    ('BUS101', 'Introduction to Business', 3, 40, 2, 2),
    ('MATH101', 'Calculus I', 4, 35, 3, 3),
    ('BIO101', 'Introduction to Biology', 3, 30, 4, 4),
    ('CS301', 'Software Engineering', 3, 25, 1, 1);

-- 5. Enrollments
INSERT INTO Enrollments (student_id, course_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 6),
    (2, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1),
    (5, 2),
    (5, 6),
    (6, 5);

-- 6. Grades
INSERT INTO Grades (student_id, course_id, grade, graded_on)
VALUES
    (1, 1, 88.50, '2026-04-20'),
    (1, 2, 91.00, '2026-04-22'),
    (1, 6, 85.00, '2026-04-25'),
    (2, 1, 79.50, '2026-04-20'),
    (2, 2, 87.00, '2026-04-22'),
    (3, 3, 92.00, '2026-04-24'),
    (4, 4, 81.00, '2026-04-26'),
    (5, 1, 90.00, '2026-04-20'),
    (5, 2, 94.50, '2026-04-22'),
    (6, 5, 76.00, '2026-04-23');