

{{ config(materialized='view', alias = 'customer', schema = 'new') }}

SELECT
*
from {{ ref('hello_world') }}
where 1=1
and customer_id < {{var('cust_id') }}