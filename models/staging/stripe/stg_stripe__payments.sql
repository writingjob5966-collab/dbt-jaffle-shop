select
    id as payment_id,
    order_id,
    payment_method,
    amount  -- amount is in cents
from {{ ref('raw_payments') }}