
{{config(materialized='table',unique_key='rental_id') }}


with rental_1 as (
            select r.* ,
            i.film_id,
            i.store_id
            from rental r
            left join inventory i
            on r.inventory_id = i.inventory_id
            






)

select *,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from rental_1




