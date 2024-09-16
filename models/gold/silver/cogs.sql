SELECT
    CAST(SUM(cost) AS int) AS cost_of_goods
FROM 
    {{ ref("dim_products")}}

