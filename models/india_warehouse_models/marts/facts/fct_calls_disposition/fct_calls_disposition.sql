{{config(
    materialized ="table"
)}}
-- change this to dim - wait for Rahul
with calls_disposition as(

    select * from {{ ref('stg_calls_disposition')}}
    
)

most_recent as (

    select *

    from calls_disposition as call_1
    where record_id = 

        (	select max(record_id) as record_id                                                -- selecting the most recent record
            from calls_disposition as call_2 where call_1.pinstid = call_2.pinstid 
        )
)

Select * from most_recent
