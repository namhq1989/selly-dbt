{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_unibag",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('suppliers_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_id',
        'tax',
        'bank',
        adapter.quote('name'),
        boolean_to_string('active'),
        'checksum',
        'checksum_1',
        adapter.quote('location'),
        'createdat',
        array_to_string('documents'),
        'updatedat',
        'identifycode',
        'searchstring',
        'contractnumber',
        'contractsignedat',
        array_to_string('emailforinvoices'),
        'contractexpiredat',
        boolean_to_string('sendinvoicerequesteveryday'),
    ]) }} as _airbyte_suppliers_hashid,
    tmp.*
from {{ ref('suppliers_ab2') }} tmp
-- suppliers
where 1 = 1

