SELECT p.name
FROM stars s
JOIN movies m ON s.movie_id = m.id
JOIN people p ON s.person_id = p.id
WHERE m.id IN (SELECT s2.movie_id
               FROM stars s2
               JOIN people p2 ON s2.person_id = p2.id
               WHERE p2.name = "Kevin Bacon" and p2.birth = 1958)
      and p.name <> "Kevin Bacon";