SELECT
    id as event_id,
    user_id as customer_id,
    sequence_number,
    DATE(created_at) AS event_date,
    city,
    state,
    postal_code,
    browser,
    traffic_source AS ad_channel,
    event_type
FROM 
    {{ ref("stg_events")}}
WHERE user_id IS NOT NULL