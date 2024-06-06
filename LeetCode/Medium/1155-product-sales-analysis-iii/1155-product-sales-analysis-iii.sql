WITH mins AS (
    SELECT product_id, year, quantity, price,
    RANK() OVER (PARTITION BY product_id ORDER BY year) AS row_num
    FROM sales
)
SELECT m.product_id, m.year AS first_year, m.quantity, m.price
FROM mins AS m
WHERE m.row_num = 1;

