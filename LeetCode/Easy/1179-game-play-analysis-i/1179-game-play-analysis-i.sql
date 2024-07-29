WITH CTE AS (
    SELECT player_id,event_date
        ,ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) as r
    FROM Activity
)
SELECT player_id, event_date as first_login
FROM CTE
WHERE r = 1