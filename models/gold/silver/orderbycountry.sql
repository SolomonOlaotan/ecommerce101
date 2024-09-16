SELECT 
c.country,
COUNT( o.order_id) AS total_order
FROM
    {{ ref("dim_customer")}} c 
JOIN 
    {{ ref("dim_orders")}} o 
ON c.customer_id = o.customer_id
GROUP BY country
ORDER BY total_order DESC
