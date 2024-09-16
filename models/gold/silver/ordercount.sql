SELECT 
COUNT(order_id) AS total_order
FROM 
    {{ ref("dim_order_items")}}
WHERE NOT (order_item_status = 'Cancelled' OR order_item_status = 'Processing')
