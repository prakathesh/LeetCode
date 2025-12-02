with q1 as (
select id, id - row_number() over() as id_diff
from stadium
where people > 99
),
q2 as (
select *, row_number() over(partition by id_diff) as id_diff_order
from q1
),
q3 as (
select id
from q2
where id_diff in (select id_diff from q2 where id_diff_order > 2 group by id_diff)
)
select *
from stadium
where id in (select id from q3)
order by visit_date