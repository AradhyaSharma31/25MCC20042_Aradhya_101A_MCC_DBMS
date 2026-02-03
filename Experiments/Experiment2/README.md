Experiment 2

Student Name: Aradhya Sharma 		

UID: 25MCC20042

Branch: MCA  (CCD)				

Section/Group: 25MCC-101A

Semester: 2					

Date of Performance: 21 jan 2026

Subject Name: Technical training 		

Subject Code: 25CAP-652


Implementation of SELECT Queries with Filtering, Grouping, and Sorting in PostgreSQL
________________________________________

1.	AIM:

To implement and analyze SQL SELECT queries using filtering, sorting, grouping, and aggregation concepts in PostgreSQL for efficient data retrieval and analytical reporting.
________________________________________

2.	OBJECTIVES:


•	To retrieve specific data using filtering conditions

•	To sort query results using single and multiple attributes

•	To perform aggregation using grouping techniques

•	To apply conditions on aggregated data

3.	SOFTWARE REQUIREMENTS:

To perform this experiment, the following software is required:


1.	Operating System

o	Windows 10 / 11, Linux, or macOS

2.	Database Management System (DBMS)

o	PostgreSQL (version 12 or higher)

3.	SQL Client / Interface

o	pgAdmin 4 (for PostgreSQL)

OR

o	Command Line Interface (psql) 


4.	PRACTICAL/ EXPERIMENT STEPS:

•	Create a sample table representing customer orders

•	Insert realistic records into the table

•	Retrieve filtered data using WHERE clause

•	Sort query results using ORDER BY

•	Group records and apply aggregate functions

•	Apply conditions on grouped data using HAVING

•	Analyze execution order WHERE and HAVING clauses

5.	PROCEDURE OF EXPERIMENT:

STEP 1: Database and Table Preparation

create table customer_orders(

id serial primary key,

customer_name varchar(20),

product varchar(20),

quantity int,

price numeric(10,2),

order_date date

);

<img width="624" height="188" alt="image" src="https://github.com/user-attachments/assets/957f7cf4-b2bf-461d-ae9f-fe3f47079c40" />
 
Created a realistic dataset with 10 records suitable for analytical queries.
________________________________________

STEP 2: Filtering Data Using Conditions

select id, customer_name, product, quantity, price

from customer_orders

where price > 30000;

 <img width="620" height="118" alt="image" src="https://github.com/user-attachments/assets/0ad4d97a-a858-4b30-bc24-12c71c134ca4" />

________________________________________

STEP 3: Sorting Query Results

-- Sorting Query Results (Ascending Order)

select id, customer_name, product, quantity, price

from customer_orders

where price > 30000

order by price;
 
<img width="612" height="108" alt="image" src="https://github.com/user-attachments/assets/395f8750-5862-47db-8896-dc1e68779915" />

-- Sorting Query Results (Decending Order)

select id, customer_name, product, quantity, price

from customer_orders

where price > 30000

order by price desc;

<img width="616" height="119" alt="image" src="https://github.com/user-attachments/assets/e66c8d94-a819-497d-838f-e38cacb5d371" />

________________________________________

STEP 4: Grouping Data for Aggregation

select product, count(*) as total_sales

from customer_orders

group by product;

<img width="280" height="188" alt="image" src="https://github.com/user-attachments/assets/484c380f-e07d-4f9c-bf85-30b3156a489e" />

________________________________________

STEP 5: Applying Conditions on Aggregated Data

select product, sum(quantity * price) as total_revenue

from customer_orders

group by product

having sum(quantity * price) > 60000;

<img width="294" height="65" alt="image" src="https://github.com/user-attachments/assets/139eaec7-8441-473e-a6c6-4b251c1bb129" />

________________________________________

STEP 6: Conceptual Understanding – Filtering VS Aggregation

select product, sum(quantity * price) as total_revenue

from customer_orders

where order_date >= '2026-01-01'

group by product

having sum(quantity * price) > 60000;

<img width="294" height="65" alt="image" src="https://github.com/user-attachments/assets/dd055279-6a03-4dc2-ab7a-7f8f75265f8e" />

________________________________________

6.	LEARNING OUTCOMES

•	Filtering Skills: Learned to retrieve relevant records using the WHERE clause with various conditions.

•	Sorting Techniques: Understood ordering results using ORDER BY with single and multiple columns.

•	Grouping & Aggregation: Gained proficiency in summarizing data using GROUP BY with aggregate functions such as SUM, AVG, and COUNT.

•	Conditional Aggregation: Clearly differentiated between WHERE (row-level filtering) and HAVING (group-level filtering).

•	Real-World Application: Built confidence in writing analytical SQL queries used in dashboards and business reports.

•	Interview Readiness: Prepared for SQL placement questions on filtering, grouping, aggregation, and analytical functions.
