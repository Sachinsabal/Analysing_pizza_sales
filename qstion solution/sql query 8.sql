-- Analyze the cumulative revenue generated over time.
select order_date,
sum(revenue) over(order by order_date) as cum_revenue
from
(select orders.order_data as order_date, 
sum(pizzas.price*orders_details.quantity) as revenue
from orders join orders_details on
orders.order_id = orders_details.order_id
join pizzas on
pizzas.pizza_id = orders_details.pizza_id
group by order_date) as sales;
