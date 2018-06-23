
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


select p.id, 
	  p.id_user, 
	  p.ari_text as ari, 
	  p.characters_text as "characters", 
	  p.complexwords_text as complexwords, 
	  p.syllables_text as syllables,
	  p.sentences_text as sentences, 
	  p.words_text as words,
	  u.class,
	  u.class2
from post p
inner join USERS u on u.id = p.id_user
where p.ari_text is not null

union all

select p.id, 
	  p.id_user, 
	  p.ari as ari, 
	  p.characters as "characters", 
	  p.complexwords as complexwords, 
	  p.syllables as syllables,
	  p.sentences as sentences, 
	  p.words as words,
	  u.class,
	  u.class2
from "comment" p
inner join USERS u on u.id = p.id_user
where p.ari is not null
