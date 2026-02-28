CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name TEXT,
    salary NUMERIC,
    experience INT,
    performance_rating INT
);

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

select * from employee;