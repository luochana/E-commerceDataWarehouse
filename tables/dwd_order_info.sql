drop table if exists dwd_order_info;
create external table dwd_order_info (
 `id` string COMMENT '',
 `total_amount` decimal(10,2) COMMENT '',
 `order_status` string COMMENT ' 1 2 3 4 5',
 `user_id` string COMMENT 'id',
 `payment_way` string COMMENT '',
 `out_trade_no` string COMMENT '',
 `create_time` string COMMENT '',
 `operate_time` string COMMENT ''
) 
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/dwd/dwd_order_info/'
;
