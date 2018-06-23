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
),
 PARTICIPATION_LAYER as (
	with QUESTION_TAGS as (
		select
				id as id_question,
				tag1 ,
				tag2 ,
				tag3
			from post_tags('biology.stackexchange.com')
	), USER_BY_DISCUSSION as (
		select  id_question, id_user from comm_user_by_discussion('biology.stackexchange.com')
	),
	LAYERS as (
		-- recupera as camadas de cada tag
		select * from tag_layer('biology.stackexchange.com')
	),
	USER_TAGS as (
		-- liga tags aos usuarios
		select q.*, u.id_user from QUESTION_TAGS q
			inner join USER_BY_DISCUSSION u on q.id_question = u.id_question
		order by u.id_user
	),
	USER_TAGS_2 as  (
		-- reorganiza a conexao das tags por usuario e adiciona a camada de cada tag
		select A.tag, A.id_user, sum("count") as total_post_tag,
			(select l.layer from LAYERS l where l.tag = A.tag) as 	layer
		from (
	
			select u.tag1 as tag, u.id_user, count(*) from USER_TAGS u group by u.tag1, u.id_user
			union all
			select u.tag2 as tag, u.id_user, count(*) from USER_TAGS u group by u.tag2, u.id_user
			union all
			select u.tag3 as tag, u.id_user, count(*) from USER_TAGS u group by u.tag3, u.id_user
	
		)A where length(A.tag) > 0 group by A.tag, A.id_user
	),
	TOTAL_POST_LAYER as (
		select u.layer, u.id_user, sum(total_post_tag) as total_post_layer from USER_TAGS_2 u group by u.layer, u.id_user
	)
	select B.id_user, sum(B.layer_1) as layer_1,
		sum(B.layer_2) as layer_2,
		sum(B.layer_3) as layer_3,
		sum(B.layer_4) as layer_4
	from (
		select *, 
			case
				when layer = '1' then total_post_layer
				else 0
			end as layer_1,
			case
				when layer = '2' then total_post_layer
				else 0
			end as layer_2,
			case
				when layer = '3' then total_post_layer
				else 0
			end as layer_3,
			case
				when layer = '4' then total_post_layer
				else 0
			end as layer_4
		from TOTAL_POST_LAYER order by id_user
	)B group by B.id_user
),
USER_ENTROPY as (
	select * from user_entropy('biology.stackexchange.com')
)
select u.id_user, u.entropy, p.layer_1, p.layer_2, p.layer_3, p.layer_4,
x.class, x.class2
from USER_ENTROPY u
inner join  PARTICIPATION_LAYER p on u.id_user = p.id_user
inner join USERS x on x.id = u.id_user


