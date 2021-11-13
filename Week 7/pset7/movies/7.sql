SELECT m.title, s.rating
FROM movies m
JOIN ratings s ON m.id = s.movie_id
WHERE m.year = 2010
ORDER BY s.rating DESC, m.title ASC;