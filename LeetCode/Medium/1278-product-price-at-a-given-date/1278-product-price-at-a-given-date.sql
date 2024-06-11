WITH temp AS (
    SELECT
        product_id,
        new_price,
        change_date,
        max(change_date) OVER (PARTITION BY product_id ORDER BY product_id)AS recent_date
    FROM
        products
    WHERE 
        change_date <= '2019-08-16'

)
SELECT product_id, new_price AS price
FROM temp
WHERE change_date = recent_date

UNION

SELECT
    DISTINCT(product_id),
    10 AS price
FROM products
GROUP BY product_id
HAVING
    min(change_date) > '2019-08-16'



