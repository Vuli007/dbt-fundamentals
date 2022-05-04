{{config(
    materialized ="table"
)}}

with lead_stage_change as(

    select * from {{ ref('stg_lead_stage_changes')}}
    
)

Select * from lead_stage_change
