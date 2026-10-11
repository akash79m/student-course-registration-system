# Student Course Registration System

## 1. Project Overview

The Student Course Registration System is a relational database designed to manage students, departments, instructors, courses, course registrations, and grades.

The system demonstrates relational database design, normalization, primary and foreign keys, data integrity, SQL queries, stored procedures, views, indexes, and transactions using MySQL.

## 2. Functional Requirements

### Student Management
- Add new students.
- Update student information.
- Store student email and date of birth.
- Associate each student with a department.
- Prevent duplicate student email addresses.

### Department Management
- Maintain departments.
- Store a unique department name.
- Associate students, instructors, and courses with departments.

### Instructor Management
- Add and maintain instructor information.
- Associate each instructor with a department.
- Assign instructors to courses.

### Course Management
- Create and maintain courses.
- Store course code, course name, credits, and capacity.
- Associate each course with a department.
- Assign an instructor to a course.

### Course Registration
- Register students for courses.
- Prevent duplicate registrations.
- Prevent registration when a course is full.
- Store the enrollment date.

### Grade Management
- Store grades for student course enrollments.
- Allow grades between 0 and 100.
- Store the date a grade was recorded.
- Allow an enrollment to exist without a grade.

## 3. Business Rules

1. Each department has a unique department ID and department name.
2. A student belongs to one department.
3. An instructor belongs to one department.
4. A course belongs to one department.
5. A department can have many students, instructors, and courses.
6. An instructor can teach multiple courses.
7. A course can have one assigned instructor in this version of the system.
8. A student can register for multiple courses.
9. A course can have multiple students.
10. A student cannot register for the same course more than once.
11. A course has a maximum enrollment capacity.
12. A grade belongs to a specific student-course enrollment.
13. An enrollment can have zero or one grade.
14. Grades must be between 0 and 100.

## 4. Non-Functional Requirements

### Data Integrity
- Primary keys uniquely identify records.
- Foreign keys maintain relationships between tables.
- Unique constraints prevent duplicate department names, student emails, instructor emails, and course codes.
- CHECK constraints enforce valid credits, capacity, and grade values.

### Performance
- Indexes are created on frequently queried foreign-key columns.
- Queries use appropriate JOIN and aggregation techniques.

### Maintainability
- Database objects are separated into organized SQL scripts.
- Database design and normalization are documented.
- SQL objects such as procedures and views are documented.

## 5. Database Entities

The system contains six main entities:

| Entity | Purpose |
|---|---|
| Departments | Stores academic departments |
| Students | Stores student information |
| Instructors | Stores instructor information |
| Courses | Stores available courses |
| Enrollments | Connects students and courses |
| Grades | Stores grades for enrollments |

## 6. Technologies

- MySQL
- MySQL Workbench
- SQL
- GitHub
- Mermaid ER Diagram