{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key='order_id'
    )
}}

-- Get the latest order_date from the existing table
{% if is_incremental() %}
    {% if execute %}
        {% set max_date_query %}
            select max(order_date) from {{ this }}
        {% endset %}
        {% set max_date = run_query(max_date_query).columns[0].values()[0] %}
    {% else %}
        {% set max_date = '1900-01-01' %}
    {% endif %}
{% endif %}

with orders as (
    select
        order_id,
        customer_id,
        order_date,
        order_total_formatted as amount
    from {{ ref('int_jaffle_shop_orders') }}

    {% if is_incremental() %}
        where order_date > '{{ max_date }}'
    {% endif %}
)

select * from orders