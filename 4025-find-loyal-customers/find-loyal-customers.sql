# Write your MySQL query statement below
select distinct(customer_id)
from customer_transactions
group by customer_id 
having datediff(max(transaction_date),min(transaction_date))>29 
and count(transaction_type='purchase')>2 
and sum(transaction_type='refund')/count(transaction_type) < 0.2
order by customer_id;