insert into table ads_user_action_convert_day
select 
    '2019-10-30',
    uv.day_count,
    ua.order_count,
    cast(ua.order_count/uv.day_count as  decimal(10,2)) visitor2order_convert_ratio,
    ua.payment_count,
    cast(ua.payment_count/ua.order_count as  decimal(10,2)) order2payment_convert_ratio
from  
(
select 
    dt,
        sum(if(order_count>0,1,0)) order_count,
        sum(if(payment_count>0,1,0)) payment_count
    from dws_user_action
where dt='2019-10-30'
group by dt
)ua join ads_uv_count  uv on uv.dt=ua.dt
;
