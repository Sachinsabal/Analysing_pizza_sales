select round(avg(quantity),0) as avg_pizza_order_per_day from
(select orders.order_data as order_date,
sum(orders_details.quantity) as quantity from orders
join orders_details on
orders.order_id = orders_details.order_id
group by order_date) AS order_quantity;