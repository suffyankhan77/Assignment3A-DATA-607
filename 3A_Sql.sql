-- Title: "Week 2A CodeBase: SQL and R – Movie Ratings, 3A Global Baseline Estimate"
-- Author: "Muhammad Suffyan Khan"
-- SQL script to recreate movie ratings database tables


DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;


-- USERS TABLE
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- MOVIES TABLE
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INT
);

-- RATINGS TABLE
CREATE TABLE ratings (
    rating_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    movie_id INT REFERENCES movies(movie_id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    UNIQUE(user_id, movie_id)
);

-- INSERT USERS
INSERT INTO users (name) VALUES
('Muhammad'),
('Ali'),
('Abdul'),
('Samir'),
('Daniyal');

-- INSERT MOVIES
INSERT INTO movies (title, release_year) VALUES
('Dune Part Two', 2024),
('Oppenheimer', 2023),
('Barbie', 2023),
('The Batman', 2022),
('Top Gun Maverick', 2022),
('Avatar The Way of Water', 2022);

-- INSERT RATINGS
INSERT INTO ratings (user_id, movie_id, rating) VALUES
(1,1,5),(1,2,5),(1,5,4),
(2,2,4),(2,3,3),(2,6,5),
(3,1,4),(3,4,3),(3,5,4),(3,6,4),
(4,2,5),(4,3,4),(4,5,5),
(5,1,3),(5,4,4),(5,2,5),(5,6,5);


--I did it in R but pasting here as well
SELECT u.name, m.title, r.rating
FROM ratings r
JOIN users u ON r.user_id = u.user_id
JOIN movies m ON r.movie_id = m.movie_id
ORDER BY u.name, m.title;

