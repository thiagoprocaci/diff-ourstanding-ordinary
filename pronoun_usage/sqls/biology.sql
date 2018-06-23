


select a.*,
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then a.category
	  	else 'ordinary'
	  end as class,
	  
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then 'outstanding'
	  	else 'ordinary'
	  end as class2

from count_i_usage_with_profile_biology_view a;

select a.*,
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then a.category
	  	else 'ordinary'
	  end as class,
	  
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then 'outstanding'
	  	else 'ordinary'
	  end as class2

from count_you_usage_with_profile_biology_view a;

select a.*,
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then a.category
	  	else 'ordinary'
	  end as class,
	  
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then 'outstanding'
	  	else 'ordinary'
	  end as class2

from count_we_usage_with_profile_biology_view a;

select a.*,
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then a.category
	  	else 'ordinary'
	  end as class,
	  
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then 'outstanding'
	  	else 'ordinary'
	  end as class2

from count_they_usage_with_profile_biology_view a;

select a.*,
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then a.category
	  	else 'ordinary'
	  end as class,
	  
	  case
	  	when a.category in ('top_5', 'top_5_10', 'top_10_15') then 'outstanding'
	  	else 'ordinary'
	  end as class2

from count_she_he_usage_with_profile_biology_view a;
