-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name,
sum(orders_details.quantity) as quantity 
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id
join pizza_types on
pizza_types.pizza_type_id = pizzas.pizza_type_id
group by pizza_types.name 
order by quantity limit 5