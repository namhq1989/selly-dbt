{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_unibag",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('orders_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_id',
        'code',
        adapter.quote('date'),
        adapter.quote('hour'),
        'note',
        array_to_string('tags'),
        adapter.quote('user'),
        'price',
        boolean_to_string('banned'),
        'reason',
        adapter.quote('source'),
        'status',
        adapter.quote('update'),
        'payment',
        'remarks',
        'customer',
        'delivery',
        'pickupat',
        'supplier',
        'approveat',
        'createdat',
        'inventory',
        boolean_to_string('isdeleted'),
        'promotion',
        'requestid',
        'sendemail',
        'totalitem',
        'updatedat',
        'useragent',
        boolean_to_string('wholesale'),
        'approvedat',
        'cashbackat',
        'codeosiris',
        'membership',
        'rejectedat',
        'deliveredat',
        'deliveringat',
        'deliverycode',
        'searchstring',
        'staffapprove',
        'trackingcode',
        'processstatus',
        'hooktimelastat',
        'trackingcodeurl',
        boolean_to_string('ischangedelivery'),
        'trackingordercode',
        'estimatecashbackat',
        boolean_to_string('iswaitingcancelled'),
        boolean_to_string('fromnewactiveseller'),
    ]) }} as _airbyte_orders_hashid,
    tmp.*
from {{ ref('orders_ab2') }} tmp
-- orders
where 1 = 1

