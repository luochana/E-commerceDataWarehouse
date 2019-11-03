drop table if exists ads_user_convert_day;
create external table ads_user_convert_day( 
 `dt` string COMMENT '统计日期',
 `uv_m_count` bigint COMMENT '当日活跃设备',
 `new_m_count` bigint COMMENT '当日新增设备',
 `new_m_ratio` decimal(10,2) COMMENT '当日新增占日活的比率'
) COMMENT '转化率'
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_user_convert_day/'
;
