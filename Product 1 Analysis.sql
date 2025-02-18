select * from april_data;

 -- Website traffic :
 ----Calculating uniquevistors on dailylevel and totalregistrations on daily basis:
 
 select VisitDate, count(Distinct VisitorID) AS TotalUniqueVistorsDaily,
 sum(case when status='enrolled' then 1 else 0 end ) as totalregistrations,
  Round((sum(case when status='enrolled' then 1 else 0 end )  / count(Distinct VisitorID))*100,2 )AS conversionrate
 From april_data
 where VisitDate <= '2023-04-14' 
 Group by VisitDate;
 
 --- 
 -- Average time spent on each page:
 -----
 
 select 'Home' as Stage, count(Distinct VisitorID) as totalvisitor , Round(Avg(TimeSpent),2) as Avgeragetimespent
 From april_data
 where visitdate <= '2023-04-14' AND VisitedPages like '%Home%'

Union ALL

 select 'Register Button' as Stage,  count(Distinct VisitorID) as totalvisitor, Round(Avg(TimeSpent),2) as Avgeragetimespent
 From april_data
 where visitdate <= '2023-04-14' AND VisitedPages like '%Register Button%'
 
 Union ALL
 
 select 'PaymentPage' as Stage, count(Distinct VisitorID) as totalvisitor,Round(Avg(TimeSpent),2)as Avgeragetimespent
 From april_data
 where visitdate <= '2023-04-14' AND VisitedPages like '%Payment Page%'
 
 Union ALL 
 
 select 'Payment Success' as Stage, count(Distinct VisitorID) as totalvisitor , Round(Avg(TimeSpent),2)as Avgeragetimespent
 From april_data
 where visitdate <= '2023-04-14' AND VisitedPages like '%Payment Success%';

 