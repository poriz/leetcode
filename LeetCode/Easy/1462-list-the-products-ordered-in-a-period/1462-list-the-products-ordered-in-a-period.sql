WITH CTE AS (
    SELECT product_id, order_date, SUM(unit) AS unit
    FROM Orders
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY product_id,order_date
),
CTE2 AS (
    SELECT p.product_name, SUM(c.unit) AS unit
    FROM CTE c LEFT JOIN Products p ON c.product_id = p.product_id
    GROUP BY p.product_name
)
SELECT *
FROM CTE2
WHERE unit >=100