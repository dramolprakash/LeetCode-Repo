# Write your MySQL query statement below
SELECT 
    product_id,
    year AS first_year,
    quantity,
    price
FROM (
    SELECT 
        product_id,
        year,
        quantity,
        price,
        RANK() OVER (PARTITION BY product_id ORDER BY year) AS rn
    FROM Sales
) ranked
WHERE rn = 1;