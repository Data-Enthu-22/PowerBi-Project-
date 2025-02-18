select * from course_price;
select * from may_data;

select cp.Course,
Sum(Price) as totalrevenue,
Count(Distinct VisitorID) as totalsales
From may_data md
inner join course_price cp on md.CourseID=cp.Course
where VisitDate <='2023-05-31' AND status='Enrolled'
group by cp.Course;