{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_unibag",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('order_items_ab1') }}
select
    cast(_id as {{ dbt_utils.type_string() }}) as _id,
    cast(sku as {{ dbt_utils.type_string() }}) as sku,
    cast({{ adapter.quote('date') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('date') }},
    cast({{ adapter.quote('user') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('user') }},
    cast({{ adapter.quote('order') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('order') }},
    cast(price as {{ dbt_utils.type_string() }}) as price,
    cast(status as {{ dbt_utils.type_string() }}) as status,
    cast(product as {{ dbt_utils.type_string() }}) as product,
    cast(customer as {{ dbt_utils.type_string() }}) as customer,
    cast(quantity as {{ dbt_utils.type_float() }}) as quantity,
    cast(createdat as {{ dbt_utils.type_string() }}) as createdat,
    cast(totalsell as {{ dbt_utils.type_float() }}) as totalsell,
    cast(updatedat as {{ dbt_utils.type_string() }}) as updatedat,
    cast(totalprice as {{ dbt_utils.type_float() }}) as totalprice,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('order_items_ab1') }}
-- order_items
where 1 = 1

