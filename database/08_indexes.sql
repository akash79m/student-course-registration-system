
USE student_course_registration;

-- Speed up searches by department
CREATE INDEX idx_students_department
    ON Students(department_id);

CREATE INDEX idx_instructors_department
    ON Instructors(department_id);

CREATE INDEX idx_courses_department
    ON Courses(department_id);

-- Speed up searches by course instructor
CREATE INDEX idx_courses_instructor
    ON Courses(instructor_id);

-- Speed up queries that find students enrolled in a course
CREATE INDEX idx_enrollments_course
    ON Enrollments(course_id);

-- Speed up queries that filter grades by course
CREATE INDEX idx_grades_course
    ON Grades(course_id);