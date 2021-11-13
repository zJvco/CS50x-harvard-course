SELECT AVG(s.rating) AS average_rating
FROM movies m
JOIN ratings s ON m.id = s.movie_id
WHERE m.year = 2012;