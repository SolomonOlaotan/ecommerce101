SELECT 
    CAST(SUM(sale_price) AS int) AS gross_revenue
FROM 
    {{ ref("dim_order_items")}}
WHERE NOT (order_item_status = 'Cancelled' OR order_item_status = 'Processing')

