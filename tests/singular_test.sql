select
    id as order_id,
    sum(tax_paid) as total_tax_paid
    
from {{ source('jaffle_shop', 'raw_orders') }}

group by order_id

having total_tax_paid < 0  -- A singular test passes when the query returns zero rows. It only fails when the query returns at least one row. Make it > 0 to make it fail