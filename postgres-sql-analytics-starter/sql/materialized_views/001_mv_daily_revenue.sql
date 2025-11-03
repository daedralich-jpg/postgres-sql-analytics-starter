
-- Example materialized view for daily revenue
drop materialized view if exists app.mv_daily_revenue;
create materialized view app.mv_daily_revenue as
select o.order_date, sum(oi.line_total) as gross_revenue
from app.orders o
join app.order_items oi on oi.order_id = o.order_id
group by o.order_date
with data;

create index if not exists idx_mv_daily_revenue_date on app.mv_daily_revenue(order_date);

-- To refresh:
-- refresh materialized view concurrently app.mv_daily_revenue;
