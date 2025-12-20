with cte1 as (
select *, max(price) as max_price, min(price) as min_price from inventory 
group by store_id
having Count(store_id)>=3
),

max_price_quant as (
select iv.store_id, iv.product_name as most_exp_product, iv.quantity as most_expensive_quantity, iv.price from inventory as iv
inner join cte1 as c1
on c1.store_id = iv.store_id and c1.max_price = iv.price
),

min_price_quant as (
select iv2.store_id, iv2.product_name as min_exp_product, iv2.quantity as min_expensive_quantity, iv2.price from inventory as iv2
inner join cte1 as c1
on c1.store_id = iv2.store_id and c1.min_price = iv2.price
)

select cte1.store_id,store_name, location, most_exp_product,  min_exp_product as cheapest_product, round((min_expensive_quantity/most_expensive_quantity),2) as imbalance_ratio from cte1

inner join max_price_quant
on cte1.store_id = max_price_quant.store_id

inner join min_price_quant
on cte1.store_id = min_price_quant.store_id

inner join stores 
on cte1.store_id = stores.store_id

where most_expensive_quantity<min_expensive_quantity
order by imbalance_ratio desc, store_name asc