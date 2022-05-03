with

source as(

    Select * from {{ source('jaffle_shop', 'orders') }}

),

orders as (
      select 
        id as order_id,
        user_id as customer_id,
        order_date,
        status as order_status,

        case 
        when status NOT IN ('returned','return_pending') 
        then order_date 
        end as valid_order_date,

        row_number() over (
            partition by user_id 
            order by order_date, id
            ) as user_order_seq
        
      from source
 )

 Select * from orders