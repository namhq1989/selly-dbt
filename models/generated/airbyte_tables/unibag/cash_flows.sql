{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('cash_flows_ab3') }}
select
    _id,
    {{ adapter.quote('user') }},
    {{ adapter.quote('value') }},
    {{ adapter.quote('action') }},
    {{ adapter.quote('options') }},
    category,
    targetid,
    createdat,
    updatedat,
    newbalance,
    oldbalance,
    targettype,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_cash_flows_hashid
from {{ ref('cash_flows_ab3') }}
-- cash_flows from {{ source('unibag', '_airbyte_raw_cash_flows') }}
where 1 = 1

