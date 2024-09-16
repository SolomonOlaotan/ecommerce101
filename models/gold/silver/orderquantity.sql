SELECT
    SUM(order_quantity) AS quantity_sold
FROM 
    {{ ref("dim_orders")}}
WHERE NOT (order_status = 'Cancelled' OR order_status = 'Processing') 

