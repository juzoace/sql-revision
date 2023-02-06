USE sql_store;

-- SELECT       
-- 	customer_id, 
-- 	last_name, 
--     first_name, 
--     points, 
--     (points + 10) * 100 AS 'discount factor'
-- FROM customers
-- WHERE customer_id = 1

-- SELECT state 
-- FROM customers

-- SELECT * FROM sql_store.customers
-- Dinstinct ensures there are no duplicates
SELECT DISTINCT state
FROM customers

-- SELECT 
-- 	customer_id, 
-- 	last_name, 
--     first_name, 
--     points, 
--     (points + 10) * 100 AS 'discount factor'
-- FROM customers

-- SELECT name, unit_price, (unit_price * 1.1) AS 'new price'
-- FROM products

-- SELECT * 
-- FROM Customers
-- WHERE birth_date >= '1973-09-04' OR first_name = 'Babara'
-- WHERE points > 3000 

-- SELECT *
-- FROM order_items 
-- WHERE order_id = 6 AND unit_price * quantity > 30

-- SELECT *
-- FROM customers
-- WHERE state IN ('VA', 'FL', 'GA')

-- MULTIPLE OR
-- SELECT *
-- FROM products
-- WHERE quantity_in_stock IN (49, 38, 72)

-- Between
-- SELECT *
-- FROM customers
-- WHERE points BETWEEN 1000 AND 3000

-- SELECT *
-- FROM customers
-- WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'

-- LIKE (Used for matching string characters)
-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'B%'

-- % means any number of characters
-- _ single character
-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'b____y'

-- SELECT *
-- FROM customers
-- WHERE address LIKE '%traits%' OR
--       address LIKE '%avenue%'

-- SELECT *
-- FROM customers
-- WHERE address LIKE '%trail'

-- Regular expressions
-- $
-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'field$'

-- Regular expressions
-- ^
-- SELECT *-- 
-- FROM customers
-- WHERE last_name REGEXP '^field'

-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'son$|field$|^Rose'

-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP '[gim]e'

-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'e[fmq]'

-- REGEXP Tasks in video
-- USING REGEXP
-- SELECT * 
-- FROM customers
-- WHERE first_name REGEXP '^ELKA|^AMBUR'

-- WITHOUT REGEXP
-- SELECT * 
-- FROM customers
-- WHERE first_name = 'elka' or first_name = 'ambur'

-- SELECT * 
-- FROM customers
-- WHERE last_name REGEXP 'EY$|ON$'

-- SELECT * 
-- FROM customers
-- WHERE last_name REGEXP '^MY|SE'

-- SELECT * 
-- FROM customers
-- WHERE last_name REGEXP 'B[RU]' 

-- IS NULL OPERATOR
-- SELECT * 
-- FROM customers
-- WHERE phone IS NULL

-- IS NULL OPERATOR
-- SELECT * 
-- FROM customers
-- WHERE phone IS NOT NULL

-- Exercise: Get the orders that are not shipped
-- IS NULL OPERATOR
-- SELECT * 
-- FROM orders
-- WHERE shipped_date IS NULL AND shipper_id IS NULL

-- SELECT order_id, first_name, shipped_date, last_name 
-- FROM orders
-- JOIN customers ON orders.customer_id = customers.customer_id

-- SELECT *, quantity * unit_price AS total_price
-- FROM order_items
-- WHERE order_id = 2
-- ORDER BY total_price DESC

-- Join orders and customers  data using a condition
-- SELECT order_id, o.customer_id, first_name, last_name
-- FROM orders o
-- JOIN customers c
-- ON o.customer_id = c.customer_id  

-- Join order items and products table (in the same database)
-- SELECT order_id, oi.product_id, quantity, oi.unit_price
-- FROM order_items oi
-- JOIN products p ON oi.product_id = p.product_id

-- Join order items and products table (in different databases referencing the sql_store and prefixing the sql_inventory)
-- SELECT order_id, oi.product_id, quantity, oi.unit_price
-- FROM order_items oi
-- JOIN sql_inventory.products p ON oi.product_id = p.product_id

-- Join order items and products table (in different databases referencing the the sql_inventory and prefixing the sql_store)
-- USE sql_inventory;
-- SELECT *
-- FROM sql_store.order_items oi
-- JOIN products p ON oi.product_id = p.product_id

-- USE sql_inventory;
-- SELECT name
-- FROM cities
-- ORDER BY name DESC

-- SELECT *
-- FROM orders O
-- JOIN customers c
-- ON o.customer_id = c.customer_id 
-- JOIN order_statuses os 
-- ON o.status = os.order_status_id

-- use sql_invoicing;
-- SELECT c.name, rfpayment_method
-- FROM payments p        
-- JOIN payment_methods pm 
-- ON p.payment_method = pm.payment_method_id
-- JOIN clients c 
-- ON p.client_id = c.client_id

-- SELECT o.order_id, c.first_name
-- FROM orders o
-- JOIN customers c
-- -- ON o.customer_id = c.customer_id
-- -- Making use of USING becomes
-- USING (customer_id) -- customer_id is present in both tables
-- JOIN shippers sh
-- USING (shipper_id) -- USING only works if the column name is the same across both tables you intend to join

-- SELECT *
-- FROM customers c
-- LEFT JOIN orders o
-- ON c.customer_id = o.customer_id
-- ORDER BY c.customer_id

-- SELECT o.order_id,
-- 		o.order_date,
--         c.first_name AS customer,  
--         sh.name AS shippper,
--         os.name AS status
-- FROM orders o
-- LEFT JOIN customers c
-- 	ON o.customer_id = c.customer_id
-- LEFT JOIN shippers sh  
-- ON o.shipper_id = sh.shipper_id
-- JOIN order_statuses os
-- ON o.status = os.order_status_id

-- SELECT * 
-- FROM products
-- WHERE name = 'samsung'

-- INSERT INTO customers (first_name, last_name, birth_date, phone, address, city, state, points)
-- VALUES('uzochukwu', 'nwigwe', '1994-12-05', +2348161812871, '84, olonode street, yaba', 'Lagos mainland', 'LG', 2650);
-- INSERT INTO customers (first_name, last_name, birth_date, phone, address, city, state, points)
-- VALUES('david', 'sam', '1990-04-09', '+2348161812879', '70 olonode street, yaba', 'Lagos mainland', 'LG', 2300),
-- 	  ('davidson', 'samuel', '1990-07-02', '+2348161812879', '75 olonode street, yaba', 'Lagos mainland', 'LG', 2351)

-- INSERT INTO products (name, quantity_in_stock, unit_price)
-- VALUES('samsung', 40, 59.99),
-- 	  ('Nokia', 60, 15.99),
-- 	  ('Iphone', 60, 50.99)
       
-- Insert data into multiple tables
-- INSERT INTO orders (customer_id, order_date, status)
-- VALUES (1, '2019-01-02', 1);

-- INSERT INTO order_items
-- VALUES(LAST_INSERT_ID(), 1, 1, 4.95),
-- 	  (LAST_INSERT_ID(), 2, 1, 3.95)

-- Copy table data and inserting it into newly created table
-- CREATE TABLE orders_archived AS 
-- SELECT * FROM orders
-- CREATE TABLE orders_archived  (PRIMARY KEY(`order_id`)) AS 
-- SELECT * FROM orders 
-- WHERE order_date < '2019-01-01'

-- ALTER TABLE `orders_archived`
--     CHANGE COLUMN `order_id` `order_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;

-- use sql_invoicing;
-- CREATE TABLE invoices_archived (PRIMARY KEY(`invoice_id`)) AS 
-- SELECT i.invoice_id, i.number, i.invoice_total, i.payment_total, i.invoice_date, i.due_date, i.payment_date, c.address AS client_address, c.city AS client_city, c.state AS client_state, c.phone AS client_phone, c.name AS 'client_name' 
-- FROM invoices i
-- JOIN clients c
-- ON i.client_id = c.client_id
-- WHERE payment_date IS NOT NULL

-- ALTER TABLE `invoices_archived`
--     CHANGE COLUMN `invoice_id` `invoice_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;

-- Update a single row 
-- USE sql_invoicing;

-- UPDATE invoices
-- SET payment_total = invoice_total * 0.5, payment_date = due_date
-- WHERE invoice_id = 3

-- Updating multiple rows in a table


-- Using subqueries in updates
-- USE sql_invoicing;

-- UPDATE invoices
-- SET 
-- payment_total = invoice_total * 0.5,
-- payment_date = due_date
-- WHERE client_id =
-- (SELECT client_id
-- FROM clients
-- WHERE name = 'Myworks')

-- Deleting data from table
-- DELETE FROM invoices 
-- WHERE invoice_id = (
-- -- for multiple ids replace = with IN
--  SELECT * 
--  FROM clients
--  WHERE name = 'Myworks'
--  )

-- Restoring databases

