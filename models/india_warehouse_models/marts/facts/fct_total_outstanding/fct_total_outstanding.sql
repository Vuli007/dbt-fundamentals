{{config(
    materialized ="table"
)}}

with total_outstanding as(

    select * from {{ ref('stg_total_outstanding')}}
),

tos as (

    select *,
        closing_balance as total_outstanding -- new column
    from total_outstanding 

Select * from tos
