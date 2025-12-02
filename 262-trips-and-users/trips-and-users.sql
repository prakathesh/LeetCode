# Write your MySQL query statement below
select t.request_at as Day,round(sum(case when t.status in('cancelled_by_driver','cancelled_by_client') then 1 else 0 end) /count(*),2) as 'Cancellation Rate' 
from trips t 
join users u on u.users_id=t.client_id and u.banned='No'
join users p on p.users_id=t.driver_id and p.banned='No' 
where t.request_at  between '2013-10-01' and '2013-10-03'
group by t.request_at
order by t.request_at;