SELECT
    p.product_category AS category,
    SUM(o.order_quantity) AS order_quantity,
    CAST(SUM(oi.sale_price - p.cost) AS int) AS total_profit
FROM 
    {{ ref("dim_products")}} p 
JOIN 
    {{ ref("dim_order_items")}} oi 
    ON p.product_id = oi.product_id
JOIN 
    {{ref("dim_orders")}} o 
    ON oi.order_id = o.order_id
WHERE NOT (oi.order_item_status = 'Cancelled' OR oi.order_item_status = 'Processing')
GROUP BY category
ORDER BY total_profit DESC, order_quantity
