
with stg_products as (

    select
        -- ids
        product_id,
        supplier_id,
        category_id,

        -- strings
        product_name,
        quantity_per_unit,
        discontinued,

        -- numerics
        cast(unit_price as float)       as unit_price,
        cast(units_in_stock as integer) as units_in_stock,
        cast(units_on_order as integer) as units_on_order,
        cast(reorder_level as integer)  as reorder_level,

        -- booleans
        case
            when discontinued = '1' then true
            else false
        end as is_discontinued,

        -- timestamps
        cast(current_timestamp as timestamp)  as created_at
    from erp.raw_products

)

select *
from stg_products
