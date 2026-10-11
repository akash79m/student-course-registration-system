# Student Course Registration System

## Project Overview

The Student Course Registration System is a relational database project built using MySQL. It manages student information, academic departments, instructors, courses, course registrations, and grades.

The project demonstrates relational database design, SQL querying, data integrity, stored procedures, views, indexes, and transaction management.

## Objectives

* Design a relational database with related entities.
* Store and manage student, instructor, course, and grade information.
* Support student course registration while preventing duplicate registrations.
* Enforce referential integrity and business rules.
* Generate reports using SQL joins, aggregate functions, and views.
* Explore database performance optimization using indexes.

## Technologies Used

* MySQL
* MySQL Workbench
* SQL
* Markdown
* Git and GitHub (for version control and project sharing)

## Database Structure

The database contains six tables:

| Table       | Purpose                                                         |
| ----------- | --------------------------------------------------------------- |
| Departments | Stores academic departments                                     |
| Students    | Stores student details                                          |
| Instructors | Stores instructor details                                       |
| Courses     | Stores course information, capacity, and instructor assignments |
| Enrollments | Connects students with courses                                  |
| Grades      | Stores grades associated with enrollments                       |

The `Enrollments` table implements the many-to-many relationship between students and courses. Its composite primary key prevents the same student from registering for the same course more than once.

See `documentation/er_diagram.md` for the entity relationship diagram.

## Features

* Student, department, instructor, and course data management
* Primary and foreign key constraints
* Unique constraints and validation checks
* Duplicate registration prevention
* Course capacity validation through a stored procedure
* Student-course reporting through a database view
* Enrollment and grade analysis using SQL queries
* Indexes to support common searches and joins
* Transaction examples demonstrating COMMIT and ROLLBACK

## Project Structure

```text
Student-Course-Registration-System/
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_sample_data.sql
│   ├── 04_basic_queries.sql
│   ├── 05_advanced_queries.sql
│   ├── 06_stored_procedures.sql
│   ├── 07_views.sql
│   └── 08_indexes.sql
├── documentation/
│   ├── requirements.md
│   ├── normalization.md
│   └── er_diagram.md
└── README.md
```

## Setup Instructions

1. Install MySQL Server and MySQL Workbench.

2. Open the SQL scripts in the `database` folder using MySQL Workbench.

3. Execute the scripts in the following order in a fresh database environment:

   * `01_create_database.sql`
   * `02_create_tables.sql`
   * `03_insert_sample_data.sql`
   * `04_basic_queries.sql`
   * `05_advanced_queries.sql`
   * `06_stored_procedures.sql`
   * `07_views.sql`
   * `08_indexes.sql`

4. Review the query results and test the stored procedure and view.

**Important:** Run the setup scripts in a fresh database. The sample-data script inserts records, and the index script creates indexes that may already exist if the database has been set up previously. Do not rerun these scripts against an existing populated database without resetting it appropriately.

## Example Stored Procedure

The `RegisterStudent` procedure checks whether the student and course exist, prevents duplicate registrations, verifies course capacity, and inserts the registration when the checks pass.

Example call:

```sql
CALL RegisterStudent(3, 1);
```

The example succeeds only if student 3 is not already enrolled in course 1 and the course has available capacity.

## Learning Outcomes

This project provides practical experience with relational database modeling, SQL joins, aggregate queries, constraints, stored procedures, views, indexes, and transaction management.

## Future Improvements

* Add automated SQL test cases.
* Implement triggers or additional registration rules.
* Build a simple web interface.
* Deploy the database to a cloud environment.
* Add more realistic reporting and analytics.

## Disclaimer

This is an educational portfolio project using sample data. It is not a production student information system.
