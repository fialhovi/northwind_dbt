
with stg_orders as (

    select
        -- ids
        order_id,
        customer_id,
        employee_id,

        -- strings
        ship_via,
        ship_name,
        ship_address,
        ship_city,
        ship_region,
        ship_postal_code,
        ship_country,

        -- numerics
        cast(freight as float) as freight,

        -- dates
        cast(order_date as date)    as order_date,
        cast(required_date as date) as required_date,
        cast(shipped_date as date)  as shipped_date,

        -- timestamps
        cast(current_timestamp as timestamp)  as created_at
    from erp.raw_orders

)

select *
from stg_orders
