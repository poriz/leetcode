WITH a1 AS (
SELECT 
    player_id,
    CASE WHEN datediff(event_date,min(event_date) over (PARTITION BY player_id)) = 1 THEN 1 ELSE 0 END AS temp
FROM Activity
)
SELECT
    ROUND (SUM(temp)/COUNT(DISTINCT player_id),2) AS fraction
FROM a1;