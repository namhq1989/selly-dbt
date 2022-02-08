{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('product_categories_ab3') }}
select
    _id,
    icon,
    {{ adapter.quote('name') }},
    color,
    {{ adapter.quote('order') }},
    active,
    covers,
    featured,
    createdat,
    updatedat,
    totalproduct,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_product_categories_hashid
from {{ ref('product_categories_ab3') }}
-- product_categories from {{ source('unibag', '_airbyte_raw_product_categories') }}
where 1 = 1

