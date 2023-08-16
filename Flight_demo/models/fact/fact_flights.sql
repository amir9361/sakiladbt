{{ config(materialized='table') }}

with fact_flight as (

select *,
actual_arrival - actual_departure as duration_flight ,
scheduled_arrival - scheduled_departure as flight_duration_expected
from stg.flights
)



select *,
case when  duration_flight = flight_duration_expected   then 'as expected'
when duration_flight > flight_duration_expected then 'longer'
when duration_flight < flight_duration_expected then 'shorter'
end as test_me,
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from fact_flight as ff 