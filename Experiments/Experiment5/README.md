WORKSHEET 5

Student Name: Aradhya Sharma 		

UID: 25MCC20042

Branch: MCA  (CCD)			

Section/Group: 25MCC-101A

Semester: 2			

Date of Performance: 24 FEB 2026

Subject Name: Technical training 	

Subject Code: 25CAP-652
 
1. AIM

To gain hands-on experience in creating and using cursors for row-by-row processing in PostgreSQL, enabling sequential access and controlled manipulation of query results for implementing complex business logic.

________________________________________

2. OBJECTIVES

• To understand sequential data access using cursors

• To perform row-level manipulation using procedural logic

• To learn proper cursor lifecycle management

• To handle cursor termination and empty result sets

• To apply cursor-based logic to real-world business scenarios

________________________________________

3. SOFTWARE REQUIREMENTS

Operating System:

• Windows 10 / 11 / Linux / macOS

Database Management System:

• PostgreSQL (version 12 or higher)

SQL Interface:

• pgAdmin 4

OR

• PostgreSQL Command Line (psql)

________________________________________

4. PROCEDURE FOR EXPERIMENT



Step 1: Implementing a Simple Forward-Only Cursor

Objective:

To fetch employee records one by one using a cursor and display them sequentially.

```
CREATE TABLE employee (

    emp_id INT PRIMARY KEY,
    
    emp_name TEXT,
    
    salary NUMERIC,
    
    
    experience INT,
    
    performance_rating INT
    

);
```
```
INSERT INTO employee VALUES

(101, 'Amit',   42000, 6, 4),

(102, 'Priya',  36000, 3, 3),

(103, 'Rahul',  55000, 8, 5),

(104, 'Neha',   30000, 2, 2),

(105, 'Arjun',  48000, 5, 4),

(106, 'Rohit',  39000, 4, 3),

(107, 'Kiran',  46000, 7, 4),

(108, 'Sneha',  34000, 3, 3),

(109, 'Vikas',  51000, 9, 5),

(110, 'Pooja',  32000, 1, 2);
```

```
DO $$

DECLARE

    emp_cursor CURSOR FOR
    
        SELECT emp_id, emp_name, salary FROM employee;



    v_id INT;
    
    v_name TEXT;
    
    v_salary NUMERIC;

BEGIN

    OPEN emp_cursor;

    
    LOOP
    
        FETCH emp_cursor INTO v_id, v_name, v_salary;
        
        EXIT WHEN NOT FOUND;



        RAISE NOTICE 'ID: %, Name: %, Salary: %',
        
                     v_id, v_name, v_salary;

    END LOOP;

    
    CLOSE emp_cursor;
    

END $$;
```
Output:

 <img width="388" height="263" alt="image" src="https://github.com/user-attachments/assets/e7c586ae-dd55-4480-b642-bcaa3856f545" />

________________________________________

Step 2: Complex Row-by-Row Manipulation

Objective:

To update employee salaries using cursor-based conditional logic based on experience and performance.

Business Logic:

• Experience ≥ 5 and Performance ≥ 4 → 15% increment

• Otherwise → 5% increment
```
DO $$

DECLARE

    emp_cursor CURSOR FOR
    
        SELECT emp_id, salary, experience, performance_rating
        
        FROM employee
        
        FOR UPDATE;



    v_id INT;
    
    v_salary NUMERIC;
    
    v_exp INT;
    
    v_perf INT;
    

BEGIN

    OPEN emp_cursor;


    LOOP

        FETCH emp_cursor INTO v_id, v_salary, v_exp, v_perf;
        
        EXIT WHEN NOT FOUND;



        IF v_exp >= 5 AND v_perf >= 4 THEN
        
            UPDATE employee
            
            SET salary = salary * 1.15
            
            WHERE CURRENT OF emp_cursor;
        
        ELSE
        
            UPDATE employee
            
            SET salary = salary * 1.05
            
            WHERE CURRENT OF emp_cursor;
        
        END IF;
    
    END LOOP;



    CLOSE emp_cursor;

END $$;
```
Output:

<img width="344" height="91" alt="image" src="https://github.com/user-attachments/assets/c4bd92a9-fc83-43f6-bebb-791c0e2f3aa8" />
 
________________________________________

Step 3: Exception and Status Handling

Objective:

To handle empty result sets and ensure safe cursor termination.
```
DO $$

DECLARE

    emp_cursor CURSOR FOR
    
        SELECT emp_id FROM employee;
    
    v_id INT;
    
    row_count INT := 0;

BEGIN

    OPEN emp_cursor;
    
    LOOP
    
        FETCH emp_cursor INTO v_id;
        
        EXIT WHEN NOT FOUND;
        
        row_count := row_count + 1;
        
        RAISE NOTICE 'Employee ID: %', v_id;
    
    END LOOP;
    
    IF row_count = 0 THEN
    
        RAISE EXCEPTION 'No employee records found in the table.';

    END IF;
    
    CLOSE emp_cursor;

EXCEPTION

    WHEN OTHERS THEN
    
        CLOSE emp_cursor;
        
        RAISE NOTICE 'Exception handled safely: %', SQLERRM;

END $$;
```
Output:

<img width="320" height="262" alt="image" src="https://github.com/user-attachments/assets/01be64ec-16e0-4df5-af01-dc406f85473e" />
 
________________________________________

Result Verification

<img width="528" height="288" alt="image" src="https://github.com/user-attachments/assets/1cdede6b-cea8-4290-8e47-133006afd1fa" />
 
________________________________________
Learning Outcome

This experiment demonstrates effective use of cursors in PostgreSQL for sequential data access and row-by-row processing.

Students gain strong understanding of cursor lifecycle management and exception handling, which is essential for:

• Payroll systems

• Data migration tasks

• Backend application development
• Technical interviews and placements
