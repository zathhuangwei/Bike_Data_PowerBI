#COGS = cost of goods

with t1 as
(
select *
from bike_share_yr_0
UNION
select *
from bike_share_yr_1
)
select dteday, season, t.yr, weekday, hr, rider_type, riders, price, COGS, round(riders * price, 2) as revenue, round((riders * price) - COGS, 2) as profit
from t1 as t
left join cost_table as c
on t.yr = c.yr
;