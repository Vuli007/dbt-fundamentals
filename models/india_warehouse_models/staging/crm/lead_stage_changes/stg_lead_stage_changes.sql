Select 

    leadstagechangeid as lead_stage_change_id,
    leadid as lead_id,
    leadname as lead_name,
    oldvalue as old_value,
    newvalue as new_value,
    trim(comment) as comment,
    trim(createdby) as created_by,
    trim(createdbyname) as created_by_name,
    cast(createdon as date) as created_on

from {{ source('crm', 'lead_stage_change') }}

