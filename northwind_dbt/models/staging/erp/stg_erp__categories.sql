
with stg_categories as (

    select
        -- ids
        category_id, 

        -- strings
        category_name,
        description,
        picture,

        -- timestamps
        cast(current_timestamp as timestamp)  as created_at
    from erp.raw_categories

)

select *
from stg_categories
