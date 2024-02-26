select e2.name::text from employee e1 join employee e2 on e1.managerId = e2.id group by e2.name, e2.id having count(e2.id) >= 5
