select
    id,
    name,
    cost,
    perishable,
    sku
    
from {{ source('jaffle_shop', 'raw_supplies') }}