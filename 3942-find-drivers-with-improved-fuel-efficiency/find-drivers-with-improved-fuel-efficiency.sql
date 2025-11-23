# Write your MySQL query statement below
with temp as(select driver_id,avg(case when month(trip_date) between 1 and 6 then distance_km/fuel_consumed end )as first_half_avg,avg(case when month(trip_date)between 7 and 12 then distance_km/fuel_consumed  end)as second_half_avg from trips group by driver_id)
select d.driver_id,d.driver_name,round(te.first_half_avg,2) as first_half_avg,round(te.second_half_avg,2 )as second_half_avg,round(second_half_avg-first_half_avg,2) as efficiency_improvement  from temp te left join drivers d on te.driver_id=d.driver_id WHERE te.first_half_avg IS NOT NULL
AND te.second_half_avg IS NOT NULL
AND (te.second_half_avg - te.first_half_avg) > 0
ORDER BY efficiency_improvement DESC, d.driver_name