select w.id
  from weather w
  join weather w2
on w.id = w2.id
 where w.recorddate = w2.recorddate + 1
and w2.temperature > w.temperature;