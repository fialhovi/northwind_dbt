
with stg_employees as (

    select
        -- ids
        employee_id,

        -- strings
        title,
        title_of_courtesy,
        first_name,
        last_name,
        address,
        city,
        region,
        postal_code,
        country,
        home_phone,
        extension,
        photo,
        notes,
        reports_to,
        photo_path,

        -- dates
        cast(birth_date as date) as birth_date,
        cast(hire_date as date)  as hire_date,            

        -- timestamps
        cast(current_timestamp as timestamp)  as created_at
    from erp.raw_employees

)

select *
from stg_employees
