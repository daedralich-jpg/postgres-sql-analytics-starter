
create or replace function app.mark_vip_if_spend_exceeds(p_customer_id int, p_threshold numeric)
returns void
language plpgsql
as $$
declare
  total_spend numeric;
begin
  select coalesce(sum(v.order_total),0) into total_spend
  from app.v_order_totals v
  where v.customer_id = p_customer_id;

  if total_spend >= p_threshold then
    update app.customers set is_vip = true where customer_id = p_customer_id;
  end if;
end;
$$;
