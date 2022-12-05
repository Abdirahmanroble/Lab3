SELECT
    EXTRACT(month FROM start_time) AS month,
    count(*) FROM lesson WHERE EXTRACT(YEAR FROM start_time) = '2022' GROUP BY EXTRACT(month FROM start_time)
    ORDER BY EXTRACT(month FROM start_time) ASC;


SELECT EXTRACT(month FROM start_time) as month, count(*) t.premiered
FROM titles AS t
INNER JOIN crew AS c ON t.title_id=c.title_id
INNER JOIN people AS p ON c.person_id=p.person_id
WHERE t.type='movie' AND p.name='Samuel L. Jackson' AND c.category='actor'
ORDER BY t.premiered DESC;
