select * from july_data_20230715;
Select * from campaign_metrics_july;

----/*--*/

select cmj.CampaignID,cmj.Variant,cmj.CourseID,sum(cmj.clicks) as totalclicks,sum(cmj.impressions)as totalimpressions,
sum(cmj.conversions) as totalconversions,
Round((sum(cmj.clicks)*100.0/NULLIF(sum(cmj.impressions),0)),2) as ctr,
SUM(cmj.conversions) * 100.0 / NULLIF(SUM(cmj.clicks), 0) AS conversion_rate,
count(distinct jd.visitorid) as totalvisitors,
sum(jd.TimeSpent) totatimespent,
Avg(jd.TimeSpent) averagetimespent
from campaign_metrics_july cmj
left Join july_data_20230715 jd on cmj.CampaignID=jd.CampaignID and cmj.Variant=jd.Variant
where cmj.VisitDate <='2023-07-15'
group by cmj.Variant,cmj.CourseID,cmj.CampaignID
order by totalconversions DESC;


/* Variant B Performs better than A*/
 