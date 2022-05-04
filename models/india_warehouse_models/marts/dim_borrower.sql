{{config(
    materialized ="table"
)}}

with borrower as(

    select * from {{ ref('stg_borrower')}}
    where portfolio_name <> 'RST'                   -- remove portfolio = RST
)

Select * from borrower
