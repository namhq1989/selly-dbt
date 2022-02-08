{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('users_ab3') }}
select
    _id,
    code,
    info,
    {{ adapter.quote('name') }},
    team,
    phone,
    avatar,
    banned,
    segment,
    hasorder,
    referral,
    segments,
    createdat,
    statistic,
    updatedat,
    membership,
    registerfrom,
    searchstring,
    isupdatedinfo,
    identification,
    lastactivatedat,
    lastviewnotificationat,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_users_hashid
from {{ ref('users_ab3') }}
-- users from {{ source('unibag', '_airbyte_raw_users') }}
where 1 = 1

