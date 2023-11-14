select 
customerid,
country,
segment,
sum(orders_profit) as profit 
from {{ ref('stg_orders') }}
group by customerid,
country,segment