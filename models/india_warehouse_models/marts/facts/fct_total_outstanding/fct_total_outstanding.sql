{{config(
    materialized ="table"
)}}

with total_outstanding as(

    select * from {{ ref('stg_total_outstanding')}}
),

most_recent as (

    select *
    from total_outstanding as tos_1
    where calculated_date = 

        (	select max(calculated_date) as calculated_date                                                -- selecting the most recent pinstid
            from total_outstanding as tos_2 where tos_1.pinstid = tos_2.pinstid 
        )
)

Select * from most_recent
