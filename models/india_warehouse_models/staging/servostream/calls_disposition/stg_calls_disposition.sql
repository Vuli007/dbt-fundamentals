Select 

    recordid as record_id,
    pinstid,
    trim(action) as action_code,
    cast(action_date as date) as action_date,
    cast(next_action_date as date) as next_action_date,
    trim(contact_by) as contact_by,
    trim(contact_remarks) as contact_remarks,
    trim(call_status) as call_status

from {{ source('servostream', 'calls_disposition') }}