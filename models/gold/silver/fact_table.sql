SELECT
    oi.id AS order_item_id,
    oi.order_id,
    oi.user_id AS customer_id,
    oi.product_id,
    oi.inventory_item_id,
    oi.created_at AS order_item_date,
    o.num_of_item AS order_quantity,
    oi.sale_price
FROM
    {{ ref("stg_order_items")}} oi 
JOIN 
    {{ ref("stg_orders")}} o 
ON oi.id = o.order_id
