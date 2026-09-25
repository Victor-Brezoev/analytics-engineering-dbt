with order_items as (
    select * from {{ ref('int_order_items_enriched') }}
),

final as (
    select
        order_id,
        item_id,
        product_id,
        seller_id,
        category_name,
        price,
        freight_value,
        volume_cm3,
        {{ calculate_item_total('price', 'freight_value') }} as item_total_value
        from order_items
)

select * from final