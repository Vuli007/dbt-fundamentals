{{config(
    materialized ="table"
)}}

with activities as(

    select * from {{ ref('stg_activities')}}
    where [ActivityEvent] in (21,22,201,206,207,213)
    and created_on_IST > '2021-08-31 23:59:59'              -- restricted time frame which needs to be clarified
)

Select * from activities
