with order_items as(
    select * from {{ source('raw', 'olist_order_items_dataset') }}
)

select
    order_id,
    order_item_id as item_id,
    product_id,
    seller_id,
    shipping_limit_date as shipping_limit_at,
    price,
    freight_value
from order_items