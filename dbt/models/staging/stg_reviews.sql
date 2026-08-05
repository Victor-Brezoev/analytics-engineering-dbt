with reviews as(
    select * from {{ source('raw', 'olist_order_reviews_dataset') }}
)

select
    review_id as id,
    order_id,
    review_score as score,
    review_comment_title as comment_title,
    review_comment_message as comment_message,
    review_creation_date as created_at,
    review_answer_timestamp as answered_at
from reviews
