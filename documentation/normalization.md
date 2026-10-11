# Database Normalization

## 1. Overview

The Student Course Registration System was designed using relational database normalization principles.

The goal of normalization is to reduce duplicate data, improve data integrity, and make the database easier to maintain.

The final database design follows the principles of:

- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)

---

## 2. First Normal Form (1NF)

A table satisfies First Normal Form when:

- Each column contains atomic values.
- There are no repeating groups.
- Each record can be uniquely identified.

### Example

Instead of storing multiple courses in a single student record:

| student_id | student_name | courses |
|---|---|---|
| 1 | Alex Martin | CS101, CS201, CS301 |

the system stores each registration separately in the `Enrollments` table:

| student_id | course_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 1 | 6 |

This keeps the data atomic and allows students to register for any number of courses.

---

## 3. Second Normal Form (2NF)

A table satisfies Second Normal Form when:

- It is already in 1NF.
- Every non-key attribute depends on the entire primary key.

The `Enrollments` table uses a composite primary key:

```text
(student_id, course_id)