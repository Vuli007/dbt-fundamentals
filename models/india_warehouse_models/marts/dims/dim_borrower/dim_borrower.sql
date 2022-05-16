{{config(
    materialized ='table'
)}}

with borrower as(

    select *,
        case when trust_name = 'Arcil-Retail Loan Portfolio-017-B-Trust (Bank_of_India)' then 'Arcil_BOI'  -- derive field portfolio from field 'trust_name'
        when trust_name = 'Arcil Bajaj Finance - Consumer Loans' then 'Arcil Bajaj-Consumer'
        when trust_name = 'Arcil Bajaj Finance - Personal Loans' then 'Arcil Bajaj-Personal'
        when trust_name = 'Arcil Bajaj Finance - SME Loans' then 'Arcil Bajaj-SME'
        when trust_name like '%Arcil%' AND trust_name like '%LOT 3%' then 'Arcil(Secured Cases)'
        when trust_name like '%South Indian Bank%' then 'South Indian Bank' 
        when trust_name like '%arcil%' then 'Arcil'
        else trust_name end as Portfolio    --check caps

        --check for duplicates for pinstid - throw a flag if any


    from {{ ref('stg_borrower')}}
    where portfolio_name != 'RST'                   -- remove portfolio = RST
    
),

client as (                 -- check like vs contains from excel

    select *,

        case when Portfolio like 'Arcil' then 'Arcil' -- check diff
        when Portfolio like 'Karur' then 'KVB'
        when Portfolio like 'Bank Of Maharashtra' then 'Bank Of Maharashtra' -- check diff
        when Portfolio like 'Omkara-PS 21/2020-21 Trust (Indian Bank - EL)' then 'Omkara-ARC'
        when Portfolio like 'South Indian Bank' then 'South Indian Bank'
        when Portfolio like 'City_Union' then 'CUB' -- check diff
        when Portfolio like 'City_Union' then 'CUB' -- check diff
        when Portfolio like 'Indian' then 'Indian Bank' 
        else Portfolio end as client
    from borrower
),

portfolio_type as (

    select *,
        case when Portfolio like 'Arcil'then 'ARC' 
        when Portfolio like 'Areion' then 'ARC'
        when Portfolio like 'Omkara' then 'ARC'
        when Portfolio like 'Bank Of India' then 'Public Sector Bank'
        when Portfolio like 'Bank Of Maharashtra' then 'Public Sector Bank' 
        when Portfolio like 'City Union Bank' then 'Private Bank' 
        when Portfolio like 'FEDBank Financial Services Limited' then 'NBFC' 
        when Portfolio like 'Flexi Loan & Loan Singh' then 'NBFC' 
        when Portfolio like 'IDBI Bank' then 'Private Bank' 
        when Portfolio like 'Indian Bank' then 'Public Sector Bank' 
        when Portfolio like 'Karur Vysya Bank' then 'Private Bank'
        when Portfolio like 'Karnataka Bank' then 'Private Bank'
        when Portfolio like 'Loan Tap' then 'NBFC'
        when Portfolio like 'MPOWER' then 'NBFC'
        when Portfolio like 'Magma' then 'NBFC'
        when Portfolio like 'Punjab National Bank' then 'Public Sector Bank'
        when Portfolio like 'South Indian Bank' then 'Private Bank'
        when Portfolio like 'Canara Bank' then 'Private Bank'
        when Portfolio like 'UCO Bank' then 'Public Sector Bank'
        when Portfolio like 'Indian Overseas Bank' then 'Public Sector Bank'
        when Portfolio like 'Union Bank Of India' then 'Public Sector Bank'
        when Portfolio like 'Karur Vysysa' then 'Private Bank'
        else 'Others' end as portfolio_type

    from client
)

Select * from portfolio_type
