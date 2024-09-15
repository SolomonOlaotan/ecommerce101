SELECT
    p.product_category AS product_category,
    CAST(SUM(oi.sale_price) AS int) AS total_sales,
    COUNT(o.order_quantity) AS quantity_sold
 
FROM 
    {{ ref("dim_order_items")}} oi 
JOIN 
    {{ref("dim_orders")}} o
ON 
    oi.order_id = o.order_id
JOIN 
    {{ ref("dim_products")}} p 
ON 
    o.order_id = p.product_id
WHERE NOT (oi.order_item_status = 'Cancelled' OR oi.order_item_status = 'Processing')
GROUP BY    
    product_category
ORDER BY  total_sales DESC
