with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

transformed as (

  select

    id as payment_id,
    orderid as order_id,
    created as payment_created_at,
    paymentmethod as payment_method,
    status as payment_status,
    round(amount / 100.0, 2) as payment_amount

  from source

)

select * from transformed