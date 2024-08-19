
with

customers as  (

    select * from {{ ref('stg_erp__customers' )}}

),

mart_customers as (

    select
        customer_id,
        company_name,
        contact_name,
        contact_title,
        address,
        city,
        region,
        postal_code,
        country,
        phone,
        fax

    from customers

)

select * from mart_customers
