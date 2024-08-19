
with stg_customers as (

    select
        -- ids
        customer_id,

        -- strings
        company_name,
        contact_name,
        contact_title,
        address,
        city,
        region,
        postal_code,
        country,
        phone,
        fax,

        -- timestamps
        cast(current_timestamp as timestamp)  as created_at
    from erp.raw_customers

)

select *
from stg_customers
