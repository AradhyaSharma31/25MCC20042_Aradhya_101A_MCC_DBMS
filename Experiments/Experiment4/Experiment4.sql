DO $$
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Iteration Number: %', i;
    END LOOP;
END $$;

-- Display all records from Violations table
SELECT * FROM violation_schema;

DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT schema_name, violation_count FROM violation_schema LOOP
        RAISE NOTICE 'Entity: %, Violations: %',
                     rec.schema_name, rec.violation_count;
    END LOOP;
END $$;

DO $$
DECLARE
    counter INT := 1;
BEGIN
    WHILE counter <= 5 LOOP
        RAISE NOTICE 'Counter Value: %', counter;
        counter := counter + 1;
    END LOOP;
END $$;

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

-- Display updated employee records
SELECT * FROM employee;

-- Display all student records
SELECT * FROM studentgrades;

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