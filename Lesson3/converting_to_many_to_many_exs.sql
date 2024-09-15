-- Write the SQL statement needed to create a join table that will allow a film to
-- have multiple directors, and directors to have multiple films. Include an id
-- column in this table, and add foreign key constraints to the other columns.
CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id int REFERENCES directors(id) ON DELETE CASCADE,
  film_id int REFERENCES films(id) ON DELETE CASCADE,
  UNIQUE (director_id, film_id)
);

-- Write the SQL statements needed to insert data into the new join table to
-- represent the existing one-to-many relationships.

INSERT INTO directors_films (director_id, film_id)
  VALUES (1, 1), (2 ,2), (3 ,3), (4 ,4), (5 ,5), 
  (6 ,6), (3 ,7), (7 ,8), (8 ,9), (4 ,10);

-- Write a SQL statement to remove any unneeded columns from films.
ALTER TABLE films
  DROP COLUMN director_id;

-- Write a SQL statement that will return the following result:
--            title           |         name
-- ---------------------------+----------------------
--  12 Angry Men              | Sidney Lumet
--  1984                      | Michael Anderson
--  Casablanca                | Michael Curtiz
--  Die Hard                  | John McTiernan
--  Let the Right One In      | Michael Anderson
--  The Birdcage              | Mike Nichols
--  The Conversation          | Francis Ford Coppola
--  The Godfather             | Francis Ford Coppola
--  Tinker Tailor Soldier Spy | Tomas Alfredson
--  Wayne's World             | Penelope Spheeris
-- (10 rows)

SELECT films.title, directors.name FROM films 
  JOIN directors_films ON films.id = directors_films.film_id
  JOIN directors ON directors.id = directors_films.director_id
  ORDER BY films.title;

-- Write SQL statements to insert data for the following films into the database:

-- Film	Year	Genre	Duration	Directors
-- Fargo	1996	comedy	98	Joel Coen
-- No Country for Old Men	2007	western	122	Joel Coen, Ethan Coen
-- Sin City	2005	crime	124	Frank Miller, Robert Rodriguez
-- Spy Kids	2001	scifi	88	Robert Rodriguez

INSERT INTO directors (name)
VALUES ('Joel Coen'), ('Ethan Coen'), ('Robert Rodriguez'), ('Frank Miller');

INSERT INTO films (title, "year", genre, duration)
VALUES ('Fargo', 1996, 'comedy', 98), ('No Country For Old Men', 2007, 'western', 122),
('Sin City', 2005, 'crime', 124), ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors_films (director_id, film_id)
VALUES (9, 11), (9, 12), (10, 12), (12, 13), (11, 13), (11, 14);

-- Write a SQL statement that determines how many films each director in the
-- database has directed. Sort the results by number of films (greatest first)
-- and then name (in alphabetical order).

SELECT directors.name, count(*) AS films_directed FROM directors
  JOIN directors_films ON directors.id = directors_films.director_id
  JOIN films ON films.id = directors_films.film_id
  GROUP BY directors.name
  ORDER BY films_directed DESC, directors.name ASC;