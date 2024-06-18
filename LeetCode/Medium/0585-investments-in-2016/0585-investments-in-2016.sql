WITh 
CTE AS (
    SELECT *, COUNT(*) as cnt
    FROM Insurance
    GROUP BY tiv_2015
),
CTE2 AS (
    SELECT i1.pid AS p
    FROM Insurance i1 JOIN Insurance i2 
        ON i1.lat = i2.lat AND i1.lon = i2.lon
    WHERE i1.pid <> i2.pid
),
CTE3 AS (
    SELECT tiv_2015
    FROM CTE
    WHERE cnt > 1
)
SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM Insurance AS i
JOIN CTE3 AS c3 ON c3.tiv_2015 = i.tiv_2015
WHERE i.pid not in (SELECT p FROM CTE2)