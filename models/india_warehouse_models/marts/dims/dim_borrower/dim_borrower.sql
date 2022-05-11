{{config(
    materialized ="table"
)}}

with borrower as(

    select *,
        trust_name as portfolio_name                -- derive field portfolio from field "trust_name"

    from {{ ref('stg_borrower')}}
    where portfolio_name != 'RST'                   -- remove portfolio = RST
    
)

Select * from borrower
