-- pgsql
select *
from cinema c where (c.id % 2) <> 0 and c.description <> 'boring'
order by rating desc

-- pl/sql (oracle)
select 
    * 
from cinema 
where mod(id,2) > 0 and 
description not like ('%boring%') 
order by rating desc;