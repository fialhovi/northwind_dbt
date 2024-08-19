
with

employees as  (

    select * from {{ ref('stg_erp__employees' )}}

),

mart_employees as (

    select
        employee_id,
        title,
        title_of_courtesy,
        concat(first_name, ' ', last_name) as name,
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
        birth_date,
        hire_date

    from employees

)

select * from mart_employees
