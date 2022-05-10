{{config(
    materialized ="table"
)}}

with activities as(

    select * from {{ ref('stg_activities')}}
    where [ActivityEvent] in (21,22,201,206,207,213)
)

Select * from activities
