-- 1
-- Write a SQL query to list all product names and the total quantity
-- ordered for each. Include products with no orders and show their quantity as 0.
SELECT p.prod_name, COALESCE(SUM(o.qty), 0) AS total_qty_ordered
FROM Tbl_Products p
LEFT JOIN Tbl_Orders o ON p.prod_id = o.prod_id
GROUP BY p.prod_name;
