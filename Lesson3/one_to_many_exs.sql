-- Write a SQL statement to add the following call data to the database:

-- when	duration	first_name	last_name	number
-- 2016-01-18 14:47:00	632	William	Swift	7204890809

INSERT INTO calls
  VALUES (DEFAULT, '2016-01-18 14:47:00', 632, 6);

-- OR

INSERT INTO calls ("when", duration, contact_id)
  VALUES ('2016-01-18 14:47:00', 632, 6);

-- Write a SQL statement to retrieve the call times, duration, and first name for 
-- all calls not made to William Swift.
SELECT calls.duration, calls.when, contacts.first_name FROM calls
  JOIN contacts
    ON contacts.id = calls.contact_id
  WHERE contacts.id != 6;

-- Write SQL statements to add the following call data to the database:

-- when	duration	first_name	last_name	number
-- 2016-01-17 11:52:00	175	Merve	Elk	6343511126
-- 2016-01-18 21:22:00	79	Sawa	Fyodorov	6125594874

INSERT INTO contacts (first_name, last_name, number)
  VALUES ('Merve', 'Elk', 6343511126), ('Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls ("when", duration, contact_id)
  VALUES ('2016-01-17 11:52:00', 175, 26),
  ('2016-01-18 21:22:00', 79, 27);

-- Add a constraint to contacts that prevents a duplicate value being added in the 
-- column number.

ALTER TABLE contacts
  ADD CONSTRAINT unique_nums UNIQUE(number);

-- Write a SQL statement that attempts to insert a duplicate number for a new 
-- contact but fails. What error is shown?
INSERT INTO contacts (first_name, last_name, number)
  VALUES ('Merve', 'Elk', 6343511126), ('Sawa', 'Fyodorov', 6125594874);
-- ANS: "duplicate key value violates unique constraint "unique_nums""


-- Why does "when" need to be quoted in many of the queries in this lesson?
-- ANS: because the word 'when' is a keyword in Postgres -- i.e. to say, it has a
-- special syntactical meaning -- and Postgres can't consistently tell whether a
-- given use of the word 'when' is using it in intended syntactic sense or as the
-- name of a column in a table. It defaults to assuming we mean it syntactically,
-- and so when we *don't* mean it syntactically, we need to surround the word in
-- double quotes to indicate our intent to Postgres.


-- Draw an entity-relationship diagram for the data we've been working with in 
-- this assignment.

-- box(contacts) -|-----O-E box(calls)