select
  c.customer_id,
  c.first_name,
  c.last_name,
  count(o.order_id) as total_orders
from {{ ref('stg_customers') }} c
left join {{ ref('stg_orders') }} o
  on c.customer_id = o.customer_id
where o.status = 'completed'
group by 1, 2, 3