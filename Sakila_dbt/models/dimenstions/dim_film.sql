{{ config(materialized='incremental',unique_key='film_id',post_hook='insert into {{this}}(film_id) VALUES (-1)' ) }}

select
f.film_id,
f.title,
f.release_year,
fc.category_id,
fc.last_update,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time,
case when length > 120 then 'long'
	when length between 75 and 120 then 'medium'
	when length <= 75 then 'short'
	else null 
	end as range_film,
case when special_features is not null then 'yes'
	else 'no special features'
	end as special_features_indicator
from public.film as f 
left join "language" as lang on lang.language_id = f.language_id 
join film_category fc ON fc.film_id =f.film_id 
left join category c on fc.category_id =c.category_id