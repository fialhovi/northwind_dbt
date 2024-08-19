
with

products as  (

    select * from {{ ref('stg_erp__products' )}}

),

categories as (

    select * from {{ ref('stg_erp__categories') }}

),

suppliers as (

    select * from {{ ref('stg_erp__suppliers') }}

),

products_and_categories_joined as (

    select
        prd.product_id,
        prd.supplier_id,
        prd.category_id,
        prd.product_name,
        cat.category_name,
        cat.description,
        prd.quantity_per_unit,
        prd.unit_price,
        prd.units_in_stock,
        prd.units_on_order,
        prd.reorder_level,
        prd.is_discontinued
        
    from products prd

    left join categories cat on prd.category_id = cat.category_id

),

products_and_categories_and_suppliers_joined as (

    select
        pac.product_id,
        pac.supplier_id,
        pac.category_id,
        pac.product_name,
        pac.category_name,
        pac.description,
        pac.quantity_per_unit,
        pac.unit_price,
        pac.units_in_stock,
        pac.units_on_order,
        pac.reorder_level,
        pac.is_discontinued,
        sup.company_name  as supply_company_name,
        sup.contact_name  as supply_contact,
        sup.contact_title as supply_contact_title,
        sup.address       as supply_adress,
        sup.city          as supply_city,
        sup.region        as supply_region,
        sup.postal_code   as supply_postal_code,
        sup.country       as supply_country,
        sup.phone         as supply_phone,
        sup.fax           as supply_fax
        
    from products_and_categories_joined pac

    left join suppliers sup on pac.supplier_id = sup.supplier_id

)


select * from products_and_categories_and_suppliers_joined
