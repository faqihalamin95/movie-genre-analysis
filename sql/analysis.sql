-- Phase 1 Project
-- =====================================

-- Table definition
DROP TABLE IF EXISTS movies;

CREATE TABLE IF NOT EXISTS movies (
    title TEXT,
    genre TEXT,
    release_date TEXT,
    popularity TEXT,
    release_year TEXT
);

-- Core analysis: most popular genres
-- last 5 years
-- =====================================

.headers on
.mode column

SELECT
    genre,
    COUNT(*) AS total_movies,
    SUM(CAST(popularity AS INTEGER)) AS total_popularity
FROM movies
WHERE CAST(release_year AS INTEGER) >= 2017
GROUP BY genre
ORDER BY total_popularity DESC
LIMIT 10;
