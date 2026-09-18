with order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

sellers as (
    select * from {{ ref('stg_sellers') }}
),

final as (
    select
        oi.order_id,
        oi.item_id,
        oi.product_id,
        oi.seller_id,
        oi.shipping_limit_at,
        oi.price,
        oi.freight_value,
        p.category_name,
        p.weight_g,
        p.length_cm,
        p.height_cm,
        p.width_cm,
        p.length_cm * p.height_cm * p.width_cm as volume_cm3,
        s.city as seller_city,
        s.state as seller_state
    from order_items oi
    left join products p
        on oi.product_id = p.id
    left join sellers s
        on oi.seller_id = s.id
)

select * from final

