{{config(
    materialized ="table"
)}}

with leads as(

    select * from {{ ref('stg_leads')}}
    
)

Select * from leads
