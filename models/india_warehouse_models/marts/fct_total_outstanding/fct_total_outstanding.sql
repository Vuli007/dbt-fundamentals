{{config(
    materialized ="table"
)}}

with total_outstanding as(

    select * from {{ ref('stg_total_outstanding')}}
)

Select * from total_outstanding
