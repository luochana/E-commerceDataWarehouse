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
insert into table "$APP".ads_continuity_wk_count
select 
     '$do_date',
     concat(date_add(next_day('$do_date','MO'),-7*3),'_',date_add(next_day('$do_date','MO'),-1)),
     count(*)
from 
(
    select mid_id
    from "$APP".dws_uv_detail_wk
    where wk_dt>=concat(date_add(next_day('$do_date','MO'),-7*3),'_',date_add(next_day('$do_date','MO'),-7*2-1)) 
    and wk_dt<=concat(date_add(next_day('$do_date','MO'),-7),'_',date_add(next_day('$do_date','MO'),-1))
    group by mid_id
    having count(*)=3
)t1;"

$hive -e "$sql"
