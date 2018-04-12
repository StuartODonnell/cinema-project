DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers (

id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
funds INT

);

CREATE TABLE films (

id SERIAL8 PRIMARY KEY,
title VARCHAR(255),
price INT

);

CREATE TABLE tickets (

id SERIAL8 PRIMARY KEY,
customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE,
film_id INT8 REFERENCES films(id) ON DELETE CASCADE

);

-- this selects the locations(films) visited by a specific ()customers)users
-- SELECT locations.* FROM locations INNER JOIN visits ON locations.id = visits.location_id WHERE visits.user_id = 16;
