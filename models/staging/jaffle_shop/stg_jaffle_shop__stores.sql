select
    id,
    name,
    opened_at,
    tax_rate
    
from {{ source('jaffle_shop', 'raw_stores') }}