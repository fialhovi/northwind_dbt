
with

orders as  (

    select * from {{ ref('stg_erp__orders' )}}

),

order_details as (

    select * from {{ ref('int_calculate_revenue_order_details') }}

),

orders_and_order_details_joined as (

    select
        ode.order_id,
        ode.product_id,
        ord.customer_id,
        ord.employee_id,
        ord.order_date,
        ode.revenue,
        ord.ship_via,
        ord.ship_name,
        ord.ship_address,
        ord.ship_city,
        ord.ship_region,
        ord.ship_postal_code,
        ord.ship_country,
        ord.freight

    from order_details ode

    left join orders ord on ode.order_id = ord.order_id

)

select * from orders_and_order_details_joined
