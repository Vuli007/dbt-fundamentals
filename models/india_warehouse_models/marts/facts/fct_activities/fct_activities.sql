{{config(
    materialized ="table"
)}}

with activities as(

    select *,

        {{ convert_utc_to_ist('created_on') }} as created_on_ist,  -- converting utc time to India Standard Time as in the requirement from Rahul
        cast(mx_Custom_3 / 60 % 60 AS float) as duration_of_call -- converting seconds to minutes need clarifications - as float or as int
    
    from {{ ref('stg_activities')}}
    where [activity_event] in (21,22,201,206,207,213)
    and created_on_IST > '2021-08-31 23:59:59'              -- restricted time frame which needs to be clarified
)

Select * from activities
