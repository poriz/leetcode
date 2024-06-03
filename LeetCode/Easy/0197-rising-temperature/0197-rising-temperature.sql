WITH new_wd AS (
    SELECT id, recordDate,temperature,
    LAG(recordDate) OVER (ORDER BY recordDate) AS bf_date,
    LAG(temperature) OVER (ORDER BY recordDate) AS bf_temp
    FROM Weather
)
SELECT id
FROM new_wd
WHERE temperature > bf_temp AND DATEDIFF(recordDate,bf_date) = 1;

