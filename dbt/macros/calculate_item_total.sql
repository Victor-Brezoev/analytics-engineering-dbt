{% macro calculate_item_total(price, freight_value) %}

    {{price}} + {{freight_value}}

{% endmacro %}