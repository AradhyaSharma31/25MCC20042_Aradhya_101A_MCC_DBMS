CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Departments VALUES (1, 'Computer Science');
INSERT INTO Departments VALUES (2, 'Mechanical');
INSERT INTO Departments VALUES (3, 'Electrical');

INSERT INTO Students VALUES (101, 'Aradhya', 1);
INSERT INTO Students VALUES (102, 'Rohan', 2);
INSERT INTO Students VALUES (103, 'Priya', 1);
INSERT INTO Students VALUES (104, 'Amit', 3);
INSERT INTO Students VALUES (105, 'Neha', NULL);

INSERT INTO Courses VALUES (201, 'DBMS');
INSERT INTO Courses VALUES (202, 'Operating Systems');
INSERT INTO Courses VALUES (203, 'Thermodynamics');
INSERT INTO Courses VALUES (204, 'Networks');

INSERT INTO Enrollment VALUES (101, 201);
INSERT INTO Enrollment VALUES (101, 202);
INSERT INTO Enrollment VALUES (102, 203);
INSERT INTO Enrollment VALUES (103, 201);

-- 1. Students enrolled in courses
SELECT *
FROM Students s
INNER JOIN Enrollment e
	ON s.student_id = e.student_id
INNER JOIN Courses c
	ON e.course_id = c.course_id;

-- 2. Find students not enrolled in any course
SELECT *
FROM Students s
LEFT JOIN Enrollment e
	ON s.student_id = e.student_id
WHERE course_id IS NULL;

-- 3. Display all courses with or without enrolled students
SELECT c.course_name, s.student_name
FROM Courses c
LEFT JOIN Enrollment e ON c.course_id = e.course_id
LEFT JOIN Students s ON e.student_id = s.student_id;

-- 4. Show students with department info using SELF JOIN or multiple joins.
SELECT s.student_name, d.dept_name
FROM Students s
LEFT JOIN Departments d
	ON s.dept_id = d.dept_id;

-- 5. Display all possible student-course combinations (CROSS JOIN).
SELECT s.student_name, c.course_name 
FROM students s 
CROSS JOIN courses c;
