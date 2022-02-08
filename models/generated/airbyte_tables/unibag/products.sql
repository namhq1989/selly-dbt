{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('products_ab3') }}
select
    _id,
    {{ adapter.quote('desc') }},
    info,
    {{ adapter.quote('name') }},
    brand,
    {{ adapter.quote('order') }},
    price,
    score,
    active,
    author,
    guides,
    photos,
    videos,
    quantity,
    createdat,
    documents,
    sharedesc,
    statistic,
    updatedat,
    categories,
    inactiveat,
    properties,
    inventories,
    isoutofstock,
    pricepercent,
    searchstring,
    subcategories,
    inactivereason,
    propertiesmain,
    sharestatistic,
    updateactiveid,
    canissueinvoice,
    pendinginactive,
    reviewstatistic,
    highlightproperties,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_products_hashid
from {{ ref('products_ab3') }}
-- products from {{ source('unibag', '_airbyte_raw_products') }}
where 1 = 1

