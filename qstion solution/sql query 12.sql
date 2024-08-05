-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category as category,
 sum(orders_details.quantity) as total_quantity from orders_details
join pizzas on
orders_details.pizza_id = pizzas.pizza_id
join pizza_types on
pizza_types.pizza_type_id = pizzas.pizza_type_id
group by category 
order by total_quantity desc;