-- Update the orders table so that referential integrity will be preserved for the 
-- data between orders and products.
ALTER TABLE orders
  ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);

-- Use psql to insert the data shown in the following table into the database:

-- Quantity	Product
-- 10	small bolt
-- 25	small bolt
-- 15	large bolt

INSERT INTO products (name)
  VALUES ('small bolt'), ('large bolt');

INSERT INTO orders (quantity, product_id)
  VALUES (10, 1), (25, 1), (15, 2);

-- Write a SQL statement that returns a result like this:

--  quantity |    name
-- ----------+------------
--        10 | small bolt
--        25 | small bolt
--        15 | large bolt
-- (3 rows)

SELECT orders.quantity, products.name FROM orders
  JOIN products
  ON orders.product_id = products.id;

-- Can you insert a row into orders without a product_id? Write a SQL statement to
--  prove your answer.

-- ANS: YES.

INSERT INTO orders (quantity)
  VALUES (10);

-- Write a SQL statement that will prevent NULL values from being stored in 
-- orders.product_id. What happens if you execute that statement?

ALTER TABLE orders
  ALTER COLUMN product_id SET NOT NULL;

-- ANS: This will throw an error b/c there are already null values in the product_id column


-- Make any changes needed to avoid the error message encountered in #6.
DELETE FROM orders
  WHERE product_id IS NULL;

-- Create a new table called reviews to store the data shown below. This table 
-- should include a primary key and a reference to the products table.

-- Product	Review
-- small bolt	a little small
-- small bolt	very round!
-- large bolt	could have been smaller

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  review text,
  product_id integer NOT NULL,
  FOREIGN KEY(product_id) REFERENCES products(id)
);

-- Write SQL statements to insert the data shown in the table in #8.
INSERT INTO reviews (review, product_id)
  VALUES ('a little small', 1), ('very round!', 1), ('could have been smaller', 2);

-- True or false: A foreign key constraint prevents NULL values from being stored 
-- in a column.
-- ANS: False. The default is to allow NULLs in a foreign key column until a
-- NOT NULL constraint is set