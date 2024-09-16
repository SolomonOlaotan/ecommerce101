SELECT  
    ii.product_id, 
    ii.date_created, 
    ii.date_sold,
    COUNT(*) AS total_inventory,
    CASE WHEN date_sold IS NOT NULL THEN 'Yes'
    ELSE 'SOLD' END AS sold_count
FROM 
{{ ref("dim_inventory_items")}} ii 
GROUP BY 1,2,3
