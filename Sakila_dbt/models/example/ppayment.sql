select
*,
'{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' as dbt_time
from payment
where 1=1

{% if is_incremental() %}
and payment_date::timestamp > (select max(payment_date) from {{this}})
{% endif %}