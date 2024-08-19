-- Connect to the encyclopedia database. Write a query to return all of the country
--  names along with their appropriate continent names.
SELECT cou.name, con.continent_name
  FROM countries cou
  JOIN continents con
  ON cou.continent_id = con.id;

-- Write a query to return all of the names and capitals of the European countries.
SELECT cou.name, cou.capital
  FROM countries cou
  JOIN continents con
  ON cou.continent_id = con.id
  WHERE con.continent_name = 'Europe';

-- Write a query to return the first name of any singer who had an album released under the Warner Bros label.
SELECT DISTINCT s.first_name
  FROM singers s
  JOIN albums a
  ON s.id = a.singer_id
  WHERE a.label = 'Warner Bros';

-- Write a query to return the first name and last name of any singer who released
--  an album in the 80s and who is still living, along with the names of the album
--   that was released and the release date. Order the results by the singer's age (youngest first).
SELECT s.first_name, s.last_name, a.album_name, a.released
  FROM singers s
  JOIN albums a
  ON s.id = a.singer_id
  WHERE a.released >= '1980-01-01' AND
    a.released <= '1989-12-31' AND
    s.deceased = false
  ORDER BY s.date_of_birth DESC;

-- Write a query to return the first name and last name of any singer without an associated album entry.
SELECT s.first_name, s.last_name
  FROM singers s
  LEFT JOIN albums a
  ON s.id = a.singer_id
  WHERE album_name IS NULL;

-- Rewrite the query for the last question as a sub-query.
SELECT first_name, last_name
  FROM singers
  WHERE id NOT IN (SELECT singer_id FROM albums);

-- Connect to the ls_burger database. Return a list of all orders and their associated product items.
SELECT p.product_name, o.id AS "Order Number"
  FROM orders o
  JOIN order_items 
    ON order_items.order_id = o.id
  JOIN products p
    ON order_items.product_id = p.id;

-- Return the id of any order that includes Fries. Use table aliasing in your query.
SELECT DISTINCT o.id AS "Order #"
  FROM orders o
  JOIN order_items
  ON order_items.order_id = o.id
  WHERE order_items.product_id = 5;

-- Build on the query from the previous question to return the name of any customer 
-- who ordered fries. Return this in a column called 'Customers who like Fries'.
--  Don't repeat the same customer name more than once in the results.
SELECT DISTINCT c.customer_name AS "Customers who like Fries"
  FROM customers c JOIN orders o
  ON c.id = o.customer_id
  JOIN order_items oi
  ON oi.order_id = o.id
  JOIN products p
  ON p.id = oi.product_id
  WHERE p.product_name = 'Fries';



-- Write a query to return the total cost of Natasha O'Shea's orders.
SELECT sum(p.product_cost)
  FROM products p JOIN order_items oi
  ON p.id = oi.product_id
  JOIN orders o
  ON o.id = oi.order_id
  JOIN customers c
  ON c.id = o.customer_id
  WHERE c.customer_name = 'Natasha O''Shea';




-- Write a query to return the name of every product included in an order alongside 
-- the number of times it has been ordered. Sort the results by product name, ascending.
SELECT p.product_name, count(p.id) AS "Number of times ordered"
  FROM orders o JOIN order_items oi ON oi.order_id = o.id
  JOIN products p ON oi.product_id = p.id
  GROUP BY p.product_name
  ORDER BY p.product_name ASC;