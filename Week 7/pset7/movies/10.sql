SELECT DISTINCT p.name
FROM directors d
JOIN people p ON d.person_id = p.id
JOIN movies m ON d.movie_id = m.id
JOIN ratings r ON m.id = r.movie_id
WHERE r.rating >= 9.0;