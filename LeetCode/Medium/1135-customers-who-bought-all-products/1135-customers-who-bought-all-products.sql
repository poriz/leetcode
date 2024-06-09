WITH temp AS (
SELECT c.customer_id, COUNT(DISTINCT(c.product_key)) AS cnt
FROM Customer AS c
INNER JOIN Product AS p
    ON c.product_key = p.product_key
GROUP BY c.customer_id
)
SELECT customer_id
FROM temp
WHERE cnt = (SELECT COUNT(*) FROM Product)