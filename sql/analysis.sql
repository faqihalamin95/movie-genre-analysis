-- Phase 1 Project
-- =====================================

-- Table definition

CREATE TABLE IF NOT EXISTS movies (
    title TEXT,
    genre TEXT,
    release_date DATE,
    popularity REAL,
    release_year INTEGER
);

-- Core analysis: most popular genres
-- last 5 years
-- =====================================

.headers on
.mode column

SELECT
    genre,
    COUNT(*) AS total_movies,
    SUM(popularity) AS total_popularity
FROM movies
WHERE release_year >= 2017
GROUP BY genre
ORDER BY total_popularity DESC
LIMIT 10;
