SELECT 
    dc.center_id,
    dc.center_name,
    COUNT(o.order_id) AS total_order,
    CAST(SUM(oi.sale_price) AS int) AS total_sales
FROM
    {{ ref( "dim_distribution")}} dc 
JOIN 
    {{ ref("dim_products")}} p 
ON dc.center_id = p.center_id
JOIN 
    {{ ref("dim_order_items")}} oi 
ON p.product_id = oi.product_id
JOIN 
    {{ ref("dim_orders")}} o 
ON oi.order_item_id = o.order_id
GROUP BY center_id, center_name
ORDER BY total_order DESC
