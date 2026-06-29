/*
===========================================
Project: Netflix SQL Data Analysis
Author: Ritvik
Database: netflix_db
Dataset: Netflix Titles
Description:
This project analyzes the Netflix dataset using SQL
to answer real-world business questions.
===========================================
*/

-- =========================================
-- Q1: Count Movies and TV Shows
-- =========================================

SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

-- =========================================
-- Q2: Find the Most Common Rating
-- =========================================

SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC
LIMIT 1;

-- =========================================
-- Q3: Top 5 Countries with the Most Netflix Content
-- =========================================

SELECT country, COUNT(*) AS total
FROM netflix_titles
GROUP BY country
ORDER BY total DESC
LIMIT 5;


-- =========================================
-- Q4: Release Year with the Highest Number of Titles
-- =========================================

SELECT release_year, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year
ORDER BY total DESC
LIMIT 1;


-- =========================================
-- Q5: List All Movies Released in 2020
-- =========================================

SELECT title
FROM netflix_titles
WHERE type = 'Movie'
AND release_year = 2020;


-- =========================================
-- Q6: Top 10 Longest Movies
-- =========================================

SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY CAST(REPLACE(duration, ' min', '') AS UNSIGNED) DESC
LIMIT 10;


-- =========================================
-- Q7: Movies Released Before 2015
-- =========================================

SELECT title
FROM netflix_titles
WHERE type = 'Movie'
AND release_year < 2015;


-- =========================================
-- Q8: Top 5 Directors with the Most Titles
-- =========================================

SELECT director, COUNT(*) AS total
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total DESC
LIMIT 5;


-- =========================================
-- Q9: Titles Directed by Directors Whose Name Starts with 'S'
-- =========================================

SELECT title
FROM netflix_titles
WHERE director LIKE 'S%';


-- =========================================
-- Q10: PG-13 Movies Released After 2018
-- =========================================

SELECT title
FROM netflix_titles
WHERE type = 'Movie'
AND rating = 'PG-13'
AND release_year > 2018;


-- =========================================
-- Q11: Ratings Having More Than 5 Titles
-- =========================================

SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
HAVING COUNT(*) > 5
ORDER BY total DESC;


-- =========================================
-- Q12: Number of Movies and TV Shows Released Each Year
-- =========================================

SELECT release_year, type, COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year, type;


-- =========================================
-- Q13: Five Oldest Movies on Netflix
-- =========================================

SELECT title, release_year
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY release_year ASC
LIMIT 5;


-- =========================================
-- Q14: Number of Movies and TV Shows for Each Rating
-- =========================================

SELECT type, rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY type, rating;


-- =========================================
-- Q15: Titles Containing the Word 'Love'
-- =========================================

SELECT title
FROM netflix_titles
WHERE title LIKE '%Love%';


-- =========================================
-- Q16: Rename Movie/TV Show using CASE
-- =========================================

SELECT
CASE
    WHEN type = 'Movie' THEN 'Film'
    ELSE 'Series'
END AS content_type,
COUNT(*) AS total
FROM netflix_titles
GROUP BY type;


-- =========================================
-- Q17: Movie(s) Released in the Latest Year
-- =========================================

SELECT title, release_year
FROM netflix_titles
WHERE release_year = (
    SELECT MAX(release_year)
    FROM netflix_titles
);


-- =========================================
-- Q18: Directors Who Directed More Than 2 Movies
-- =========================================

SELECT director, COUNT(*) AS movie_count
FROM netflix_titles
WHERE type = 'Movie'
AND director IS NOT NULL
GROUP BY director
HAVING COUNT(*) > 2;


-- =========================================
-- Q19: Titles Rated PG-13, R or TV-MA
-- =========================================

SELECT title, rating
FROM netflix_titles
WHERE rating IN ('PG-13', 'R', 'TV-MA');


-- =========================================
-- Q20: Movies That Are Not Rated PG-13
-- =========================================

SELECT title, rating
FROM netflix_titles
WHERE type = 'Movie'
AND rating NOT IN ('PG-13');


-- =========================================
-- Q21: Country Producing the Highest Number of Movies
-- =========================================

SELECT country, COUNT(*) AS movie_count
FROM netflix_titles
WHERE type = 'Movie'
AND country IS NOT NULL
GROUP BY country
ORDER BY movie_count DESC
LIMIT 1;


-- =========================================
-- Q22: Top 3 Directors with the Most PG-13 Movies Released After 2015
-- =========================================

SELECT director, COUNT(*) AS movie_count
FROM netflix_titles
WHERE type = 'Movie'
AND release_year > 2015
AND rating = 'PG-13'
AND director IS NOT NULL
GROUP BY director
ORDER BY movie_count DESC
LIMIT 3;