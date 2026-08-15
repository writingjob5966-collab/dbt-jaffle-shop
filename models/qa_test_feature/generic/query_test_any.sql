SELECT order_id,
       count(*) as total_orders

FROM stg_jaffle_shop__order_items

GROUP BY order_id

HAVING total_orders > 1