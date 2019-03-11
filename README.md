# Learning in Communities: How Do Outstanding Users Differ From Other Users?

## Summary
This project is part of a scientific research. We are interested in knowing the influence of experts in discussions.
You can find here the analysis of the paper "Learning in Communities: How Do Outstanding Users Differ From Other Users?" published at the 17th IEEE International Conference on Advanced Learning Technologies - ICALT 2018.
In other words, you will find here everything you need to reproduce this research.
First, read the paper and then follow the instructions below.

## Environment
- R version 3.2.2 (available at https://www.r-project.org/)
- PostgresSQL database version 9.5 (available at http://dev.mysql.com/downloads/)
- Ubuntu version 16.04.4 LTS

### Inserting data into PostgresSQL
- Follow the instructions provided here (https://github.com/thiagoprocaci/qa-communities-analysis/tree/postgres-migration/)

### How did you generate the csv files used in R scripts?

We execute several SQL commands in PostgresQL in order to extract the csv contents. Below, find each SQL used.

#### Paper section: More outstanding users were created early

```
with TAB as (
	
select B.class, B.period, sum(B.count) as "count" from (
	select a.*,
			case 
				when a.category not in ('top_5', 'top_5_10', 'top_10_15') then 'ordinary'
				else a.category
			end as class
	
		from when_user_was_created('chemistry.stackexchange.com') a
	)B group by B.class, B.period order by B.period
 ),
 MIN_PERIOD as (
 	select min(t.period) from TAB t
 ),
 PERCENT as (
	 select t.*,
		(t.count *100)/(select  sum(t.count) as total from TAB t 
	where t.class = 'top_5'
	group by t.class ) as perc
	from TAB t where t.class = 'top_5'
	
	union all 
	 
	select t.*,
		(t.count *100)/(select  sum(t.count) as total from TAB t 
	where t.class = 'top_5_10'
	group by t.class ) as perc
	from TAB t where t.class = 'top_5_10'
	
	union all 
	 
	select t.*,
		(t.count *100)/(select  sum(t.count) as total from TAB t 
	where t.class = 'top_10_15'
	group by t.class ) as perc
	from TAB t where t.class = 'top_10_15'
	
	union all 
	
	select t.*,
		(t.count *100)/(select  sum(t.count) as total from TAB t 
	where t.class = 'ordinary'
	group by t.class ) as perc
	from TAB t where t.class = 'ordinary'
 )
 
select  p.class, p.perc ,
'first_period' as desc_
from PERCENT p where p.period in (select * from MIN_PERIOD)

union all

select  p.class, avg(p.perc) ,
'avg_others_periods' as desc_
from PERCENT p where p.period not in (select * from MIN_PERIOD)
group by  p.class
```

### Paper section: First activity

```
select B.id_user,
		B.diff_min,
		B.class
from (

select a.*,

			case 
				when a.category not in ('top_5', 'top_5_10', 'top_10_15') then 'ordinary'
				else a.category
			end as class
from time_to_first_activity('biology.stackexchange.com') a
where a.diff_min >= 0
)B 
```

