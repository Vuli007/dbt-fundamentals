{{config(
    materialized ="table"
)}}

with receipting as(

    select * from {{ ref('stg_receipting')}}
    where Checker_Status = 'Y'
)

Select * from receipting
