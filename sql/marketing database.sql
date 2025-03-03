create view marketing_database as
select mp.*,ml.img
from [dbo].[blinkit_marketing_performance] mp
left join [dbo].[marketing logo] ml
on mp.channel = ml.name;