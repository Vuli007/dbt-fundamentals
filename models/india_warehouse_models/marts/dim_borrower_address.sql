{{config(
    materialized ="table"
)}}

with borrower_address as(

    select * from {{ ref('stg_borrower_address')}}
    where 	Type_Of_Address = 'Applicant' and Kind_Of_Address = 'Mailing Address'  -- select only rows with Type_Of_Address = Applicant and Kind_Of_Address = Mailing Address

)

Select * from borrower_address
