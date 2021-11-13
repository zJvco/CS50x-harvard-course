SELECT m.title
FROM stars s
JOIN movies m ON s.movie_id = m.id
JOIN ratings r ON m.id = r.movie_id
JOIN people p ON s.person_id = p.id
WHERE p.name = "Chadwick Boseman"
ORDER BY r.rating DESC
LIMIT 5;