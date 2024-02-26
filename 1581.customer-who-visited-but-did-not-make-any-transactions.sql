select v.customer_id, count(coalesce(t.transaction_id, 1)) count_no_trans
from visits v 
left join transactions t on v.visit_id = t.visit_id 
where t.transaction_id is null
group by v.customer_id 
order by count_no_trans
