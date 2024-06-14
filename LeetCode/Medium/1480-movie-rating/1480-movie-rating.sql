WITH g_movie AS (
    SELECT r.movie_id,COUNT(r.user_id) AS cnt, m.title, u.name
    FROM MovieRating AS r
    JOIN Movies AS m ON r.movie_id = m.movie_id JOIN Users AS u ON u.user_id = r.user_id
    GROUP BY r.user_id
),
fin1 AS (
SELECT name AS results
FROM g_movie
ORDER BY cnt DESC, name
limit 1
),
FE20 AS(
    SELECT m.title AS results
    FROM MovieRating AS mr JOIN Movies AS m 
        ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-28'
    GROUP BY mr.movie_id 
    ORDER BY AVG(mr.rating) DESC, m.title
    limit 1
)
SELECT * FROM FE20
UNION ALL
SELECT * FROM fin1