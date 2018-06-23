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
from comm_user_ranking_profile('biology.stackexchange.com') a
)

select e.id_user_source, count(*) reciprocity_count,  u.class, u.class2 from graph_edge e
inner join graph_edge e2 on 
e.id_user_source = e2.id_user_dest and e.id_user_dest = e2.id_user_source
inner join USERS u on u.id = e.id_user_source
where e.id_graph_analysis_context in (
select id from last_graph_analysis_context('biology.stackexchange.com')
)

 and e.id_user_source != e.id_user_dest

 group by e.id_user_source, u.class, u.class2
