{{ config(materialized='incremental' , unique_key='staff_id', post_hook="insert into {{this}}(staff_id) VALUES (-1)" ) }}



select 
    staff_id,
    first_name,
    last_name,
    email,
    active::int,
    last_update,
    '{{ run_started_at.strftime ("%Y-%m-%d %H:%M:%S")}}'::timestamp as dbt_time

from 
    staff as staff 

