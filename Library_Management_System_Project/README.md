# Library Management System

**Project Report — Technical Training (25CAP-652)**

> **Submitted by:** Aradhya Sharma (25MCC20042), Jatin Tasoria (25MCC20054), Prateek Verma (25MCC20062)
>
> **Under the guidance of:** Mr. Shalabh Bhatiya, Assistant Professor
>
> **Program:** Master of Computer Application — Cloud Computing and DevOps
>
> **Institution:** Chandigarh University | **April 2026**

---

## Certificate

This is to certify that **Aradhya Sharma, Jatin Tasoria, and Prateek Verma**, students of Master of Computer Applications (MCA), have successfully completed the Mini Project titled **"Library Management System"** under the guidance of Mr. Shalabh Bhatiya, Chandigarh University.

This project was submitted in partial fulfilment of the MCA program requirements and demonstrates the ability to apply theoretical database concepts to practical problem-solving — featuring a **robust relational database application** integrating **SQL queries, data normalization, PL/pgSQL stored procedures, and automated triggers**.

---

## Acknowledgement

We sincerely thank **Chandigarh University** and the **University Institute of Computing (UIC)** for providing the opportunity to undertake this project. Special appreciation goes to our mentor, **Mr. Shalabh Bhatiya**, for invaluable guidance throughout the project.

---

## Table of Contents

1. [Abstract](#abstract)
2. [Problem Statement](#problem-statement)
3. [Introduction](#introduction)
4. [Aim of the Project](#aim-of-the-project)
5. [Technologies Used](#technologies-used)
6. [Implementation](#implementation)
7. [Results](#results)
8. [Output](#output)
9. [Future Development](#future-development)
10. [Conclusion](#conclusion)
11. [Learning Outcomes](#learning-outcomes)
12. [References](#references)

---

## Abstract

The "Library Management System" is a relational database project designed to demonstrate the principles of data modeling, normalization, and efficient data retrieval. Developed as part of the DBMS curriculum, this project leverages **PostgreSQL** to construct a robust and scalable backend infrastructure for managing library operations.

The core architecture consists of interconnected relational tables handling data for books, members, borrowing records, and fines. Data integrity is maintained via primary and foreign key constraints. The system automates routine tasks through **PL/pgSQL stored procedures and triggers** — such as automatically adjusting inventory counts upon checkout and calculating late penalties — bridging theoretical database concepts with practical scenarios.

---

## Problem Statement

Traditional, manual methods of managing library records rely on physical ledgers and paper-based tracking — inefficient, error-prone, and a significant risk for data loss. Manually searching for book availability, tracking overdue returns, and calculating fines scale poorly as a library grows.

This project implements a centralized **Relational Database Management System (RDBMS)** with structured SQL schemas, advanced window functions, and automated triggers to instantly process complex queries, eliminate data redundancy, and provide administrators with real-time, accurate inventory and member activity data.

---

## Introduction

The "Library Management System" transitions from conventional file-system data storage to a highly structured, automated database environment. By logically separating entities into specific tables — **users, books, loans, and fines** — the system ensures robust data normalization.

The database utilizes advanced SQL concepts including multi-table joins, subqueries, views, and aggregate functions. Most notably, the architecture employs **event-driven database triggers**, ensuring the system remains self-updating and maintains strict referential integrity without requiring manual administrative intervention for every transaction.

---

## Aim of the Project

### Primary Aim
To design and implement a robust Relational Database Management System for a library that demonstrates effective schema design, data normalization, complex SQL query execution, and database automation.

### Specific Objectives

| Objective | Description |
|-----------|-------------|
| **ER Modeling** | Design a normalized schema with primary and foreign keys linking users, books, loans, and fines |
| **Database Automation** | Develop PL/pgSQL triggers and stored procedures to automate inventory and fine calculation |
| **Complex Data Retrieval** | Utilize Window Functions (`RANK()`, running counts) and subqueries for borrowing insights |
| **Data Abstraction** | Create SQL Views (`active_loans`, `overdue_loans`) to simplify complex join operations |

---

## Technologies Used

### Database Management System
- **PostgreSQL** — Advanced open-source relational database engine for hosting schemas, tables, and executing complex queries. Chosen for its robust support for procedural languages and window functions.

### Query & Procedural Languages
- **SQL (Structured Query Language)** — Core language for DDL (schema definition), DML (data manipulation), and DQL (querying relationships).
- **PL/pgSQL** — PostgreSQL's procedural language for writing custom stored functions and event-driven triggers.

### Development & Interface Tools
- **pgAdmin / psql CLI** — Interfaces used to design database models, write and test SQL scripts, manage user roles, and export query results.

---

## Implementation

### 1. Schema Creation and Integrity (DDL)

The architecture relies on four core tables: `users`, `books`, `loans`, and `fines`. The `SERIAL PRIMARY KEY` constraint ensures auto-incrementing unique identifiers. Foreign keys (`REFERENCES`) in `loans` and `fines` establish strict referential relationships.

### 2. Data Population (DML)

The system was populated with mock data simulating a live library, including members and diverse book genres (Programming, Self-help, Fiction). The `CURRENT_DATE - INTERVAL` syntax was used to simulate realistic past issue dates for loan tracking.

### 3. Data Abstraction via Views

Logical Views were established to prevent repeated complex joins:
- `active_loans` — real-time view of currently checked-out books
- `overdue_loans` — auto-filters items where issue date exceeds a 7-day interval

### 4. Advanced Analytics & Window Functions

Window Functions were deployed for library usage analysis:
```sql
RANK() OVER (ORDER BY COUNT(*) DESC)
```
Used to dynamically rank books by popularity and track running loan counts over time.

### 5. Process Automation (Functions & Triggers)

- **Inventory Control:** `issue_book_trigger` and `return_book_trigger` are bound to the `loans` table. When loan status changes to `ISSUED` or `RETURNED`, the function automatically increments/decrements `available_copies` in `books`.
- **Fine Calculation:** `fine_trigger` activates on return. If return date exceeds the 7-day limit, a function calculates penalty (`days_overdue × 10`) and inserts a new record into `fines`.

---

## Results

The deployment yielded a highly structured, automated, and error-free database architecture.

The most significant achievement was the successful validation of **PL/pgSQL triggers**. During testing:
- An `INSERT` into `loans` correctly updated inventory in `books` in real-time, eliminating double-booking risk.
- The automated fine trigger executed perfectly upon changing loan status to `RETURNED`, accurately assessing penalties without administrative input.

Advanced querying via multi-table joins and Window Functions generated comprehensive reports on user borrowing habits, book rankings, and overdue items in milliseconds.

---

## Output

### Table Creation
<img width="586" height="185" alt="image" src="https://github.com/user-attachments/assets/26847c49-b236-4f80-8040-f1ce1e7e3365" />

<img width="586" height="243" alt="image" src="https://github.com/user-attachments/assets/a8f1d662-c364-495d-b512-f6f271d3c5a3" />

<img width="586" height="280" alt="image" src="https://github.com/user-attachments/assets/cb4e2d6c-e513-4eed-9380-8414dc870e3d" />

<img width="362" height="270" alt="image" src="https://github.com/user-attachments/assets/635e3bbe-a010-4fb2-9cd2-ff9389b552b2" />

### Joins
<img width="356" height="290" alt="image" src="https://github.com/user-attachments/assets/b26b18c1-bcc6-417f-8c4f-2c6fb6150205" />

<img width="264" height="288" alt="image" src="https://github.com/user-attachments/assets/c75673f1-d650-4859-ad58-31f0dae54af0" />

### Aggregate Functions
<img width="109" height="68" alt="image" src="https://github.com/user-attachments/assets/8fefd654-d535-416f-80c8-0c96602fad4a" />

<img width="250" height="141" alt="image" src="https://github.com/user-attachments/assets/a2600bf3-b5cf-4faf-ab1a-7eb08ad1d46c" />

<img width="149" height="68" alt="image" src="https://github.com/user-attachments/assets/adedd6d4-6ccf-43e0-9656-af8452adefc6" />

### Window Functions
<img width="265" height="274" alt="image" src="https://github.com/user-attachments/assets/3a96de80-9288-43b5-af1f-80d2311b42c5" />

<img width="219" height="269" alt="image" src="https://github.com/user-attachments/assets/2766c399-a306-4572-8420-0ae0eed99dbb" />

### Update Queries
<img width="586" height="186" alt="image" src="https://github.com/user-attachments/assets/63550902-e229-458c-8c8d-8f564630a129" />

<img width="586" height="259" alt="image" src="https://github.com/user-attachments/assets/b17509d7-bb96-4ae7-9b23-0fdfa671071e" />

### Delete Queries
<img width="586" height="258" alt="image" src="https://github.com/user-attachments/assets/7b017dda-e4d9-4764-9f8b-dd3f1894b3f7" />

### Views
<img width="507" height="165" alt="image" src="https://github.com/user-attachments/assets/1a6fc011-6058-4057-8d86-12dde3cbd29c" />

<img width="506" height="87" alt="image" src="https://github.com/user-attachments/assets/1fd71030-3dff-41da-a44c-c1814bac72d4" />

### Stored Procedures
<img width="559" height="287" alt="image" src="https://github.com/user-attachments/assets/20af4491-13f8-4949-b422-7ddbc8ecac98" />

<img width="559" height="283" alt="image" src="https://github.com/user-attachments/assets/ee55c0ac-7faf-443e-acb4-1ecd442796fa" />


### Triggers
<img width="586" height="184" alt="image" src="https://github.com/user-attachments/assets/3da7643d-2be4-4d66-99e4-c674043154cf" />

<img width="586" height="183" alt="image" src="https://github.com/user-attachments/assets/ac2a1da4-5df3-40f5-98b6-80fa10f740b9" />

<img width="383" height="315" alt="image" src="https://github.com/user-attachments/assets/9d2b78fc-1d95-45d9-894f-05e956795a31" />

### Advanced Queries
<img width="290" height="162" alt="image" src="https://github.com/user-attachments/assets/2449e91d-cc7f-49c7-b026-b709bc983638" />

<img width="300" height="264" alt="image" src="https://github.com/user-attachments/assets/5b3eb83c-aff2-4a71-8aaf-743ce5ed8038" />

<img width="437" height="88" alt="image" src="https://github.com/user-attachments/assets/bec3a26d-381c-4a9b-b53d-ddfa0fbbe30f" />

---

## Future Development

| Enhancement | Description |
|-------------|-------------|
| **Application Integration** | Connect the PostgreSQL backend to a frontend web app (Node.js or Python/Django) for a patron-facing GUI |
| **Advanced Notification Triggers** | Integrate with messaging queues to auto-email members on due dates via PostgreSQL's `NOTIFY` command |
| **Role-Based Access Control (RBAC)** | Implement strict user roles via DCL to grant Admin, Librarian, and read-only service permissions |
| **Cloud Database Migration** | Migrate to Azure Database for PostgreSQL or Amazon RDS for high availability and automated backups |

---

## Conclusion

The "Library Management System" successfully demonstrates the power of structured data management and relational database engineering. By migrating away from manual tracking, the project realized a highly efficient, automated ecosystem utilizing PostgreSQL.

Key achievements:
- Primary and foreign keys with normalized tables eliminated data redundancy and maintained consistency.
- PL/pgSQL triggers completely modernized inventory tracking and fine management, removing human error.
- The project provided practical exposure to advanced schema design, query optimization, window functions, and procedural logic.

---

## Learning Outcomes

| Competency | Description |
|------------|-------------|
| **Advanced Relational Design** | ER modeling translated into strictly normalized PostgreSQL schemas |
| **Database Automation** | PL/pgSQL stored procedures and event-driven triggers for self-sustaining actions |
| **Complex Data Retrieval** | Advanced SQL with subqueries and Window Functions (`RANK`, running totals) |
| **Data Abstraction** | Logical Views simplifying complex data for reporting and dashboards |
| **Referential Integrity** | Debugging foreign key constraint violations and optimizing trigger logic |

---

## References

- PostgreSQL Global Development Group. *PostgreSQL Official Documentation.* https://www.postgresql.org/docs/
- W3Schools. *SQL Tutorial.* https://www.w3schools.com/sql/
- Elmasri, R., & Navathe, S. B. (2015). *Fundamentals of Database Systems* (7th ed.). Pearson.

### GitHub Repository

**SQL scripts and project files:** [https://github.com/AradhyaSharma31/25MCC20042_Aradhya_101A_MCC_DBMS](https://github.com/AradhyaSharma31/25MCC20042_Aradhya_101A_MCC_DBMS)

---

*Submitted in partial fulfilment for the award of the degree of Master of Computer Application — Chandigarh University, April 2026.*
