
-- Create schema
create schema if not exists app;

-- Customers
create table if not exists app.customers (
  customer_id serial primary key,
  email text not null unique,
  first_name text not null,
  last_name text not null,
  created_at timestamptz not null default now(),
  is_vip boolean not null default false,
  constraint chk_email check (position('@' in email) > 1)
);

-- Products
create table if not exists app.products (
  product_id serial primary key,
  sku text not null unique,
  name text not null,
  category text not null,
  unit_price numeric(12,2) not null check (unit_price >= 0),
  active boolean not null default true
);

-- Orders
create table if not exists app.orders (
  order_id serial primary key,
  customer_id int not null references app.customers(customer_id),
  order_ts timestamptz not null default now(),
  status text not null check (status in ('PLACED','PAID','SHIPPED','CANCELLED')),
  -- generated column for order date (UTC date)
  order_date date generated always as (date(order_ts)) stored
);

-- Order items
create table if not exists app.order_items (
  order_item_id serial primary key,
  order_id int not null references app.orders(order_id) on delete cascade,
  product_id int not null references app.products(product_id),
  quantity int not null check (quantity > 0),
  unit_price numeric(12,2) not null check (unit_price >= 0),
  line_total numeric(14,2) generated always as (quantity * unit_price) stored
);

-- Payments
create table if not exists app.payments (
  payment_id serial primary key,
  order_id int not null references app.orders(order_id) on delete cascade,
  amount numeric(14,2) not null check (amount >= 0),
  method text not null check (method in ('CARD','PAYPAL','WIRE','CASH')),
  paid_at timestamptz not null default now()
);

-- Indexes
create index if not exists idx_orders_customer_id on app.orders(customer_id);
create index if not exists idx_order_items_order_id on app.order_items(order_id);
create index if not exists idx_products_category on app.products(category);
create index if not exists idx_customers_created_at on app.customers(created_at);

-- Views
create or replace view app.v_order_totals as
select
  o.order_id,
  o.customer_id,
  sum(oi.line_total)::numeric(14,2) as order_total
from app.orders o
join app.order_items oi on oi.order_id = o.order_id
group by o.order_id, o.customer_id;
