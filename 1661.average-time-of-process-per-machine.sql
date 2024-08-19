with aggregated as (
    select machine_id,
           process_id,
           max(timestamp) - min(timestamp) as processing_time
      from activity
     group by machine_id,
              process_id
)
select machine_id,
       round(
           avg(processing_time),
           3
       ) as processing_time
  from aggregated
 group by machine_id
 order by machine_id;