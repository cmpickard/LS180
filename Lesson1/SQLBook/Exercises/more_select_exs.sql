-- Make sure you are connected to the encyclopedia database. Write a query to retrieve the first row of data from the countries table.
SELECT * FROM countries
LIMIT 1;

-- Write a query to retrieve the name of the country with the largest population.
SELECT name FROM countries ORDER BY population DESC LIMIT 1;

-- Write a query to retrieve the name of the country with the second largest population.
SELECT name FROM countries ORDER BY population DESC LIMIT 1 OFFSET 1;

-- Write a query to retrieve all of the unique values from the binomial_name column of the animals table.
SELECT DISTINCT binomial_name FROM animals;

-- Write a query to return the longest binomial name from the animals table.
SELECT binomial_name FROM animals ORDER BY length(binomial_name) DESC LIMIT 1;

-- Write a query to return the first name of any celebrity born in 1958.
SELECT first_name FROM celebrities WHERE date_part('year', date_of_birth) = 1958;

-- Write a query to return the highest maximum age from the animals table.
SELECT max_age_years FROM animals ORDER BY max_age_years DESC LIMIT 1;

-- Write a query to return the average maximum weight from the animals table.
SELECT avg(max_weight_kg) FROM animals;

-- Write a query to return the number of rows in the countries table.
SELECT count(id) FROM countries;

-- Write a query to return the total population of all the countries in the countries table.
SELECT sum(population) FROM countries;

-- Write a query to return each unique conservation status code alongside the number of animals that have that code.
SELECT conservation_status, count(id) FROM animals GROUP BY conservation_status;

-- Connect to the ls_burger database. Write a query that returns the average burger cost for all orders that include fries.
SELECT avg(burger_cost) FROM orders WHERE side = 'Fries';

-- Write a query that returns the cost of the cheapest side ordered.
SELECT side_cost FROM orders WHERE side_cost IS NOT NULL ORDER BY side_cost LIMIT 1;

-- Write a query that returns the number of orders that include Fries and the number of orders that include Onion Rings.
SELECT side, count(id) FROM orders WHERE side = 'Fries' OR side = 'Onion Rings' GROUP BY side;
