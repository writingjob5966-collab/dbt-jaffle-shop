select
    id,
    order_id,
    sku
    
from {{ source('jaffle_shop', 'raw_order_items') }}