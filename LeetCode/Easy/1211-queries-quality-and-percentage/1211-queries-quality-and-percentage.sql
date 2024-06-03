SELECT query_name, ROUND(SUM(rating/position) / count(query_name),2) as quality, 
     ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(query_name) * 100, 2) AS poor_query_percentage
FROM Queries
WHERE query_name is not null
GROUP BY query_name
