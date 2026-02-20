create database project_movie_database;
use project_movie_database;
select database();
show tables;
DESCRIBE movies;
desc directors;
-- a) Can you get all data about movies?
select* from movies; 
-- b) How do you get all data about directors?
select* from directors;
-- c) Check how many movies are present in IMDB.
select count(*) as total_movies from movies;
-- d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors where name IN ('James Cameron', 'Luc Besson', 'John Woo');
-- e) Find all directors with name starting with S.
Select * from directors where name LIKE 'S%';
-- f) Count female directors.
select count(*) as female_directors from directors where gender=1;
-- g) Find the name of the 10th first women directors?
select name from directors where gender=1 order by id limit 1 offset 9;
-- h) What are the 3 most popular movies?
select title, popularity from movies order by popularity desc limit 3;
-- i) What are the 3 most bankable movies?
SELECT title, revenue FROM movies ORDER BY revenue DESC LIMIT 3;
-- j) What is the most awarded average vote since the January 1st, 2000?
select title, vote_average from movies where release_date>= '2000-01-01' order by vote_average desc limit 1;
-- k) Which movie(s) were directed by Brenda Chapman?
SELECT m.title
FROM movies m
JOIN directors d
ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';
-- l) Which director made the most movies?
SELECT d.name,
COUNT(m.id) AS movie_count
FROM movies m
JOIN directors d
ON m.director_id = d.id
GROUP BY d.name
ORDER BY movie_count DESC
LIMIT 1;
-- m) Which director is the most bankable?
SELECT d.name,
SUM(m.revenue) AS total_revenue
FROM movies m
JOIN directors d
ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_revenue DESC
LIMIT 1;

