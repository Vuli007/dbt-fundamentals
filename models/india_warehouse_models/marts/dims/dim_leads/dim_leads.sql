{{config(
    materialized ="table"
)}}

with leads as(

    select * 
    
    from {{ ref('stg_leads')}}
    where mx_case_ids != null 
    and mx_trust_name_Bank_Name = 'RST'  -- Filters out null mx_case_ids and mx_trust_name_Bank_Name=RST
    
)

Select * from leads
