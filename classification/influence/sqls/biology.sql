with CITATION as (
select a.* from citation_by_display_name_and_category_biology a
),
SUBCOMM as (
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
	select n.id_user, n.modularity_class, u.class, u.class2 from graph_node n 
		inner join USERS u on u.id = n.id_user
	
	where n.id_graph_analysis_context in (
		select id from last_graph_analysis_context('biology.stackexchange.com')
	)
),
PART_DISS as (

select B.id_user, avg(B."count") as avg_part from (
	select a.id_question, a.id_user, count(*) 
	from comm_user_by_discussion('biology.stackexchange.com') a
	group by a.id_question, a.id_user
	
)B group by B.id_user
)
select s.id_user, s.class, s.class2, s.modularity_class,
case 
	when 
		c."count" is null then 0 
		else c."count" 
		
end as citations,
p.avg_part
from  SUBCOMM s
left join CITATION c on c.id_user = s.id_user
left join PART_DISS p on p.id_user = s.id_user


