with
    orders as (select * from {{ ref("fct_orders") }}),
    aggregated as (
        select
            order_id,
            order_placed_at,
            amount,
            sum(amount) over (
                partition by date_trunc('month', order_placed_at)
                order by order_placed_at
                rows between unbounded preceding and current row
            ) as cumulative_order_amount_mtd
            from orders
    )
select *
from aggregated
