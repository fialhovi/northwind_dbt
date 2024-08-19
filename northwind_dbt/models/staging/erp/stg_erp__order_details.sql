
with stg_order_details as (

    select
        -- ids
        order_id,
        product_id,

        -- numerics
        cast(unit_price as float) as unit_price,
        cast(quantity as integer) as quantity,
        cast(discount as float)   as discount,

        -- timestamps
        cast(current_timestamp as timestamp)  as created_at
    from erp.raw_order_details

)

select *
from stg_order_details
