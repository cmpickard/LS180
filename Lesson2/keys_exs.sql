-- Write a SQL statement that makes a new sequence called "counter".
CREATE SEQUENCE counter;

-- Write a SQL statement to retrieve the next value from the sequence created in #1.
SELECT nextval('counter');

-- Write a SQL statement that removes a sequence called "counter".
DROP SEQUENCE counter;

-- Is it possible to create a sequence that returns only even numbers? The 
-- documentation for sequence might be useful.
CREATE SEQUENCE by_two
  INCREMENT BY 2
  MINVALUE 2;

-- What will the name of the sequence created by the following SQL statement be?
-- CREATE TABLE regions (id serial PRIMARY KEY, name text, area integer);

-- ANS: it's always <table_name>_<col_name>_seq
-- so, this will create a sequence called regions_id_seq;


-- Write a SQL statement to add an auto-incrementing integer primary key column 
-- to the films table.
ALTER TABLE films
  ADD COLUMN id serial PRIMARY KEY;

-- What error do you receive if you attempt to update a row to have a value for id 
-- that is used by another row?
UPDATE films SET id = 1;
-- ERROR:  duplicate key value violates unique constraint "films_pkey"
-- DETAIL:  Key (id)=(1) already exists.


-- What error do you receive if you attempt to add another primary key column to 
-- the films table?
ALTER TABLE films
  ADD COLUMN id2 serial PRIMARY KEY;
  -- ERROR:  multiple primary keys for table "films" are not allowed

-- Write a SQL statement that modifies the table films to remove its primary key 
-- while preserving the id column and the values it contains.

ALTER TABLE films
  DROP CONSTRAINT films_pkey;