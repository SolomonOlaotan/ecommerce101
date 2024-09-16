SELECT
    CASE
        WHEN c.age BETWEEN 10 AND 25 THEN '10-25'
        WHEN c.age BETWEEN 26 AND 35 THEN '26-35'
        WHEN c.age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46 Plus'
    END AS age_group,
    p.product_category,
    COUNT(o.order_id) AS total_order
FROM 
    {{ ref("dim_customer")}} c 
JOIN 
    {{ ref("dim_orders")}} o 
    ON c.customer_id = o.customer_id
JOIN 
    {{ ref("dim_order_items")}} oi 
    ON o.customer_id = oi.customer_id 
JOIN
    {{ref("dim_products")}} p 
    ON oi.product_id = p.product_id
GROUP BY p.product_category, age_group
ORDER BY total_order  DESC