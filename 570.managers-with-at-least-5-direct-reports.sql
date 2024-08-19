select 
    e2.name 
from employee e1 
join employee e2 on e1.managerId = e2.id 
group by e2.name, e2.id having count(e2.id) >= 5;

select 
    e.name 
from employee e 
where (
    select count(e2.id) 
    from employee e2 
    where e2.managerId = e.id
) >= 5;