drop table if exists ads_slient_count;
create external table ads_slient_count( 
    `dt` string COMMENT '统计日期',
    `slient_count` bigint COMMENT '沉默设备数'
) 
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_slient_count';
