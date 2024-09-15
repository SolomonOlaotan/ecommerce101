SELECT
    id AS center_id,
    name AS center_name,
    latitude,
    longitude
FROM 
    {{ ref("stg_distribution_centers")}}

