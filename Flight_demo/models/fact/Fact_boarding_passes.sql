{{ config(materialized='table') }}



select tf.* ,
b.boarding_no , b.seat_no , 
'{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time
from stg.Ticket_flights as tf 
join stg.boarding_passes as b 
on tf.ticket_no = b.ticket_no 
and tf.flight_id = b.flight_id
