{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('order_histories_ab3') }}
select
    _id,
    {{ adapter.quote('order') }},
    status,
    createdat,
    {{ adapter.quote('timeStamp') }},
    updatedat,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_order_histories_hashid
from {{ ref('order_histories_ab3') }}
-- order_histories from {{ source('unibag', '_airbyte_raw_order_histories') }}
where 1 = 1

