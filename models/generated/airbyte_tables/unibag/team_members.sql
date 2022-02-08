{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('team_members_ab3') }}
select
    _id,
    {{ adapter.quote('role') }},
    team,
    {{ adapter.quote('user') }},
    isleft,
    leftat,
    joinedat,
    rolecode,
    createdat,
    statistic,
    updatedat,
    isremovedby,
    searchstring,
    statisticmonth,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_team_members_hashid
from {{ ref('team_members_ab3') }}
-- team_members from {{ source('unibag', '_airbyte_raw_team_members') }}
where 1 = 1

