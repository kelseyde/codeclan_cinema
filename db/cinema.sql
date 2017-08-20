DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS showings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS movies;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  cash INT
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) UNIQUE,
  showing VARCHAR(255),
  price INT
);

CREATE TABLE showings (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) REFERENCES movies(title) ON DELETE CASCADE,
  showing VARCHAR(255)
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  movie_id INT REFERENCES movies(id) ON DELETE CASCADE,
  showing_id INT REFERENCES showings(id) ON DELETE CASCADE
);
