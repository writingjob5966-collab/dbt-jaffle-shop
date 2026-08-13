select
    id as order_id,
    customer as customer_id,
    ordered_at as order_date,
    store_id,
    subtotal,
    tax_paid,
    order_total
from {{ source('jaffle_shop', 'raw_orders') }}