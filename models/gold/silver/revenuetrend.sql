SELECT
    EXTRACT(YEAR FROM o.order_date) AS order_year, 
    EXTRACT(MONTH FROM o.order_date) AS order_month,
    CAST(SUM(oi.sale_price) AS int) AS monthly_sales
FROM 
    {{ ref("dim_orders")}} o 
JOIN 
    {{ ref("dim_order_items")}} oi 
    ON o.order_id = oi.order_id 
WHERE NOT (order_item_status = 'Cancelled' OR order_item_status = 'Processing')
GROUP BY order_year, order_month
ORDER BY monthly_sales DESC
