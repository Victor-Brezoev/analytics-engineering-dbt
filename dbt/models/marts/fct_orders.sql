with orders as (

    select *
    from {{ ref('int_orders_enriched') }}

),

final as (

    select
        order_id,
        customer_id,
        status,
        average_review_score,
        total_payment,
        review_count,

        date_diff(
            'day',
            purchase_timestamp,
            delivered_customer_at
        ) as delivery_days,

        date_diff(
            'day',
            estimated_delivery_at,
            delivered_customer_at
        ) as delivery_delay_days

    from orders

)

select * from final