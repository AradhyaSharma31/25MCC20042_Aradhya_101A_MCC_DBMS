# Experiment 10 — Transaction Control Language (TCL) in PostgreSQL

> **Subject:** Technical Training - I &nbsp;|&nbsp; **Code:** 25CAP-652  
> **Student:** Aradhya Sharma &nbsp;|&nbsp; **UID:** 25MCC20042  
> **Branch:** MCA (Cloud Computing & DevOps) &nbsp;|&nbsp; **Section:** MCC-101 A  
> **Semester:** 2 &nbsp;|&nbsp; **Date:** 21-04-2026

---

## Aim

To implement **Transaction Control Language (TCL)** commands in PostgreSQL using `COMMIT`, `ROLLBACK`, and `SAVEPOINT` for maintaining data consistency and controlling transactions.

---

## Tools Used

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

---

##  Objectives

| # | Objective | Description |
|---|-----------|-------------|
| 1 | **Transaction Management** | Understand the use of TCL commands in PostgreSQL |
| 2 | **Rollback Operations** | Revert unwanted changes using `ROLLBACK` |
| 3 | **Savepoint Usage** | Create checkpoints within transactions using `SAVEPOINT` |
| 4 | **Data Integrity** | Maintain consistency during multiple database operations |

---

##  Theory

**Transaction Control Language (TCL)** commands manage transactions in a database. A **transaction** is a sequence of SQL operations performed as a single logical unit.

PostgreSQL supports the following TCL commands:

```
COMMIT     →  Saves all changes made in the current transaction
ROLLBACK   →  Reverts changes made since the last COMMIT or SAVEPOINT
SAVEPOINT  →  Creates a checkpoint within a transaction for partial rollback
```

### Transaction Lifecycle

```
BEGIN
  │
  ├─── SQL Operation 1
  ├─── SAVEPOINT sp1          ← checkpoint
  ├─── SQL Operation 2
  │
  ├─── [Error?] ──→ ROLLBACK TO sp1   ← undo back to checkpoint
  │                       or
  └─── [OK?]    ──→ COMMIT            ← persist all changes
```

> TCL ensures **reliability**, **consistency**, and **recovery** in case of errors — core principles of the ACID model.

---

##  Experiment Steps

### Step 1 — Create Table

```sql
CREATE TABLE Payroll (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary   DECIMAL(10, 2) CHECK(salary > 0)
);
```

---

### Step 2 — Insert Sample Data

```sql
INSERT INTO Payroll VALUES
    (1, 'Amit', 30000),
    (2, 'Neha', 40000),
    (3, 'Ravi', 50000);

SELECT * FROM Payroll;
```

**Expected Output:**

| emp_id | emp_name | salary   |
|--------|----------|----------|
| 1      | Amit     | 30000.00 |
| 2      | Neha     | 40000.00 |
| 3      | Ravi     | 50000.00 |

---

### Step 3 — Using ROLLBACK

```sql
-- Attempt an invalid update
BEGIN;
UPDATE Payroll SET salary = -1000 WHERE emp_id = 3;
ROLLBACK;   -- ← reverts the negative salary update

-- Apply a valid update
UPDATE Payroll SET salary = 1000 WHERE emp_id = 3;
SELECT * FROM Payroll;
```

>  **Explanation:** The first `UPDATE` tries to set a negative salary (violating the `CHECK` constraint). `ROLLBACK` discards it. The valid update then runs successfully.

---

### Step 4 — Using SAVEPOINT

```sql
BEGIN;

-- Raise Amit's salary
UPDATE Payroll SET salary = salary + 5000 WHERE emp_id = 1;

SAVEPOINT sp1;   -- ← create checkpoint after Amit's raise

-- Raise Neha's salary
UPDATE Payroll SET salary = salary + 7000 WHERE emp_id = 2;

-- Attempt invalid update for Ravi
UPDATE Payroll SET salary = -1000 WHERE emp_id = 3;

-- Roll back only to sp1 (undoes Neha & Ravi changes, keeps Amit's)
ROLLBACK TO sp1;

SELECT * FROM Payroll;
COMMIT;
```

>  **Explanation:** `SAVEPOINT sp1` creates a checkpoint. When `ROLLBACK TO sp1` is issued, only the operations *after* `sp1` are undone — Amit's raise is preserved.

**Expected Output after ROLLBACK TO sp1:**

| emp_id | emp_name | salary   |
|--------|----------|----------|
| 1      | Amit     | 35000.00 |
| 2      | Neha     | 40000.00 |
| 3      | Ravi     | 50000.00 |

---

## Outcomes

Upon completing this experiment, students will be able to:

- [x] Use TCL commands (`COMMIT`, `ROLLBACK`, `SAVEPOINT`) in PostgreSQL
- [x] Understand transaction rollback mechanisms
- [x] Use `SAVEPOINT` for **partial rollback** within a transaction
- [x] Maintain **data consistency** during multiple database operations

---
