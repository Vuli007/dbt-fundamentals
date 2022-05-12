{{config(
    materialized ="table"
)}}

with borrower as(

    select *,
        case when trust_name = 'Arcil-Retail Loan Portfolio-017-B-Trust (Bank_of_India)' then 'Arcil_BOI'  -- derive field portfolio from field "trust_name"
        when trust_name = 'Arcil Bajaj Finance - Consumer Loans' then 'Arcil Bajaj-Consumer'
        when trust_name = 'Arcil Bajaj Finance - Personal Loans' then 'Arcil Bajaj-Personal'
        when trust_name = 'Arcil Bajaj Finance - SME Loans' then 'Arcil Bajaj-SME'
        when trust_name like '%Arcil%' AND trust_name like '%LOT 3%' then 'Arcil(Secured Cases)'
        when trust_name like '%South Indian Bank%' then 'South Indian Bank'
        when trust_name like '%arcil%' then 'Arcil'
        else trust_name end as Portfolio

        --check for duplicates for pinstid - throw a flag if any


    from {{ ref('stg_borrower')}}
    where portfolio_name != 'RST'                   -- remove portfolio = RST
    
)

Select * from borrower
