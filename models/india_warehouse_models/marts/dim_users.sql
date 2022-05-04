{{config(
    materialized ="table"
)}}

with users as(

    select * from {{ ref('stg_users')}}
    
)

Select * from users
