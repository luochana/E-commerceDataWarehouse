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
insert into table "$APP".ads_continuity_uv_count
select 
     '$do_date',
     concat(date_add('$do_date',-6),'_','$do_date') dt,
     count(*) 
from 
(
    select mid_id
    from
    (
        select mid_id
        from 
        (
            select
                mid_id,
                date_sub(dt,rank) date_diff
            from 
            (
                select 
                    mid_id,
                    dt,
                    rank() over(partition by mid_id order by dt) rank
                from "$APP".dws_uv_detail_day
                where dt>=date_add('$do_date',-6) and dt<='$do_date'
            )t1
        )t2
        group by mid_id,date_diff
        having count(*)>=3
    )t3 
    group by mid_id
)t4;
"

$hive -e "$sql"
