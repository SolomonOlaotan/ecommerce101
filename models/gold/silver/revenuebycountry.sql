SELECT
    c.country AS country, 
    CAST(SUM(oi.sale_price) AS int) AS total_revenue
FROM 
    {{ ref("dim_customer")}} c 
JOIN
    {{ ref("dim_orders")}} o 
    ON c.customer_id = o.order_id 
JOIN 
    {{ref("dim_order_items")}} oi 
    ON o.order_id = oi.order_item_id 
WHERE NOT (order_item_status = 'Cancelled' OR order_item_status = 'Processing')
GROUP BY country
ORDER BY total_revenue DESC
