create view inventry_database as
select 
i.product_id,
p.category,
p.product_name,
p.price,
i.date,
i.stock_received,
i.damaged_stock
from 
[dbo].[blinkit_inventory] i
left join [dbo].[blinkit_products] p 
on p.product_id = i.product_id;