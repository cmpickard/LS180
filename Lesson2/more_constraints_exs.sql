-- Import this file (see ./import_file3.sql) into a PostgreSQL database.


-- Modify all of the columns to be NOT NULL.
ALTER TABLE films
  ALTER COLUMN title SET NOT NULL,
  ALTER COLUMN year SET NOT NULL,
  ALTER COLUMN genre SET NOT NULL,
  ALTER COLUMN director SET NOT NULL,
  ALTER COLUMN duration SET NOT NULL;

-- How does modifying a column to be NOT NULL affect how it is displayed by \d films?
-- ANSWER: the scheme-describing table returned by the \d films meta-command includes
-- a column called 'Nullable'. Each column of the films table has its own row in this
-- table and the row will have "not null" listed under the nullable column if the
-- table column in question has NOT NULL set as a constraint.

-- Add a constraint to the table films that ensures that all films have a unique title.
ALTER TABLE films
  ADD CONSTRAINT unique_title UNIQUE (title);

-- How is the constraint added in #4 displayed by \d films?
-- ANS: the uniqueness constraint is listed at the bottom of the returned schema 
-- table, as an element of the table's list of "Indexes".

-- Write a SQL statement to remove the constraint added in #4.
ALTER TABLE films
  DROP CONSTRAINT unique_title;

-- Add a constraint to films that requires all rows to have a value for title that 
-- is at least 1 character long.
ALTER TABLE films
  ADD CONSTRAINT no_blank_titles CHECK (length(title) > 0);

-- What error is shown if the constraint created in #7 is violated? Write a SQL 
-- INSERT statement that demonstrates this.
INSERT INTO films
  VALUES ('', 0, '', '', 0);
-- It says, "new row for relation "films" violates check constraint "no_blank_titles""


-- How is the constraint added in #7 displayed by \d films?
-- ANS: It's listed at the bottom of the schema table. Not as an "Index" this time but
-- as a "Check constraint"

-- Write a SQL statement to remove the constraint added in #7.
ALTER TABLE films
  DROP CONSTRAINT no_blank_titles;

-- Add a constraint to the table films that ensures that all films have a year 
-- between 1900 and 2100.
ALTER TABLE films
  ADD CONSTRAINT plausible_century CHECK (year >= 1900 AND year <= 2100);

-- How is the constraint added in #11 displayed by \d films?
-- ANS: It's listed at the bottom of the schema table as a "Check constraint"


-- Add a constraint to films that requires all rows to have a value for director 
-- that is at least 3 characters long and contains at least one space character ().
ALTER TABLE films
  ADD CONSTRAINT director_check CHECK (length(director) > 2 AND director LIKE '% %');


-- How does the constraint created in #13 appear in \d films?
-- ANS: It's listed at the bottom of the schema table as a "Check constraint"


-- Write an UPDATE statement that attempts to change the director for "Die Hard" to
-- "Johnny". Show the error that occurs when this statement is executed.
UPDATE films SET director = 'Johnny' WHERE title = 'Die Hard';


-- List three ways to use the schema to restrict what values can be stored in a column.
-- ANS:
-- (i) We can set the datatype to accept only certain kinds of data
-- (ii) We can add check constraints to the column to prevent certain kinds of data 
-- (iii) We can add NOT NULL constraints to prevent NULL entries into the column


-- Is it possible to define a default value for a column that will be considered 
-- invalid by a constraint? Create a table that tests this.
CREATE TABLE tester (
  bogus int NOT NULL DEFAULT NULL
);
-- ANS: Yes, that is allowed.

-- How can you see a list of all of the constraints on a table?
-- ANS: the \d <table_name> metacommand will list them all.