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

select e.*, u.class, u.class2, u.reputation, u.accepted_answers from user_entropy('biology.stackexchange.com') e
inner join USERS u on u.id = e.id_user
