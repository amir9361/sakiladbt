{{ config(materialized='table') }}


select ad.*,
case when
ad.range >= 5600 then 'high'
else 'low ' end as range_model,
model-> 'en' as model_name_en,
model -> 'ru' as model_name_ru
from stg.aircrafts_data as ad 
left join stg.seats as s 
on  ad.aircraft_code = s.aircraft_code
