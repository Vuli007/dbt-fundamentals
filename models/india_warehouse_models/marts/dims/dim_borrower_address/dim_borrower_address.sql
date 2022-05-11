{{config(
    materialized ="table"
)}}

with borrower_address as(

    select * from {{ ref('stg_borrower_address')}}
    where type_of_address = 'Applicant' and kind_of_address = 'Mailing Address'  -- select only rows with Type_Of_Address = Applicant and Kind_Of_Address = Mailing Address

),

latest_record_id as (
    select *
    from borrower_address as borrower_1
    where record_id = 
        (	select max(record_id) as record_id                                                -- selecting the max record per pinstid
            from borrower_address as borrower_2 where borrower_1.pinstid = borrower_2.pinstid 
        )
)

Select * from latest_record_id
