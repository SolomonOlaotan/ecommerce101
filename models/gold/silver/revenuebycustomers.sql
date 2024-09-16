SELECT
    COUNT(DISTINCT c.customer_id) AS customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS fullname, 
    SUM(o.order_quantity) AS total_quantity,
    CAST(SUM(oi.sale_price) AS int) AS total_sales
FROM {{ref("dim_customer")}} c
JOIN {{ ref("dim_orders")}} o ON c.customer_id = o.customer_id
JOIN {{ ref("dim_order_items")}} oi ON o.customer_id = oi.customer_id
WHERE NOT (oi.order_item_status = 'Cancelled' OR oi.order_item_status = 'Processing')
GROUP BY 2
ORDER BY total_sales DESC
