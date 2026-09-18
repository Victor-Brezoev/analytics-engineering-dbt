with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select
        order_id,
        count(*) as payment_count,
        sum(payment_value) as total_payment
    from {{ ref('stg_payments') }}
    group by order_id
),

reviews as (
    select
        order_id,
        count(*) as review_count,
        avg(score) as average_review_score
    from {{ ref('stg_reviews') }}
    group by order_id
),

final as (
    select
        o.id as order_id,
        o.customer_id,
        o.status,
        o.purchase_timestamp,
        o.approved_at,
        o.delivered_carrier_at,
        o.delivered_customer_at,
        o.estimated_delivery_at,
        p.payment_count,
        p.total_payment,
        r.review_count,
        r.average_review_score
    from orders o
    left join payments p
        on o.id = p.order_id
    left join reviews r
        on o.id = r.order_id
)

select * from final

