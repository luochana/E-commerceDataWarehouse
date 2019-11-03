drop table if exists dwd_payment_info;
create external table dwd_payment_info(
 `id` bigint COMMENT '',
 `out_trade_no` string COMMENT '',
 `order_id` string COMMENT '',
 `user_id` string COMMENT '',
 `alipay_trade_no` string COMMENT '',
 `total_amount` decimal(16,2) COMMENT '',
 `subject` string COMMENT '',
 `payment_type` string COMMENT '',
 `payment_time` string COMMENT ''
)  
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/dwd/dwd_payment_info/'
;
