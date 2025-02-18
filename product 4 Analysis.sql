select * from campaign_metrics_june;
select * from campaigns;

--/*Excel and SQL Course :


select c.campaign_id,c.platform,c.course,
SUM(clicks) AS totalclicks,
SUM(impressions) AS totalimpressions,
SUM(budget) as totalbudget,
c.start_date,c.end_date,c.budget,

Round((SUM(clicks) * 100.0 / NULLIF(SUM(impressions), 0)),2) AS ctr, 
Round((SUM(budget) * 100.0 / NULLIF(SUM(clicks), 0)),2) AS cpc,
Round((sum(budget)/NULLIF(SUM(conversions),0)),2) as cpa,
SUM(conversions) as totalconversions,

c.budget * SUM(conversions) AS total_revenue,
    ((c.budget * SUM(conversions)) - SUM(c.budget) ) AS netprofit,
    Round((((c.budget * SUM(conversions)) - SUM(c.budget) ) / SUM(c.budget) ) * 100,2) AS roi

From campaign_metrics_june cmj
inner join campaigns c on cmj.campaign_id=c.campaign_id
where date<='2024-06-18'
Group by campaign_id,c.platform,c.course,c.start_date,c.end_date,c.budget;
 

---- 

 

