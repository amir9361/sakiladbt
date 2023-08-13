{{config(materialized='incremental',unique_key='payment_id') }}



select *
from payment p