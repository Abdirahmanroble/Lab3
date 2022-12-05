-- all lessons taken in 2022
   EXPLAIN SELECT
    EXTRACT(month FROM start_time) AS month,
    count(*) FROM lesson WHERE EXTRACT(YEAR FROM start_time) = '2022' GROUP BY EXTRACT(month FROM start_time)
    ORDER BY EXTRACT(month FROM start_time) ASC;

-- all private lessons taken in 2022
SELECT
    EXTRACT(month FROM start_time) AS month,
    count(*) FROM lesson 
	RIGHT JOIN private_lesson ON  lesson.id = private_lesson.lesson_id 
    WHERE EXTRACT(YEAR FROM start_time) = '2022' GROUP BY EXTRACT(month FROM start_time)
    ORDER BY EXTRACT(month FROM start_time) ASC;


-- all group lessons taken in 2022
SELECT
    EXTRACT(month FROM start_time) AS month,
    count(*) FROM lesson 
	RIGHT JOIN group_lesson ON  lesson.id = group_lesson.lesson_id 
    WHERE EXTRACT(YEAR FROM start_time) = '2022' GROUP BY EXTRACT(month FROM start_time)
    ORDER BY EXTRACT(month FROM start_time) ASC;



-- all ensembles taken in 2022
SELECT
    EXTRACT(month FROM start_time) AS month,
    count(*) FROM lesson 
	RIGHT JOIN ensembles ON  lesson.id = ensembles.lesson_id 
    WHERE EXTRACT(YEAR FROM start_time) = '2022' GROUP BY EXTRACT(month FROM start_time)
    ORDER BY EXTRACT(month FROM start_time) ASC;



-- siblings

  SELECT student.person_id, COUNT(CASE WHEN sibling.student_id IS NOT NULL THEN 'has_sibling' END) AS number_of_siblings from student LEFT JOIN sibling ON student.person_id = sibling.student_id GROUP BY student.person_id ORDER BY student.person_id;



 -- instructor lessons

  SELECT instructor_person_id, count(*) FROM lesson WHERE EXTRACT(YEAR FROM start_time) = '2022' AND EXTRACT(MONTH FROM start_time) = '12' GROUP BY instructor_person_id HAVING COUNT(*) > 0
    ORDER BY count(*) DESC;

-- Show all ensembles in next week
SELECT lesson_id, to_char(start_time, 'Day') as weekday, genre, start_time,
CASE 
WHEN  (max_of_students - 10) = 0 
THEN 'full boked'

WHEN  (max_of_students - 9) = 1 or (max_seats - boked) = 2 
THEN '1-2 seats left!'

WHEN  (max_of_students - 7) > 2
THEN 'Seats left'

END
    FROM lesson RIGHT JOIN ensembles ON lesson.id = ensembles.lesson_id 
    WHERE date_trunc('week', start_time) = date_trunc('week', now()) + interval '1 week' ORDER BY genre, weekday;



