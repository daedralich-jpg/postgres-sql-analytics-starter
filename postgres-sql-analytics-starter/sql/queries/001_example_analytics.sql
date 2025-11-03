
\timing
-- Example analytics: revenue trends, top customers, product performance

-- 1) Revenue by day (using orders with payments)
with paid_orders as (
  select p.order_id, p.amount, o.order_date
  from app.payments p
  join app.orders o on o.order_id = p.order_id
)
select order_date, sum(amount) as daily_revenue
from paid_orders
group by order_date
order by order_date;

-- 2) Top customers by lifetime value
select c.customer_id, c.email, sum(v.order_total) as lifetime_value
from app.customers c
join app.v_order_totals v on v.customer_id = c.customer_id
group by c.customer_id, c.email
order by lifetime_value desc
limit 10;

-- 3) Product performance (units & revenue)
select p.product_id, p.sku, p.name,
       sum(oi.quantity) as units_sold,
       sum(oi.line_total) as revenue
from app.products p
join app.order_items oi on oi.product_id = p.product_id
group by p.product_id, p.sku, p.name
order by revenue desc;
