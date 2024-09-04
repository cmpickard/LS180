-- Create a new database called residents using the PostgreSQL command line tools.
CREATE DATABASE residents;

-- Load this file into the database created in #1.
\i /home/cpickard/LSCode/LS180/Lesson2/import_file2.sql;

-- Write a SQL query to list the ten states with the most rows in the people table
--  in descending order.
SELECT state, count(id) FROM people
GROUP BY state ORDER BY count(id) DESC LIMIT 10;

-- Write a SQL query that lists each domain used in an email address in the people 
-- table and how many people in the database have an email address containing that 
-- domain. Domains should be listed with the most popular first.
SELECT substring(email from '@.+'), count(id) FROM people 
  GROUP BY substring(email from '@.+') 
  ORDER BY count DESC;

-- Write a SQL statement that will delete the person with ID 3399 from the people
--  table.
DELETE FROM people WHERE id = 3399;

-- Write a SQL statement that will delete all users that are located in the state 
-- of California (CA).

DELETE FROM people WHERE state = 'CA';

-- Write a SQL statement that will update the given_name values to be all uppercase
--  for all users with an email address that contains teleworm.us.
UPDATE people 
  SET given_name = upper(given_name) WHERE email LIKE '%teleworm.us';

-- Write a SQL statement that will delete all rows from the people table.
DELETE FROM people;