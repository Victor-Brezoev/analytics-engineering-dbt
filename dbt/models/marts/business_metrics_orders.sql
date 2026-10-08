with orders as (
    select * from {{ ref('fct_orders')}}
),

final as (
    select
        order_date,
        count(*) as total_orders,
        sum(total_payment) as total_revenue,
        avg(total_payment) as avg_order_value,
        avg(delivery_days) as average_delivery_days,
        avg(average_review_score) as average_review_score,
        count(
            case
                when delivery_delay_days > 1 then 1
            end
        ) as late_orders,
        count(
                case
                    when delivery_delay_days <= 0 then 1
                end
        ) as orders_not_late
    from orders
    group by order_date
)

select * from final