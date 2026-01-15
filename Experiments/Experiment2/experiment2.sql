CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    percentage DECIMAL(5,2)
);

INSERT INTO Students VALUES
(1, 'Amit', 'Delhi', 96.5),
(2, 'Riya', 'Mumbai', 94.2),
(3, 'Rahul', 'Delhi', 97.8),
(4, 'Sneha', 'Mumbai', 98.1),
(5, 'Ankit', 'Chandigarh', 95.6),
(6, 'Pooja', 'Delhi', 93.4),
(7, 'Karan', 'Chandigarh', 96.2);

-- Count students with percentage more than 95 without case statement

SELECT city, COUNT(*) AS count_students FROM Students
WHERE percentage > 95
GROUP BY city;

-- Count students with percentage more than 95 with case statement

SELECT city, SUM(CASE WHEN percentage > 95 THEN 1 ELSE 0 END) AS count_students FROM Students
WHERE percentage > 95
GROUP BY city;

-- Average of students with percentage more than 95 group by city in desc order without case statement

SELECT city, AVG(percentage) AS average_percentage FROM Students
WHERE percentage > 95
GROUP BY city
ORDER BY average_percentage DESC;

-- Average of students with percentage more than 95 group by city in desc order with case statement

SELECT city, AVG(CASE WHEN percentage > 95 THEN percentage END) AS average_percentage FROM Students
WHERE percentage > 95
GROUP BY city
ORDER BY average_percentage DESC;