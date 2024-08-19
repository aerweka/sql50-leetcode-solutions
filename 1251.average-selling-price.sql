with total_product as (
    select 
        units,
        p.product_id, 
        p.price*us.units as average_prices
    from prices p 
    left join unitssold us on p.product_id = us.product_id 
    where us.purchase_date between p.start_date and 
    p.end_date or units is null
)
select 
    product_id, 
    coalesce(
        round(
            sum(average_prices)/
            sum(units)
        , 2)
    , 0) as average_price 
from total_product 
group by product_id;