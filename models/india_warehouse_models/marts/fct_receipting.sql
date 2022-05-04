{{config(
    materialized ="table"
)}}

with receipting as(

    select * from {{ ref('stg_receipting')}}
)

Select * from receipting
