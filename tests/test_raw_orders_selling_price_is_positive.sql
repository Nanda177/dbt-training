with orders as( 
    select * from {{ ref('raw_orders') }}
)

select orederid,
    sum(ordersellingprice) as total 
    from orders 
    group by orederid
    having total<0