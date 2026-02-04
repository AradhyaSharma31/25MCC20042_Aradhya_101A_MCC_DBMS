WORKSHEET 4

Student Name: Aradhya Sharma			           

UID: 25MCC20042

Branch: MCA (Cloud Computing & Devops)		

Section/Group: 25MCC-101A

Semester: 2	

Date of Performance: 03/02/2026

Subject Name: Technical Training 1    

Subject Code: 25CAP-652


AIM: To understand and implement iterative control structures in PostgreSQL conceptually, including FOR loops, WHILE loops, and basic LOOP constructs, for repeated execution of database logic.

S/W Requirement:

To perform this experiment, the following software is required:

1.	Operating System

o	Windows 10 / 11, Linux, or macOS

2.	Database Management System (DBMS)

o	PostgreSQL (version 12 or higher)

3.	SQL Client / Interface

o	pgAdmin 4 (for PostgreSQL)

OR

o	Command Line Interface (psql) 

OBJECTIVES:

•	To understand why iteration is required in database programming

•	To learn the purpose and behavior of FOR, WHILE, and LOOP constructs

•	To understand how repeated data processing is handled in databases

•	To relate loop concepts to real-world batch processing scenarios

•	To strengthen conceptual knowledge of procedural SQL used in enterprise systems





Practical / Experiment Steps

• Iterative control structures in PL/pgSQL to understand repeated execution of logic.

• A simple FOR loop was executed to observe fixed-count iteration behavior.

• A FOR loop with a SELECT query was used to process records row by row.

• A WHILE loop was implemented to demonstrate condition-based iteration.

• A basic LOOP with EXIT WHEN was executed to control manual termination.

• Employee salary records were updated iteratively using a FOR loop.

• Conditional logic was applied inside loops using IF–ELSE statements.

• Outputs were verified using RAISE NOTICE statements.

Procedure for experiment

Example 1: FOR Loop – Simple Iteration

•	The loop runs a fixed number of times

•	Each iteration represents one execution cycle

•	Useful for understanding basic loop behavior

Application: Counters, repeated tasks, batch execution

Query:

DO $$

BEGIN

    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Iteration Number: %', i;
    
    END LOOP;

END $$;

Output:

 <img width="412" height="128" alt="Screenshot 2026-02-04 182402" src="https://github.com/user-attachments/assets/04c7d777-c30b-4981-b98e-26c6269aa26d" />

Example 2: FOR Loop with Query (Row-by-Row Processing)

•	The loop processes database records one at a time

•	Each iteration handles a single row

•	Simulates cursor-based processing

Application: Employee reports, audits, data verification



For table – violation_schema



 <img width="550" height="168" alt="Screenshot 2026-02-04 182501" src="https://github.com/user-attachments/assets/b38535c7-739a-4900-a9f9-f884fd961a0d" />



Query:

DO $$

DECLARE

    rec RECORD;

BEGIN
    
    FOR rec IN SELECT schema_name, violation_count FROM violation_schema LOOP
    
        RAISE NOTICE 'Entity: %, Violations: %',
        
                     rec.schema_name, rec.violation_count;
    
    END LOOP;

END $$;

Output:

<img width="407" height="126" alt="Screenshot 2026-02-04 182617" src="https://github.com/user-attachments/assets/c292302f-764d-4c00-abe1-d7df924b94ac" />
 
Example 3: WHILE Loop – Conditional Iteration

•	The loop runs until a condition becomes false

•	Execution depends entirely on the condition

•	The condition is checked before every iteration

Application: Retry mechanisms, validation loops


Query:

DO $$

DECLARE

    counter INT := 1;

BEGIN

    WHILE counter <= 5 LOOP
    
        RAISE NOTICE 'Counter Value: %', counter;
        
        counter := counter + 1;

    END LOOP;

END $$;

Output:

 <img width="294" height="166" alt="image" src="https://github.com/user-attachments/assets/006b73f3-3952-437d-afd0-b0fa74fdd7d4" />

Example 4: LOOP with EXIT WHEN

•	The loop does not stop automatically

•	An explicit exit condition controls termination

•	Gives flexibility in complex logic

Application: Workflow engines, complex decision cycles



Query:


DO $$

DECLARE

    counter INT := 1;

BEGIN

    LOOP
    
        RAISE NOTICE 'Loop Count: %', counter;
        
        counter := counter + 1;
        
        EXIT WHEN counter > 5;
    
    END LOOP;

END $$;

Output:

<img width="307" height="184" alt="image" src="https://github.com/user-attachments/assets/1830f5e5-bb5f-4828-bd50-ffd74a8277f9" />
 
Example 5: Salary Increment Using FOR Loop

•	Employee records are processed one by one

•	Salary values are updated iteratively

•	Represents real-world payroll processing

Application: Payroll systems, bulk updates

For table employee

<img width="1039" height="94" alt="Screenshot 2026-02-04 182858" src="https://github.com/user-attachments/assets/b654a70e-763c-4456-b548-be58263f28c7" />
 
Query:

DO $$

DECLARE

    rec RECORD;

BEGIN

    FOR rec IN SELECT id, salary FROM employee LOOP
    
        UPDATE employee
        
        SET salary = salary + 1000
        
        WHERE id = rec.id;
    
    END LOOP;

END $$;

Output:
 
<img width="359" height="68" alt="Screenshot 2026-02-04 183215" src="https://github.com/user-attachments/assets/025f9343-5f92-403c-b5e8-14130046a7a7" />

<img width="1039" height="90" alt="Screenshot 2026-02-04 183246" src="https://github.com/user-attachments/assets/f0ff6747-b6ce-4599-8a2b-c09f74e75900" />

Example 6: Combining LOOP with IF Condition

•	Loop processes each record

•	Conditional logic classifies data during iteration

•	Demonstrates decision-making inside loops

Application: Employee grading, alerts, categorization logic

For table studentgrades


 <img width="355" height="168" alt="image" src="https://github.com/user-attachments/assets/72a2cedf-0927-43a2-b1c4-e5daf0a4603e" />

Query:

DO $$

DECLARE

    rec RECORD;

BEGIN

    FOR rec IN SELECT student_name, marks FROM studentgrades LOOP
    
        IF rec.marks >= 75 THEN
        
            RAISE NOTICE '% : Distinction', rec.student_name;
        
        ELSE
      
            RAISE NOTICE '% : Needs Improvement', rec.student_name;
        
        END IF;
    
    END LOOP;

END $$;

Output:
 
<img width="326" height="126" alt="Screenshot 2026-02-04 183406" src="https://github.com/user-attachments/assets/69dc0d68-2625-42b7-95af-9773906c2c03" />

Learning Outcomes

•	Understand the importance of iteration in database programming and procedural SQL.

•	Differentiate between FOR, WHILE, and LOOP constructs in PostgreSQL.

•	Implement fixed and conditional iterations using PL/pgSQL blocks.

•	Perform row-by-row processing of database records using loop structures.

•	Apply conditional logic (IF–ELSE) within loops for data classification.

•	Relate loop constructs to real-world applications such as payroll processing, reporting, and batch updates.


