{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('product_sub_categories_ab3') }}
select
    _id,
    {{ adapter.quote('name') }},
    {{ adapter.quote('order') }},
    active,
    parent,
    createdat,
    updatedat,
    searchstring,
    totalproduct,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_product_sub_categories_hashid
from {{ ref('product_sub_categories_ab3') }}
-- product_sub_categories from {{ source('unibag', '_airbyte_raw_product_sub_categories') }}
where 1 = 1

