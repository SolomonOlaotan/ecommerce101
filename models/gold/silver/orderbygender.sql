SELECT 
c.gender,
COUNT(DISTINCT o.order_id) AS total_order
FROM
    {{ ref("dim_customer")}} c 
JOIN 
    {{ ref("dim_orders")}} o 
ON c.customer_id = o.customer_id
WHERE NOT (order_status = 'Cancelled' OR order_status = 'Processing') 
GROUP BY gender
