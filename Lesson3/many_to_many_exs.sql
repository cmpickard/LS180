-- The books_categories table from this database was created with foreign keys 
-- that don't have the NOT NULL and ON DELETE CASCADE constraints. Go ahead and 
-- add them now.

ALTER TABLE books_categories
  DROP CONSTRAINT books_categories_book_id_fkey,
  DROP CONSTRAINT books_categories_category_id_fkey;

ALTER TABLE books_categories
  ADD FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
  ALTER COLUMN book_id SET NOT NULL;

ALTER TABLE books_categories
  ADD FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
  ALTER COLUMN category_id SET NOT NULL;

-- Write a SQL statement that will return the following result:

--  id |     author      |           categories
-- ----+-----------------+--------------------------------
--   1 | Charles Dickens | Fiction, Classics
--   2 | J. K. Rowling   | Fiction, Fantasy
--   3 | Walter Isaacson | Nonfiction, Biography, Physics
-- (3 rows)

SELECT b.id, b.author, string_agg(c.name, ', ') FROM books b
  JOIN books_categories bc 
    ON bc.book_id = b.id
  JOIN categories c 
    ON bc.category_id = c.id
  GROUP BY b.id
  ORDER BY b.id;

-- Write SQL statements to insert the following new books into the database. What 
-- do you need to do to ensure this data fits in the database?

-- Author	Title	Categories
-- Lynn Sherr	Sally Ride: America's First Woman in Space	Biography, Nonfiction, Space Exploration
-- Charlotte Brontë	Jane Eyre	Fiction, Classics
-- Meeru Dhalwala and Vikram Vij	Vij's: Elegant and Inspired Indian Cuisine	Cookbook, Nonfiction, South Asia

CREATE TABLE authors (
  id serial PRIMARY KEY,
  name text NOT NULL
);

INSERT INTO authors (name)
  VALUES ('Charles Dickens'),
  ('J. K. Rowling'),
  ('Walter Isaacson'),
  ('Lynn Sherr'),
  ('Charlotte Brontë'),
  ('Meeru Dhalwala'),
  ('Vikram Vij');

CREATE TABLE authors_books (
  author_id int NOT NULL REFERENCES authors(id) ON DELETE CASCADE,
  book_id int NOT NULL REFERENCES books(id) ON DELETE CASCADE
);

ALTER TABLE books
  DROP COLUMN author,
  ALTER COLUMN title TYPE text;

INSERT INTO books (title)
  VALUES ('Sally Ride: America''s First Woman in Space'),
  ('Jane Eyre'),
  ('Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO authors_books (author_id, book_id)
  VALUES (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 6);

  INSERT INTO categories (name)
  VALUES ('Space Exploration'), ('Cookbook'), ('South Asia');

INSERT INTO books_categories
  VALUES (4, 5),
  (4, 1),
  (4, 7),
  (5, 2),
  (5, 4),
  (6, 8),
  (6, 1),
  (6, 9);

-- Test query:
SELECT b.title,
       string_agg(DISTINCT a.name, ', ') AS "author(s)",
       string_agg(DISTINCT c.name, ', ') AS "genre(s)"
  FROM authors a
  JOIN authors_books ab 
    ON ab.author_id = a.id
  JOIN books b 
    ON ab.book_id = b.id
  JOIN books_categories bc 
    ON bc.book_id = b.id
  JOIN categories c 
    ON bc.category_id = c.id
  GROUP BY b.id;

-- Write a SQL statement to add a uniqueness constraint on the combination of 
-- columns book_id and category_id of the books_categories table. 
-- This constraint should be a table constraint; so, it should check for uniqueness
--  on the combination of book_id and category_id across all rows of the 
--  books_categories table.

ALTER TABLE books_categories
  ADD UNIQUE (book_id, category_id);

ALTER TABLE authors_books
  ADD UNIQUE (book_id, author_id);

-- Write a SQL statement that will return the following result:

--       name        | book_count |                                 book_titles
-- ------------------+------------+-----------------------------------------------------------------------------
-- Biography         |          2 | Einstein: His Life and Universe, Sally Ride: America's First Woman in Space
-- Classics          |          2 | A Tale of Two Cities, Jane Eyre
-- Cookbook          |          1 | Vij's: Elegant and Inspired Indian Cuisine
-- Fantasy           |          1 | Harry Potter
-- Fiction           |          3 | Jane Eyre, Harry Potter, A Tale of Two Cities
-- Nonfiction        |          3 | Sally Ride: America's First Woman in Space, Einstein: His Life and Universe, Vij's: Elegant and Inspired Indian Cuisine
-- Physics           |          1 | Einstein: His Life and Universe
-- South Asia        |          1 | Vij's: Elegant and Inspired Indian Cuisine
-- Space Exploration |          1 | Sally Ride: America's First Woman in Space

SELECT c.name,
       count(*) AS book_count,
       string_agg(b.title, ', ') AS book_titles
  FROM books b
  JOIN books_categories bc
    ON bc.book_id = b.id
  JOIN categories c
    ON bc.category_id = c.id
  GROUP BY c.id
  ORDER BY c.name;