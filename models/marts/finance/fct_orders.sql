with orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_total as amount
    from orders
)

select * from final