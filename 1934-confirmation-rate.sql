-- pgsql
select s.user_id,
case 
    when count(c.action) filter (where c.action = 'confirmed') > 0
    then round((count(c.action) filter (where c.action = 'confirmed'))::decimal / count(c.action), 2)
    else 0
end as confirmation_rate
from signups s 
left join confirmations c on s.user_id = c.user_id 
group by s.user_id;

-- pl/qsl (oracle)
select 
    s.user_id, 
    case when count(c.user_id) > 0 
    then round(
        sum(case when c.action = 'confirmed' then 1 else 0 end)
        /count(c.user_id)
    , 2)
    else 0 end as confirmation_rate 
from signups s 
left join confirmations c on c.user_id = s.user_id
group by s.user_id;