SELECT 
    id AS inventory_item_id,
    product_id,
    DATE(created_at) AS inventory_date,
    DATE(sold_at) AS date_sold,
    ROUND(cost, 2) AS product_cost,
    product_category,
    product_name,
    product_brand,
    ROUND(product_retail_price, 2) AS product_retail_price,
    product_department,
    product_distribution_center_id

FROM 
    {{ ref("stg_inventory_items")}}
