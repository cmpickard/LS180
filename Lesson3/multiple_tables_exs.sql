-- Write a query that determines how many tickets have been sold.

SELECT count(*) FROM tickets;

-- count
-- -------
-- 3783
-- (1 row)

-- Write a query that determines how many different customers purchased tickets to
--  at least one event.
SELECT count(DISTINCT customer_id) FROM tickets;



--   count
-- -------
--   1652
-- (1 row)

-- Write a query that determines what percentage of the customers in the database 
-- have purchased a ticket to one or more of the events.

-- OPTION 1:
SELECT round(100.0 * (count(DISTINCT tickets.customer_id) / (1.0 * count(DISTINCT customers.id))),2) 
AS percent_purchased_ticket FROM customers
  LEFT JOIN tickets
  ON customers.id = tickets.customer_id;

-- OPTION 2: NOTE -- the implicit CROSS JOIN takes awhile to process
SELECT 100.0 * count(DISTINCT tickets.customer_id) / count(DISTINCT customers.id) FROM tickets, customers;


-- Write a query that returns the name of each event and how many tickets were sold 
-- for it, in order from most popular to least popular.

SELECT events.name, count(*) AS tickets_sold FROM events
  LEFT JOIN tickets
  ON events.id = tickets.event_id
  GROUP BY events.name
  ORDER BY tickets_sold DESC;


-- Write a query that returns the user id, email address, and number of events for 
-- all customers that have purchased tickets to three events.

-- SELECT c.id, c.email, count(*) FROM tickets t
--   JOIN customers c
--   ON t.customer_id = c.id
--   GROUP BY c.id
--   HAVING count = 3;

SELECT customers.id, customers.email, count(DISTINCT tickets.event_id) AS purchased FROM tickets
  JOIN customers
  ON tickets.customer_id = customers.id
  GROUP BY customers.id
  HAVING count(DISTINCT tickets.event_id) = 3
  ORDER BY customers.id;


-- Write a query to print out a report of all tickets purchased by the customer 
-- with the email address 'gennaro.rath@mcdermott.co'. The report should include 
-- the event name and starts_at and the seat's section name, row, and seat number.

SELECT events.name, events.starts_at, sections.name AS section_name, 
seats.row AS section_row, seats.number AS seat_number FROM tickets 
  JOIN (SELECT * FROM customers WHERE email = 'gennaro.rath@mcdermott.co') AS geno
    ON tickets.customer_id = geno.id
  JOIN events ON tickets.event_id = events.id
  JOIN seats ON tickets.seat_id = seats.id
  JOIN sections ON sections.id = seats.section_id;




--         event        |      starts_at      |    section    | row | seat
-- --------------------+---------------------+---------------+-----+------
--   Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   10
--   Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   11
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   14
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   15
--   Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   16
--   Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    7
--   Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    8
-- (7 rows)