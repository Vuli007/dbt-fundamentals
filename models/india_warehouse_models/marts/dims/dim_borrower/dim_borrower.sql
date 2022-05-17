{{config(
    materialized ='table'
)}}

with borrower as(

    select *,
        case when trust_name = 'Arcil-Retail Loan portfolio-017-B-Trust (Bank_of_India)' then 'Arcil_BOI'  -- derive field portfolio from field 'trust_name'
        when trust_name = 'Arcil Bajaj Finance - Consumer Loans' then 'Arcil Bajaj-Consumer'
        when trust_name = 'Arcil Bajaj Finance - Personal Loans' then 'Arcil Bajaj-Personal'
        when trust_name = 'Arcil Bajaj Finance - SME Loans' then 'Arcil Bajaj-SME'
        when trust_name like '%Arcil%' AND trust_name like '%LOT 3%' then 'Arcil(Secured Cases)'
        when trust_name like '%South Indian Bank%' then 'South Indian Bank' 
        when trust_name like '%arcil%' then 'Arcil'
        else trust_name end as portfolio   

        --check for duplicates for pinstid - throw a flag if any - reconfirm with Rahul


    from {{ ref('stg_borrower')}}
    where portfolio_name != 'RST'                   -- remove portfolio = RST
    
),

client as (                 

    select *,

        case when portfolio like 'Arcil' then 'Arcil' 
        when portfolio like 'Karur' then 'KVB'
        when portfolio like 'Bank Of Maharashtra' then 'Bank Of Maharashtra' 
        when portfolio like 'Omkara-PS 21/2020-21 Trust (Indian Bank - EL)' then 'Omkara-ARC'
        when portfolio like 'South Indian Bank' then 'South Indian Bank'
        when portfolio like 'City_Union' then 'CUB' 
        when portfolio like 'City_Union' then 'CUB' 
        when portfolio like 'Indian' then 'Indian Bank' 
        else portfolio end as client
    from borrower
),

portfolio_type as (

    select *,
        case when portfolio like 'Arcil'then 'ARC' 
        when portfolio like 'Areion' then 'ARC'
        when portfolio like 'Omkara' then 'ARC'
        when portfolio like 'Bank Of India' then 'Public Sector Bank'
        when portfolio like 'Bank Of Maharashtra' then 'Public Sector Bank' 
        when portfolio like 'City Union Bank' then 'Private Bank' 
        when portfolio like 'FEDBank Financial Services Limited' then 'NBFC' 
        when portfolio like 'Flexi Loan & Loan Singh' then 'NBFC' 
        when portfolio like 'IDBI Bank' then 'Private Bank' 
        when portfolio like 'Indian Bank' then 'Public Sector Bank' 
        when portfolio like 'Karur Vysya Bank' then 'Private Bank'
        when portfolio like 'Karnataka Bank' then 'Private Bank'
        when portfolio like 'Loan Tap' then 'NBFC'
        when portfolio like 'MPOWER' then 'NBFC'
        when portfolio like 'Magma' then 'NBFC'
        when portfolio like 'Punjab National Bank' then 'Public Sector Bank'
        when portfolio like 'South Indian Bank' then 'Private Bank'
        when portfolio like 'Canara Bank' then 'Private Bank'
        when portfolio like 'UCO Bank' then 'Public Sector Bank'
        when portfolio like 'Indian Overseas Bank' then 'Public Sector Bank'
        when portfolio like 'Union Bank Of India' then 'Public Sector Bank'
        when portfolio like 'Karur Vysysa' then 'Private Bank'
        else 'Others' end as portfolio_type

    from client
)

Select * from portfolio_type
