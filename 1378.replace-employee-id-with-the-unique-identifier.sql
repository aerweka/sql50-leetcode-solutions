select eu.unique_id,
       e.name
  from employees e
  left join employeeuni eu
on eu.id = e.id;