-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name, revenue from
(select category, name, revenue,
rank() over(partition by category order by revenue desc) as rnk
from
(select pizza_types.category, pizza_types.name,
sum(orders_details.quantity*pizzas.price) as revenue
from pizza_types join  pizzas on
pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details on
orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as b) as c
where rnk<=3;