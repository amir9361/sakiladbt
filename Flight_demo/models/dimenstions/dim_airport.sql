{{ config(materialized='table') }}

select *,
airport_name -> 'en' as airport_name_en,
airport_name -> 'ru' as airport_name_ru,
city -> 'en' as city_name_en,
city -> 'ru' as city_name_ru,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from stg.airports_data ad
