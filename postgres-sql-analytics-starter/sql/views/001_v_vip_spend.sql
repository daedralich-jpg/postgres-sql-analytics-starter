
-- Active VIP customers and their total spend
create or replace view app.v_vip_spend as
select c.customer_id, c.email, c.is_vip, coalesce(sum(v.order_total),0) as total_spend
from app.customers c
left join app.v_order_totals v on v.customer_id = c.customer_id
where c.is_vip
group by c.customer_id, c.email, c.is_vip;
