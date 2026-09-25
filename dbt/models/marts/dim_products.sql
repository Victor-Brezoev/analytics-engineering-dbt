with products as ( 
    select * from {{ ref('stg_products') }}
),

final as (
    select
        id,
        category_name,
        name_length,
        description_length,
        photos_qty,
        weight_g,
        length_cm,
        height_cm,
        width_cm
    from products
)

select * from final