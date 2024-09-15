-- What kind of programming language is SQL?
-- ANS: It's a (a) SPECIAL PURPOSE (b) DECLARATIVE language for interacting with
-- relational databases


-- What are the three sublanguages of SQL?
-- ANS:
-- (i) DDL -- Data Definition Language
-- (ii) DML -- Data Maniuplation Language
-- (iii) DCL -- Data Control Language


-- Write the following values as quoted string values that could be used in a SQL query.
-- canoe
-- a long road
-- weren't
-- "No way!"

--ANS:
-- 'canoe'
-- 'a long road'
-- 'weren''t'
-- '\"No way!\"' or simply '"No way!"'


-- What operator is used to concatenate strings?
-- ANS: The || operator


-- What function returns a lowercased version of a string? Write a SQL statement using it.
-- ANS: lower(str)
-- SELECT lower('hElLO tHeRe')


-- How does the psql console display true and false values?
-- ANS: lowercase 't' and 'f'


-- The surface area of a sphere is calculated using the formula A = 4π r2, where A is the surface area and r is the radius of the sphere.
-- Use SQL to compute the surface area of a sphere with a radius of 26.3cm, truncated to return an integer.
--ANS: SELECT floor(4 * PI() * 26.3 ^ 2);