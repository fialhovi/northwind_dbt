
with

stg_order_details as (

   select * from {{ ref('stg_erp__order_details') }}

),

calculate_revenue_order_details as (

    select
        order_id,
        product_id,
        sum(unit_price * quantity * (1.0 - discount)) as revenue

    from stg_order_details

    group by 1,2

)

select *
from calculate_revenue_order_details
