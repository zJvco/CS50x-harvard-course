SELECT m.title
FROM stars s
JOIN movies m ON s.movie_id = m.id
JOIN people p ON s.person_id = p.id
WHERE p.name = "Helena Bonham Carter" and m.title IN (SELECT m2.title
                                                      FROM stars s2
                                                      JOIN movies m2 ON s2.movie_id = m2.id
                                                      JOIN people p2 ON s2.person_id = p2.id
                                                      WHERE p2.name = "Johnny Depp")