with category_translation as(
    select * from {{ source('raw', 'product_category_name_translation') }}
)

select
    product_category_name as id,
    product_category_name_english as category_name_english
from category_translation
