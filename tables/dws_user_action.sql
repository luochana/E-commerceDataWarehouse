drop table if exists dws_user_action;
create external table dws_user_action 
(   
 user_id string comment '用户 id',
 order_count bigint comment '下单次数 ',
 order_amount decimal(16,2) comment '下单金额 ',
 payment_count bigint comment '支付次数',
 payment_amount decimal(16,2) comment '支付金额 ',
 comment_count bigint comment '评论次数'
) COMMENT '每日用户行为宽表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/dws/dws_user_action/';
