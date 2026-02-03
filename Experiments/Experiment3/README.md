WORKSHEET 3

Student Name: Aradhya Sharma 	

UID: 25MCC20042

Branch: MCA  (CCD)			

Section/Group: 25MCC-101A

Semester: 2			

Date of Performance: 27 JAN 2026

Subject Name: Technical training 

Subject Code: 25CAP-652
 
1.	AIM: 

implement conditional decision-making logic in PostgreSQL using IF–ELSE constructs and CASE expressions for classification, validation, and rule-based data processing.

2.	OBJECTIVES:

•	To understand conditional execution in SQL

•	To implement decision-making logic using CASE expressions

•	To simulate real-world rule validation scenarios

•	To classify data based on multiple conditions

•	To strengthen SQL logic skills required in interviews and backend systems

3.	SOFTWARE REQUIREMENTS

To perform this experiment, the following software is required:

1.	Operating System

o	Windows 10 / 11, Linux, or macOS

2.	Database Management System (DBMS)

o	PostgreSQL (version 12 or higher)

3.	SQL Client / Interface

o	pgAdmin 4 (for PostgreSQL)

OR

o	Command Line Interface (psql) 

4.	PROCEDURE FOR EXPERIMENT

Step 1: Database and Table Preparation

CREATE TABLE violation_schema (

    schema_id INT PRIMARY KEY,
    
    schema_name VARCHAR(20),
    
    violation_count INT

);


INSERT INTO violation_schema (schema_id, schema_name, violation_count) VALUES

(1, 'Customer_Schema', 0),

(2, 'Security_Schema', 2),

(3, 'Product_Schema', 5),

(4, 'Project_Schema', 1),

(5, 'Operation_Schema', 0);

Output:

<img width="394" height="164" alt="image" src="https://github.com/user-attachments/assets/700695aa-f462-46c9-aa11-43d8f92e109b" />

Step 2: Classification of data using case

SELECT

    schema_name,
    
    violation_count,
    
    CASE
    
        WHEN violation_count = 0 THEN 'No Violation'
        
        WHEN violation_count BETWEEN 1 AND 2 THEN 'Minor Violation'
        
        ELSE 'Critical Violation'
    
    END AS violation_Status

FROM violation_schema;

Output:

<img width="563" height="225" alt="image" src="https://github.com/user-attachments/assets/eb7b8249-3074-4f3e-b11e-bc434b6d1057" />

Step 3: Applying CASE Logic in Data Updates


-- Add new status column

ALTER TABLE violation_schema

ADD COLUMN status VARCHAR(30);



-- Update violation status

UPDATE violation_schema

SET status =

    CASE
    
        WHEN violation_count = 0 THEN 'Approved'
        
        WHEN violation_count BETWEEN 1 AND 2 THEN 'Needs Review'
        
        ELSE 'Rejected'
    
    END;

Output:

<img width="547" height="169" alt="image" src="https://github.com/user-attachments/assets/263a0843-d4a6-47b2-8769-1a105a6288a6" />

Step 4: Implementing IF–ELSE Logic Using PL/pgSQL

DO $$

DECLARE

    violation_count INT := 5;

BEGIN

    IF violation_count = 0 THEN

        RAISE NOTICE 'Approved';

    ELSIF violation_count BETWEEN 1 AND 2 THEN
    
        RAISE NOTICE 'Needs Review';
    
    ELSE
    
        RAISE NOTICE 'Rejected';
    
    END IF;

END $$;

Output:

 <img width="507" height="147" alt="image" src="https://github.com/user-attachments/assets/1cf02e5a-0e8b-4a9e-af44-6c4798f417ad" />

Step 5: Real-World Grading System (Classification Scenario)

CREATE TABLE StudentGrades (

    uid INT PRIMARY KEY,
    
    student_name VARCHAR(50),
    
    marks INT

);

INSERT INTO StudentGrades (uid, student_name, marks) VALUES

(1, 'Hanna', 85),

(2, 'Jatin', 32),

(3, 'Gourish', 68),

(4, 'Vansh', 71),

(5, 'Akash', 56);


Output:

 <img width="530" height="247" alt="image" src="https://github.com/user-attachments/assets/77f1f808-f25a-4a6c-a4f4-f471a2579d32" />

Step 5.1: Classify Students Using Conditional Logic

SELECT 

    student_name,
    
    marks,
    
    CASE
    
        WHEN marks >= 90 THEN 'A+ Grade'
        
        WHEN marks BETWEEN 80 AND 89 THEN 'A Grade'
        
        WHEN marks BETWEEN 70 AND 79 THEN 'B Grade'
        
        WHEN marks BETWEEN 60 AND 69 THEN 'C Grade'
        
        WHEN marks BETWEEN 40 AND 59 THEN 'D Grade'
        
        ELSE 'Fail'
    
    END AS Grade

FROM StudentGrades; 

Output:

 <img width="499" height="249" alt="image" src="https://github.com/user-attachments/assets/bcffa6e0-5d77-4500-88f0-6133e514de5c" />

Step 6: Using CASE for Custom Sorting

SELECT 

    schema_name,
    
    violation_count,
    
    CASE
    
        WHEN violation_count > 5 THEN 'Critical Violation'
        
        WHEN violation_count BETWEEN 3 AND 4 THEN 'Moderate Violation'
        
        WHEN violation_count BETWEEN 1 AND 2 THEN 'Minor Violation'
        
        ELSE 'No Violation'
    
    END AS violation_status

FROM violation_schema

ORDER BY

    CASE
    
        WHEN violation_count > 5 THEN 1
        
        WHEN violation_count BETWEEN 3 AND 4 THEN 2
        
        WHEN violation_count BETWEEN 1 AND 2 THEN 3
        
        ELSE 4
    
    END;

Output:

<img width="461" height="181" alt="image" src="https://github.com/user-attachments/assets/bc664371-4cf0-4f4f-a53c-3a5e1dda1dc3" />

Learning Outcome

This experiment demonstrates how conditional logic is implemented in PostgreSQL using CASE expressions and IF–ELSE constructs.

Students gain strong command over rule-based SQL logic, which is essential for:

•	Backend systems

•	Analytics

•	Compliance reporting

•	Placement and technical interviews

