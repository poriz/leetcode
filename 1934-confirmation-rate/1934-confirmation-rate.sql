SELECT s.user_id, ROUND(AVG(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END),2) AS confirmation_rate
FROM Confirmations as c
RIGHT JOIN Signups AS s 
    ON s.user_id = c.user_id
GROUP BY s.user_id