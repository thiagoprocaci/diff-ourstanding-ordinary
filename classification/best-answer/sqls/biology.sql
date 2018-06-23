with QUESTION_SOLVED as (
	select *
	from post question
	where question.post_type = 1 
	and question.accepted_answer_comm_id is not null
	and question.id_community in (select id from community where name = 'biology.stackexchange.com')
),
 BEST_ANSWER as (
	select  
		  answer.*
	from post answer 
	inner join QUESTION_SOLVED question on question.accepted_answer_comm_id = answer.id_post_comm
	where answer.post_type = 2
	and answer.id_community = question.id_community
),
ALL_ANSWERS as (
	select  
		  answer.id,
		  answer.id_user, 
		  answer.creation_date,
		  case 
		  	when answer.ari_text is null then 0
		  	else answer.ari_text
		  end as ari,
		  case 
		  	when answer.characters_text is null then 0
		  	else answer.characters_text
		  end as "characters",
		  case 
		  	when answer.complexwords_text is null then 0
		  	else answer.complexwords_text
		  end as complexwords,
		  case 
		  	when answer.syllables_text is null then 0
		  	else answer.syllables_text
		  end as syllables, 
		  case 
		  	when answer.sentences_text is null then 0
		  	else answer.sentences_text
		  end as sentences, 
		  case 
		  	when answer.words_text is null then 0
		  	else answer.words_text
		  end as words
	from post answer
	where answer.post_type = 2
	and answer.id_community  in (select id from community where name = 'biology.stackexchange.com')
	and answer.id_user is not null
),
USERS as (
	select a.id,
		a.questions,
		a.answers,
		a.comments,
		a.reviews,
		a.accepted_answers
		
		from comm_user_ranking_profile('biology.stackexchange.com') a
)
select a.*,
        u.questions,
		u.answers,
		u.comments,
		u.reviews,
		u.accepted_answers,
		
		(
			select count(*) from BEST_ANSWER x
			where x.id_user = a.id_user
			and x.creation_date < a.creation_date
		
		) as hist_accepted_answers,
	case
		when a.id in (select id from BEST_ANSWER) then 'best'
		else 'normal'
	end as class
from ALL_ANSWERS a
inner join USERS u on u.id = a.id_user
