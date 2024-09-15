-- -- Describe the difference between the varchar and text data types.
-- ANSWER: varchar and text data types are both used to store strings, but the 
-- former has a user-specified size (i.e. the user specifies what the maximum char
-- limit is) while text has no set limit.

-- -- Describe the difference between the integer, decimal, and real data types.
-- ANSWER: The integer data type is used to store integers. The real data type is used to
-- store floating point numbers. The decimal data type is used to store non-floating
-- point numbers with a precision specified by the user.

-- -- What is the largest value that can be stored in an integer column?
-- ANSWER: 2,147,483,647

-- -- Describe the difference between the timestamp and date data types.
-- ANSWER: The timestamp data type stores a formatted time, down to the second and including
-- a date. The data data type only stores the date (and not the time)

-- -- Can a time with a time zone be stored in a column of type timestamp?
--ANSWER: No but there is a 'timestamp with time zone' data type that can
