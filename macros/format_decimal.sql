{% macro format_decimal(column_name) %}
    cast({{ column_name }} as numeric(10, 2))
{% endmacro %}