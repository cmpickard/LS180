-- Make sure you are connected to the encyclopedia database. Add a column to the animals table 
-- called class to hold strings of up to 100 characters.
-- Update all the rows in the table so that this column holds the value Aves.
ALTER TABLE animals
ADD COLUMN class varchar(100);
UPDATE animals SET class = 'Aves';

-- Add two more columns to the animals table called phylum and kingdom. Both should hold strings of up to 100 characters.
ALTER TABLE animals
ADD COLUMN phylum varchar(100);

AlTER TABLE animals
ADD COLUMN kingdom varchar(100);

-- Update all the rows in the table so that phylum holds the value Chordata and kingdom holds Animalia for all the rows in the table.

UPDATE animals SET phylum = 'Chordata', kingdom = 'Animalia';

-- Add a column to the countries table called continent to hold strings of up to 50 characters.
ALTER TABLE countries
ADD COLUMN continent varchar(50);

-- Update all the rows in the table so France and Germany have a value of Europe for this column, Japan has a value of Asia and the USA has a value of North America.
UPDATE countries SET continent = 'Europe' WHERE name = 'France' OR name = 'Germany';
UPDATE countries SET continent = 'North America' WHERE name = 'USA';
UPDATE countries SET continent = 'Asia' WHERE name = 'Japan';

-- In the celebrities table, update the Elvis row so that the value in the deceased column is true. 
-- Then change the column so that it no longer allows NULL values.
UPDATE celebrities SET deceased = true WHERE first_name = 'Elvis';

ALTER TABLE celebrities
ALTER COLUMN deceased
SET NOT NULL;

-- Remove Tom Cruise from the celebrities table.
DELETE FROM celebrities WHERE first_name = 'Tom';

-- Change the name of the celebrities table to singers, and remove anyone who isn't a singer.
ALTER TABLE celebrities
RENAME TO singers;
DELETE FROM singers WHERE occupation NOT LIKE '%Singer%';

-- Remove all the rows from the countries table.
DELETE FROM countries;

-- Connect to the ls_burger database. Change the drink on James Bergman's order from a Cola to a Lemonade.
UPDATE orders SET drink = 'Lemonade' WHERE id = 3;

-- Add Fries to Aaron Muller's order. Make sure to add the cost ($0.99) to the appropriate field and add 3 loyalty points to the current total.
UPDATE orders SET side = 'Fries', side_cost = 0.99, customer_loyalty_points = 13 WHERE id = 4;

-- The cost of Fries has increased to $1.20. Update the data in the table to reflect this.
UPDATE orders SET side_cost = 1.2 WHERE side = 'Fries';