-- Write a SQL statement that will create the following table, people:

-- name	age	occupation
-- Abby	34	biologist
-- Mu'nisah	26	NULL
-- Mirabelle	40	contractor

CREATE TABLE people (
  name varchar(25),
  age integer,
  occupation varchar(50)
);

-- Write SQL statements to insert the data shown in #1 into the table.
INSERT INTO people
VALUES ('Abby', 34, biologist), ('Mu''nisah', 26, NULL), ('Mirabelle', 40, 'contractor');

-- Write 3 SQL queries that can be used to retrieve the second row of the table 
-- shown in #1 and #2.
SELECT * FROM people
  WHERE name = 'Mu''nisah';

SELECT * FROM people
  WHERE age = 26;

SELECT * FROM people
  WHERE occupation IS NULL;


-- Write a SQL statement that will create a table named birds that can hold the 
-- following values:

-- name	length	wingspan	family	extinct
-- Spotted Towhee	21.6	26.7	Emberizidae	f
-- American Robin	25.5	36.0	Turdidae	f
-- Greater Koa Finch	19.0	24.0	Fringillidae	t
-- Carolina Parakeet	33.0	55.8	Psittacidae	t
-- Common Kestrel	35.5	73.5	Falconidae	f

CREATE TABLE birds (
  name varchar(50),
  length decimal(3,1),
  wingspan decimal(3,1),
  family varchar(50),
  extinct boolean
);

-- Using the table created in #4, write the SQL statements to insert the data as
-- shown in the listing.

INSERT INTO birds
VALUES ('Spotted Towhee', 21.6, 26,7, 'Emberizidae', f),
('American Robin', 25.5, 36.0, 'Turdidae', f),
('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', t),
('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', t),
('Common Kestrel', 35.5, 73.5, 'Falconidae', f);

-- Write a SQL statement that finds the names and families for all birds that are 
-- not extinct, in order from longest to shortest (based on the length column's value).

SELECT name, family FROM birds
WHERE extinct = f 
ORDER BY length DESC;

-- Use SQL to determine the average, minimum, and maximum wingspan for the birds 
-- shown in the table.

SELECT avg(wingspan), min(wingspan), max(wingspan) FROM birds;

-- Write a SQL statement to create the table shown below, menu_items:

-- item	prep_time	ingredient_cost	sales	menu_price
-- omelette	10	1.50	182	7.99
-- tacos	5	2.00	254	8.99
-- oatmeal	1	0.50	79	5.99

CREATE TABLE menu_items (
  item varchar(20),
  prep_time int,
  ingredient_cost decimal(4,2),
  sales int,
  menu_price decimal(4,2)
);

-- Write SQL statements to insert the data shown in #8 into the table.

INSERT INTO menu_items
VALUES ('omelette', 10, 1.5, 182, 7.99),
('tacos', 5, 2.0, 254, 8.99),
('oatmeal', 1, .5, 79, 5.99);

-- Using the table and data from #8 and #9, write a SQL query to determine which
--  menu item is the most profitable based on the cost of its ingredients, 
--  returning the name of the item and its profit.
SELECT item (menu_price - ingredient_cost) AS profit FROM menu_items
ORDER BY profit DESC
LIMIT 1;


-- Write a SQL query to determine how profitable each item on the menu is based on 
-- the amount of time it takes to prepare one item. Assume that whoever is 
-- preparing the food is being paid $13 an hour. List the most profitable items 
-- first. Keep in mind that prep_time is represented in minutes and ingredient_cost
--  and menu_price are both in dollars and cents:

cost_to_prep = prep_time * (13 / 60)
total_cost = ingredient_cost + cost_to_prep
profit = menu_price - total_cost
profit = menu_price - (ingredient_cost + prep_time * (13 / 60))

SELECT item, menu_price - (ingredient_cost + prep_time * (13.0 / 60.0)) AS profit FROM menu_items
  ORDER BY profit DESC;