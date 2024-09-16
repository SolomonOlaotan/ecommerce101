SELECT
    CONCAT(c.first_name,' ',c.last_name) AS fullname,
    o.order_date,
    oi.sale_price,
    COUNT(o.order_id) OVER(ORDER BY o.order_date) AS Purchase_Frequency   
FROM
    {{ ref("dim_customer")}} c
JOIN 
    {{ ref("dim_orders")}} o 
ON 
    o.customer_id = c.customer_id
JOIN 
    {{ ref("dim_order_items")}} oi 
ON
    o.customer_id = oi.customer_id
GROUP BY o.order_date, o.order_id, fullname, oi.sale_price
ORDER BY 
    o.order_id DESC
