SELECT
    EXTRACT(month FROM start_time) AS month,
    count(*) FROM lesson WHERE EXTRACT(YEAR FROM start_time) = '2022' GROUP BY EXTRACT(month FROM start_time)
    ORDER BY EXTRACT(month FROM start_time) ASC;