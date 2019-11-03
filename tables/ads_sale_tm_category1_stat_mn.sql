drop table ads_sale_tm_category1_stat_mn;
create external table ads_sale_tm_category1_stat_mn
(   
 tm_id string comment '品牌id',
 category1_id string comment '1级品类id ',
 category1_name string comment '1级品类名称 ',
 buycount   bigint comment  '购买人数',
 buy_twice_last bigint  comment '两次以上购买人数',
 buy_twice_last_ratio decimal(10,2)  comment  '单次复购率',
 buy_3times_last   bigint comment   '三次以上购买人数',
 buy_3times_last_ratio decimal(10,2)  comment  '多次复购率',
 stat_mn string comment '统计月份',
 stat_date string comment '统计日期' 
)   COMMENT '复购率统计'
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ads/ads_sale_tm_category1_stat_mn/'
;
