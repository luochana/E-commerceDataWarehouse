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
insert into table "$APP".ads_wastage_count
select
     '$do_date',
     count(*)
from 
(
    select mid_id
    from "$APP".dws_uv_detail_day
    group by mid_id
    having max(dt)<=date_add('$do_date',-7)
)t1;
"

$hive -e "$sql"
