select 
--from raw orders
o.orederid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice-o.ordercostprice as orders_profit,
--from raw customers
c.customerid,
c.customername,
c.segment,
c.country, 
--from raw product
p.productid,
p.category,
p.productname,
p.subcategory,
{{ markup( 'ordersellingprice', 'ordercostprice' ) }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on  o.customerid=c.customerid
left join {{ ref('raw_product') }} as p
on o.productid=p.productid