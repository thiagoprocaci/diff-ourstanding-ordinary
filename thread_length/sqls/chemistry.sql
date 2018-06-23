

select 
	B.*,
	case
		when 
			B.outstd_count > 0 then 'yes'
		else 'no'
		end as contains_outstanding

from (

	select  
	a.id_question,
	a.finished,
	a.thread_length,
	(a.total_top_5_participation + a.total_top_5_10_participation + a.total_top_10_15_participation) as outstd_count
	
	from discussion_analysis('chemistry.stackexchange.com') a

)B
