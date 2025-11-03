
insert into app.customers (email, first_name, last_name, is_vip) values
  ('alice@example.com','Alice','Nguyen', true),
  ('bob@example.com','Bob','Martinez', false),
  ('carol@example.com','Carol','Singh', false),
  ('dan@example.com','Dan','Okafor', true);

insert into app.products (sku, name, category, unit_price) values
  ('SKU-100','Wireless Mouse','Accessories',19.99),
  ('SKU-200','Mechanical Keyboard','Accessories',89.99),
  ('SKU-300','27in Monitor','Displays',219.00),
  ('SKU-400','USB-C Cable','Cables',9.49),
  ('SKU-500','Laptop Stand','Accessories',39.95);

-- Orders
insert into app.orders (customer_id, order_ts, status) values
  (1, now() - interval '10 days','PLACED'),
  (2, now() - interval '9 days','PAID'),
  (1, now() - interval '7 days','PAID'),
  (3, now() - interval '2 days','SHIPPED');

-- Order items
insert into app.order_items (order_id, product_id, quantity, unit_price) values
  (1, 1, 1, 19.99),
  (1, 4, 2, 9.49),
  (2, 2, 1, 89.99),
  (2, 5, 1, 39.95),
  (3, 3, 2, 219.00),
  (4, 1, 1, 19.99),
  (4, 4, 3, 9.49);

-- Payments
insert into app.payments (order_id, amount, method, paid_at) values
  (2, 129.94, 'CARD', now() - interval '9 days'),
  (3, 438.00, 'PAYPAL', now() - interval '7 days');
