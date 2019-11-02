drop table if exists ads_user_retention_day_count;
create external table ads_user_retention_day_count 
(
   `create_date`       string  comment '设备新增日期',
   `retention_day`     int comment '截止当前日期留存天数',
   `retention_count`    bigint comment  '留存数量'
)  COMMENT '每日用户留存情况'
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_user_retention_day_count/';
