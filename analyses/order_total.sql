with
    customer as (select * from {{ ref("dim_customer") }}),
    aggregated as (
        select sum(number_of_orders) as number_of_orders from customer
    )
select *
from aggregated