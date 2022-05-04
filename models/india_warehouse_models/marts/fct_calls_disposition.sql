{{config(
    materialized ="table"
)}}

with calls_disposition as(

    select * from {{ ref('stg_calls_disposition')}}
    
)

Select * from calls_disposition
