with orders as(
    select * from {{source ('raw', 'olist_orders_dataset')}}
)

select
    order_id as id,
    customer_id,
    order_status as status,
    order_purchase_timestamp as purchase_timestamp,
    order_approved_at as approved_at,
    order_delivered_carrier_date as delivered_carrier_at,
    order_delivered_customer_date as delivered_customer_at,
    order_estimated_delivery_date as estimated_delivery_at
from orders
