with
    customer as (select * from {{ ref("dim_customer") }}),
    aggregated as (
        select sum(number_of_orders) as large_orders from customer where number_of_orders>3
    )
select *
from aggregated