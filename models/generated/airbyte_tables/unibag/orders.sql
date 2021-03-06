{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('orders_ab3') }}
select
    _id,
    code,
    {{ adapter.quote('date') }},
    {{ adapter.quote('hour') }},
    note,
    tags,
    {{ adapter.quote('user') }},
    price,
    banned,
    reason,
    {{ adapter.quote('source') }},
    status,
    {{ adapter.quote('update') }},
    payment,
    remarks,
    customer,
    delivery,
    pickupat,
    supplier,
    approveat,
    createdat,
    inventory,
    isdeleted,
    promotion,
    requestid,
    sendemail,
    totalitem,
    updatedat,
    useragent,
    wholesale,
    approvedat,
    cashbackat,
    codeosiris,
    membership,
    rejectedat,
    deliveredat,
    deliveringat,
    deliverycode,
    searchstring,
    staffapprove,
    trackingcode,
    processstatus,
    hooktimelastat,
    trackingcodeurl,
    ischangedelivery,
    trackingordercode,
    estimatecashbackat,
    iswaitingcancelled,
    fromnewactiveseller,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_orders_hashid
from {{ ref('orders_ab3') }}
-- orders from {{ source('unibag', '_airbyte_raw_orders') }}
where 1 = 1

