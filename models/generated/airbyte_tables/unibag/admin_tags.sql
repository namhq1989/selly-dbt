{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('admin_tags_ab3') }}
select
    _id,
    {{ adapter.quote('name') }},
    {{ adapter.quote('type') }},
    color,
    active,
    createdat,
    updatedat,
    searchstring,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_admin_tags_hashid
from {{ ref('admin_tags_ab3') }}
-- admin_tags from {{ source('unibag', '_airbyte_raw_admin_tags') }}
where 1 = 1

