-- 현재로부터 7일간의 평균을 구해야한다.
-- 재미난 점은 방문일의 최대까지 이동 평균을 구해야함.
-- 같은 날짜에 여러사람이 방문 가능하다. > 나누는건 7이지만 합은 7이상이 가능하다는 의미

WITH
CTE1 AS (
    SELECT visited_on, SUM(amount) AS s_amount
    FROM Customer
    GROUP BY visited_on
),
CTE2 AS (
    SELECT visited_on,
        SUM(s_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
    FROM CTE1
    LIMIT 100000
    OFFSET 6
)
SELECT visited_on, amount, ROUND(amount/7,2) AS average_amount
FROM CTE2