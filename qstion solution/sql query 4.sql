-- Identify the most common pizza size ordered.
select quantity, count(order_details_id)
from orders_details
group by quantity;

select pizzas.size, count(orders_details.order_details_id) as order_count
from pizzas join orders_details
on pizzas.pizza_id = orders_details.pizza_id
group by pizzas.size order by order_count desc;