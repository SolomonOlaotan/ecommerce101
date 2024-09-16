SELECT
    oi.product_id,
    dc.center_id,
    dc.center_name,
    DATE_DIFF(oi.order_item_delivered_date, oi.order_item_shipped_date, DAY) AS day_diff 
FROM
    {{ ref("dim_order_items")}} oi 
JOIN 
    {{ ref("dim_distribution")}} dc
ON  oi.product_id = dc.center_id
WHERE (oi.order_item_delivered_date IS NOT NULL AND
    oi.order_item_shipped_date IS NOT NULL) 
GROUP by 1, 2, 3, 4
ORDER BY day_diff ASC

