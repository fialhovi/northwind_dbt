
with stg_suppliers as (

    select
        -- ids
        supplier_id,

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
        homepage,

        -- timestamps
        cast(current_timestamp as timestamp)  as created_at
    from erp.raw_suppliers

)

select *
from stg_suppliers
