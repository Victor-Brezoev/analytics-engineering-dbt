select 
order_id,
item_id,
price,
freight_value
from {{ ref('stg_order_items')}}
where price < 0
and freight_value < 0