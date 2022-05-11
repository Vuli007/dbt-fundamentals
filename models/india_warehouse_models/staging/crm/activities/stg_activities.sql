 Select 
        prospectactivityid as prospect_activity_id,
        prospectactivityautoid as prospect_activity_auto_id,
        prospectid as prospect_id,
        trim(prospectname) as prospect_name,
        activitystatus as activity_status,
        activityevent as activity_event,
        trim(activityeventname) as activity_event_name,
        trim(activityeventnote) as activity_event_note,
        timespent as time_spent,
        workflowstatus as workflow_status,
        {{ convert_utc_to_ist('createdon') }} as created_on_ist,  -- converting utc time to India Standard Time as in the requirement from Rahul
        createdby as created_by,
        trim(createdbyname) as created_by_name,
        mx_custom_1,
        mx_custom_2,
        mx_custom_3,
        mx_custom_4,
        mx_custom_5,
        mx_custom_6,
        mx_custom_7,
        mx_custom_8,
        mx_custom_9,
        mx_custom_10,
        mx_custom_11,
        mx_custom_12,
        mx_custom_13,
        mx_custom_14,
        mx_custom_15,
        cast(mx_Custom_3 / 60 % 60 AS float) duration_of_call, -- converting seconds to minutes need clarifications - as float or as int
        trim(status) as status

    from {{ source('crm', 'activities') }}

