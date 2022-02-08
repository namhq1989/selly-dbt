{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('referrals_ab3') }}
select
    _id,
    {{ adapter.quote('user') }},
    invitee,
    createdat,
    fromsystem,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_referrals_hashid
from {{ ref('referrals_ab3') }}
-- referrals from {{ source('unibag', '_airbyte_raw_referrals') }}
where 1 = 1

