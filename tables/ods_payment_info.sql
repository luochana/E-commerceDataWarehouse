drop table if exists ods_payment_info;
create external table ods_payment_info(
 `id` bigint COMMENT '编号',
 `out_trade_no` string COMMENT '对外业务编号',
 `order_id` string COMMENT '订单编号',
 `user_id` string COMMENT '用户编号',
 `alipay_trade_no` string COMMENT '支付宝交易流水编号',
 `total_amount` decimal(16,2) COMMENT '支付金额',
 `subject` string COMMENT '交易内容',
 `payment_type` string COMMENT '支付类型',
 `payment_time` string COMMENT '支付时间'
) COMMENT '支付流水表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ods/ods_payment_info/'
;
