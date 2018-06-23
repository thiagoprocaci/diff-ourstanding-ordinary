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
I_USAGE as (

	select a.* from count_i_usage_with_profile_biology_view a
),
YOU_USAGE as (
	select a.* from count_you_usage_with_profile_biology_view a
)
,
SHE_HE_USAGE as (
	select a.* from count_she_he_usage_with_profile_biology_view a
)

select 
	  B.id_user, 
	  avg(B.ari) as ari, 
	  avg(B.characters) as "characters", 
	  avg(B.complexwords) as complexwords, 
	  avg(B.syllables) as syllables,
	  avg(B.sentences) as sentences, 
	  avg(B.words) as words,
	  case 
	  	when x.count_i_usage is null then 0
	  	else x.count_i_usage
  	  end as count_i_usage,
  	  case
  	  	when y.count_you_usage is null then 0
  	  	else y.count_you_usage
  	  end as count_you_usage,
	  case 
	  	when z.count_she_he_usage is null then 0
	  	else z.count_she_he_usage 
	  end as count_she_he_usage,
	  B.class,
	  B.class2

	from (

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
	
)B 
	left join  I_USAGE x on x.id_user = B.id_user
	left join  YOU_USAGE y on y.id_user = B.id_user
	left join SHE_HE_USAGE z on z.id_user = B.id_user

group by B.id_user, B.class, B.class2,

 x.count_i_usage ,
	  y.count_you_usage,
	  z.count_she_he_usage
