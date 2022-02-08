{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('order_items_ab3') }}
select
    _id,
    sku,
    {{ adapter.quote('date') }},
    {{ adapter.quote('user') }},
    {{ adapter.quote('order') }},
    price,
    status,
    product,
    customer,
    quantity,
    createdat,
    totalsell,
    updatedat,
    totalprice,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_order_items_hashid
from {{ ref('order_items_ab3') }}
-- order_items from {{ source('unibag', '_airbyte_raw_order_items') }}
where 1 = 1

