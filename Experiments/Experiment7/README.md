* **Student Name:** Aradhya Sharma
* **UID:** 25MCC20042
* **Branch:** MCA (Cloud Computing & Devops)
* **Section/Group:** MCC-101 A
* **Semester:** 2
* **Date of Performance:** 31-03-2026
* **Subject Name:** Technical Training - I
* **Subject Code:** 25CAP-652

---

## Aim

Implementation of joins in PostgreSQL (inner join, left join, right join, self join and cross join)

---

## Tools Used

* PostgreSQL
* pgAdmin
* Windows Operating System

---

## Objectives

Apply joins to a real-world database schema (e.g., Students, Courses, Enrollments, Departments)

---

## Theory

A JOIN in SQL is used to combine rows from two or more tables based on a related column between them. Joins are essential in relational databases because data is often stored in multiple tables to reduce redundancy and improve organization.

### Types of Joins Used in this Experiment:

1. **INNER JOIN:**
   Returns only the matching records from both tables.

2. **LEFT JOIN:**
   Returns all records from the left table and the matching records from the right table. If no match is found, NULL values are returned for the right table columns.

3. **RIGHT JOIN:**
   Returns all records from the right table and the matching records from the left table. If no match is found, NULL values are returned for the left table columns.

4. **SELF JOIN:**
   A table is joined with itself to represent relationships within the same table, such as mentor-student or manager-employee relationships.

5. **CROSS JOIN:**
   Returns the Cartesian product of two tables, i.e., all possible combinations of rows from both tables.

---

## Experiment Steps

### Step 0: Creating tables and inserting records

```sql id="s9u9pd"
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
```
<img width="355" height="168" alt="image" src="https://github.com/user-attachments/assets/ca5b900e-837f-4a83-8a12-deafb5bdb847" />


<img width="291" height="142" alt="image" src="https://github.com/user-attachments/assets/eddc7f65-4454-4a16-856f-a265bf1d29cb" />


<img width="232" height="134" alt="image" src="https://github.com/user-attachments/assets/0684f52f-aea0-4449-b678-efc663a6c47d" />


<img width="291" height="118" alt="image" src="https://github.com/user-attachments/assets/b2516687-8a37-4b7e-9357-6f7275ee4723" />

---

### Step 1: Queries to list students with their enrolled courses (INNER JOIN)

```sql id="x4b0fs"
SELECT s.student_id, s.student_name, c.course_name
FROM Students s
INNER JOIN Enrollment e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;
```
### Output 
<img width="439" height="138" alt="image" src="https://github.com/user-attachments/assets/6f522440-5222-4e8b-b9e3-47c6c044aa7c" />

---

### Step 2:  Find students not enrolled in any course (LEFT JOIN). 

```sql id="nsd7v6"
SELECT s.student_id, s.student_name
FROM Students s
LEFT JOIN Enrollment e ON s.student_id = e.student_id
WHERE course_id IS NULL;

```
### Output 
<img width="287" height="89" alt="image" src="https://github.com/user-attachments/assets/3ba447e1-9c2a-4adf-9728-ef899c554fe1" />

---

### Step 3:  Display all courses with or without enrolled students (RIGHT JOIN).

```sql id="e7m3bb"
SELECT s.student_name, c.course_name
FROM students s
RIGHT JOIN enrollment e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;
```
### Output 
<img width="351" height="136" alt="image" src="https://github.com/user-attachments/assets/fa2667e4-a726-4c0d-a8cf-11855bf6a77a" />

---

### Step 4: Show students with department info using SELF JOIN or multiple joins. 

```sql id="8yzn5j"
SELECT s.student_name, d.dept_name
FROM Students s
LEFT JOIN Departments d
    ON s.dept_id = d.dept_id
LEFT JOIN Enrollment e
    ON s.student_id = e.student_id;
```
### Output 
<img width="352" height="165" alt="image" src="https://github.com/user-attachments/assets/e4b75c4b-0b17-4e7a-a78f-53dae2806baa" />

---

### Step 5: Display all possible student-course combinations (CROSS JOIN). (Oracle, SAP, IBM, Microsoft) 

```sql id="y4a1rl"
SELECT s.student_name, c.course_name 
FROM students s 
CROSS JOIN courses c;
```
### Output 
<img width="351" height="416" alt="image" src="https://github.com/user-attachments/assets/8bf46907-7add-4b6d-ad9a-2c194aea58cd" />

---

## Learning Outcome

* Join Understanding: I learned how to use different types of SQL joins to retrieve related data from multiple tables.
* Practical Database Skills: I understood how real-world schemas such as Students, Courses, Enrollments, and Departments are related in a relational database.
* Data Analysis Ability: I learned how to identify matching and non-matching records using INNER JOIN, LEFT JOIN, and RIGHT JOIN.
* Advanced SQL Usage: I understood the use of SELF JOIN for hierarchical relationships and CROSS JOIN for generating all possible combinations.
* PostgreSQL Practice: I gained hands-on experience in writing and executing SQL queries in PostgreSQL / pgAdmin.
---

