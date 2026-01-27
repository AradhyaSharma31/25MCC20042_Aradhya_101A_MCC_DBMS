-- STEP 1: Create Table

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

SELECT * FROM violation_schema;

-- STEP 2: Classification of data using case

SELECT
    schema_name,
    violation_count,
    CASE
        WHEN violation_count = 0 THEN 'No Violation'
        WHEN violation_count BETWEEN 1 AND 2 THEN 'Minor Violation'
        ELSE 'Critical Violation'
    END AS violation_Status
FROM violation_schema;

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

-- STEP 4: Implement IF–ELSE Using PL/pgSQL

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


-- STEP 5: Real World Student Grading System

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

SELECT * FROM StudentGrades;

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

-- STEP 6: CASE-BASED Custom Sorting

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