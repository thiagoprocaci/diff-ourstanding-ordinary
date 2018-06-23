
select * from (
select a.id_user,
		a.count_you_usage as "count",
		a.category,
		'you' as class
	  
from count_you_usage_with_profile_biology_view a

union all 

select a.id_user,
		a.count_we_usage as "count",
		a.category,
		'we' as class
	  
from count_we_usage_with_profile_biology_view a

union all 

select a.id_user,
		a.count_they_usage as "count",
		a.category,
		'they' as class
	  
from count_they_usage_with_profile_biology_view a

union all 

select a.id_user,
		a.count_she_he_usage as "count",
		a.category,
		'she_he' as class
	  
from count_she_he_usage_with_profile_biology_view a

union all 

select a.id_user,
		a.count_i_usage as "count",
		a.category,
		'i' as class
	  
from count_i_usage_with_profile_biology_view a

)B where B.category in ('top_5', 'top_5_10', 'top_10_15')



