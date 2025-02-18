Product 3 Ananlysis for SB4 course:

Select * from may_data;

--

SELECT 
   VisitDate AS VisitDate,
    COUNT(DISTINCT VisitorID) AS UniqueVisitors,
	sum(case when status='enrolled' then 1 else 0 end ) as totalregistrations,
	Round((sum(case when status='enrolled' then 1 else 0 end )  / count(Distinct VisitorID))*100,2 )AS converionrate
    FROM 
    (
	   SELECT VisitorID, VisitDate, status FROM april_data
       UNION ALL
	   SELECT VisitorID, VisitDate,status FROM may_data
	) AS combined_data
where VisitDate between '2023-05-22' AND '2023-05-31'
GROUP BY VisitDate 
ORDER BY VisitDate;
    
--------- 
SELECT 
    Stage,
    COUNT(DISTINCT VisitorID) AS totalvisitor,
    ROUND(AVG(TimeSpent), 2) AS Averagetimespent
FROM (
    SELECT 
        'Home' AS Stage,
        VisitorID,
        TimeSpent
    FROM may_data
    WHERE visitdate BETWEEN '2023-05-22' AND '2023-05-31' AND VisitedPages LIKE '%Home%'

    UNION ALL 
    
     SELECT 
        'Courses' AS Stage,
        VisitorID,
        TimeSpent
    FROM may_data
    WHERE visitdate BETWEEN '2023-05-22' AND '2023-05-31' AND VisitedPages LIKE '%Courses%' 
    
    UNION ALL 
    
     SELECT 
        'Courses details' AS Stage,
        VisitorID,
        TimeSpent
    FROM may_data
    WHERE visitdate BETWEEN '2023-05-22' AND '2023-05-31' AND VisitedPages LIKE '%Course Details%'
    
    UNION ALL 

    SELECT 
        'Register Button' AS Stage,
        VisitorID,
        TimeSpent
    FROM may_data
    WHERE visitdate BETWEEN '2023-05-22' AND '2023-05-31' AND VisitedPages LIKE '%Register Button%'
    
    UNION ALL

    SELECT 
        'Payment Page' AS Stage,
        VisitorID,
        TimeSpent
    FROM may_data
    WHERE visitdate BETWEEN '2023-05-22' AND '2023-05-31' AND VisitedPages LIKE '%Payment Page%'
    
    UNION ALL 

    SELECT 
        'Payment Success' AS Stage,
        VisitorID,
        TimeSpent
    FROM may_data
    WHERE visitdate BETWEEN '2023-05-22' AND '2023-05-31' AND VisitedPages LIKE '%Payment Success%'
) AS subquery
GROUP BY Stage
order by Stage;