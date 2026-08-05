with payments as (
    select *
    from {{ source('raw', 'olist_order_payments_dataset') }}
)

select
    order_id,
    payment_sequential as payment_sequence,
    payment_type,
    payment_installments as installments,
    payment_value
from payments