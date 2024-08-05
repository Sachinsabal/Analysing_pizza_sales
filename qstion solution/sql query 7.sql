-- Calculate the percentage contribution of each pizza type to total revenue.

select pizza_types.category as category, 
round(sum(pizzas.price*orders_details.quantity) / (select round(sum(pizzas.price*orders_details.quantity),2) from orders_details
join pizzas on orders_details.pizza_id = pizzas.pizza_id)*100,2) as revenue
from pizza_types join pizzas on
pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details on
orders_details.pizza_id = pizzas.pizza_id
group by category
order by revenue desc;