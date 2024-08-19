select s.student_id,
       s.student_name,
       ss.subject_name,
       (
	       select count(*)
	         from examinations e
	        where ss.subject_name = e.subject_name
	          and s.student_id = e.student_id
       ) attended_exams
  from students s,
       subjects ss
 order by 1,
          3;

select s.student_id,
       s.student_name,
       sbj.subject_name,
       count(ex.subject_name) as attended_exams
  from students s
 cross join subjects sbj
  left join examinations ex
on ex.student_id = s.student_id
   and ex.subject_name = sbj.subject_name
 group by s.student_id,
          s.student_name,
          sbj.subject_name
 order by s.student_id,
          sbj.subject_name;

-- Both queries are correct, but the second one is more readable and maintainable because it uses explicit joins and grouping to achieve the same result.
-- Both query are using cross join to generate all possible combinations of students and subjects. 