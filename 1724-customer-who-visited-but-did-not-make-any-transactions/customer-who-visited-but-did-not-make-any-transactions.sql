# Write your MySQL query statement below
select v.customer_id,count(v.visit_id) as count_no_trans 
from visits v 
left join transactions t 
on v.visit_id=t.visit_id 
where v.visit_id not in(select visit_id from transactions) 
group by v.customer_id;