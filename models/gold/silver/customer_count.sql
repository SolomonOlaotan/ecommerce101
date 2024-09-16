{{
    config(
        materialized= 'table'
    )
}}

SELECT
    COUNT(DISTINCT customer_id) AS Customer_Count
FROM {{
    ref("dim_customer")
}}
