DROP TABLE customers CASCADE;
DROP TABLE films CASCADE;
DROP TABLE TICKETS CASCADE;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
); 
 
CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE tickets (
id SERIAL4 PRIMARY KEY,
customer_id INT4 references customers(id) ON DELETE CASCADE,
film_id INT4 references films(id) ON DELETE CASCADE
);