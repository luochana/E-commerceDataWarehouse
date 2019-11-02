
#!/bin/bash

if [ -n "$1" ];then
	do_date=$1
else
	do_date=`date -d "-1 day" +%F`
fi

hive=/home/luochan/hive/bin/hive
APP=gmall

echo "-----------导入日期$do_date-----------"

sql="
insert into table "$APP".ads_back_count
select 
       '$do_date' dt,
       concat(date_add(next_day('$do_date','MO'),-7),'_',date_add(next_day('$do_date','MO'),-1)) wk_dt,
       count(*)
from 
(
    select t1.mid_id
    from 
    (
        select mid_id
        from "$APP".dws_uv_detail_wk
        where wk_dt=concat(date_add(next_day('$do_date','MO'),-7),'_',date_add(next_day('$do_date','MO'),-1))
    )t1
    left join
    (
        select mid_id
        from "$APP".dws_new_mid_day
        where create_date<=date_add(next_day('$do_date','MO'),-1) and create_date>=date_add(next_day('$do_date','MO'),-7)
    )t2
    on t1.mid_id=t2.mid_id
    left join
    (
        select mid_id
        from "$APP".dws_uv_detail_wk
        where wk_dt=concat(date_add(next_day('$do_date','MO'),-7*2),'_',date_add(next_day('$do_date','MO'),-7-1))
    )t3
    on t1.mid_id=t3.mid_id
    where t2.mid_id is null and t3.mid_id is null
)t4;
"

$hive -e "$sql"
