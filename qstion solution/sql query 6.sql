-- Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name as pizza_name,
sum(pizzas.price * orders_details.quantity) as revenue
from pizzas join pizza_types on
pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details on
orders_details.pizza_id = pizzas.pizza_id
group by pizza_name
order by revenue desc limit 3;