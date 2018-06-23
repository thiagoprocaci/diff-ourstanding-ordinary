with USERS as (

	select a.*,
			case 
				when a.top_5 = 1 then 'top_5'
				when a.top_5_10 = 1 then 'top_5_10'
				when a.top_10_15 = 1 then 'top_10_15'
			else 'ordinary'
			end as class,
			case 
				when a.top_5 = 1 then 'outstanding'
				when a.top_5_10 = 1 then 'outstanding'
				when a.top_10_15 = 1 then 'outstanding'
			else 'ordinary'
			end as class2
from comm_user_ranking_profile('chemistry.stackexchange.com') a
)

select C.count_ordinaries,
	C.count_outstanding,
	(C.count_ordinaries + C.count_outstanding) as total_members,
	case 
		when C.count_outstanding > 0 then 'contains_outstd'
		else 'dont_contains_outstd'
	end as contains_outstd
	from (

select B.modularity_class, sum(B.count_ordinaries) as count_ordinaries, sum(B.count_outstanding) as count_outstanding from (

	select n.modularity_class, count(*) as count_ordinaries, 0 as count_outstanding from graph_node n 
	inner join USERS u on u.id = n.id_user
	where n.id_graph_analysis_context in (
		select id from last_graph_analysis_context('chemistry.stackexchange.com')
	)
	and u.class2 = 'ordinary'
	group by n.modularity_class, u.class2

	
	union all 
	
	select n.modularity_class, 0 as count_ordinaries, count(*) as count_outstanding from graph_node n 
	inner join USERS u on u.id = n.id_user
	where n.id_graph_analysis_context in (
		select id from last_graph_analysis_context('chemistry.stackexchange.com')
	)
	and u.class2 = 'outstanding'
	group by n.modularity_class, u.class2
 
	
)B 
group by B.modularity_class 

)C

