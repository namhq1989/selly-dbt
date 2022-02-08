{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('product_sku_ab3') }}
select
    _id,
    sku,
    info,
    {{ adapter.quote('name') }},
    {{ adapter.quote('type') }},
    brand,
    cover,
    price,
    active,
    author,
    {{ adapter.quote('source') }},
    display,
    picture,
    product,
    {{ adapter.quote('version') }},
    groupsku,
    quantity,
    unitcode,
    createdat,
    statistic,
    updatedat,
    properties,
    suppliersku,
    isoutofstock,
    pricepercent,
    searchstring,
    updateactiveid,
    displayinventory,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_product_sku_hashid
from {{ ref('product_sku_ab3') }}
-- product_sku from {{ source('unibag', '_airbyte_raw_product_sku') }}
where 1 = 1

