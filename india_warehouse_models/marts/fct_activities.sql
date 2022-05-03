{{config(
    materialized ="table"
)}}

with activities as(

    select * from {{ ref('stg_activities')}}
)

Select * from activities
