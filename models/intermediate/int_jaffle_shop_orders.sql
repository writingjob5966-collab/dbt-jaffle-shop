select
    order_id,
    customer_id,
    order_date,
    store_id,
    subtotal,
    tax_paid,
    {{ format_decimal('order_total') }} as order_total_formatted
from {{ ref('stg_jaffle_shop__orders') }}