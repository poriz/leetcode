WITH Odd AS (
    SELECT id,student
    FROM Seat
    WHERE id % 2 = 1
),
Even AS (
    SELECT id,student
    FROM Seat
    WHERE id % 2 = 0
),
cte AS (
    SELECT o.id AS oddID, o.student AS oddName, e.id AS evenID, e.student AS evenName
    FROM Odd o
    JOIN Even e On e.id -1 = o.id
) 
SELECT oddId AS id, evenName AS student FROM cte
UNION
SELECT evenID, oddName FROM cte
UNION
SELECT id, student FROM Seat
WHERE id NOT IN (SELECT oddID FROM cte UNION SELECT evenID FROM cte)
ORDER BY id;