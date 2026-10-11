
USE student_course_registration;

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (department_id)
) ENGINE = InnoDB;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE,
    department_id INT NOT NULL,
    PRIMARY KEY (student_id),
    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
) ENGINE = InnoDB;

CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    PRIMARY KEY (instructor_id),
    CONSTRAINT fk_instructor_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
) ENGINE = InnoDB;

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    capacity INT NOT NULL,
    department_id INT NOT NULL,
    instructor_id INT,
    PRIMARY KEY (course_id),
    CONSTRAINT fk_course_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),
    CONSTRAINT fk_course_instructor
        FOREIGN KEY (instructor_id)
        REFERENCES Instructors(instructor_id)
        ON DELETE SET NULL,
    CONSTRAINT chk_course_credits
        CHECK (credits BETWEEN 1 AND 6),
    CONSTRAINT chk_course_capacity
        CHECK (capacity > 0)
) ENGINE = InnoDB;

CREATE TABLE Enrollments (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Grades (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade DECIMAL(5,2),
    graded_on DATE,
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_grade_enrollment
        FOREIGN KEY (student_id, course_id)
        REFERENCES Enrollments(student_id, course_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_grade_range
        CHECK (grade IS NULL OR grade BETWEEN 0 AND 100)
) ENGINE = InnoDB;