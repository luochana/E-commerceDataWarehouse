drop table if exists ods_order_detail;
create external table ods_order_detail( 
`id` string COMMENT '订单编号',
`order_id` string  COMMENT '订单号', 
`user_id` string COMMENT '用户id',
`sku_id` string COMMENT '商品id',
`sku_name` string COMMENT '商品名称',
`order_price` string COMMENT '商品价格',
`sku_num` string COMMENT '商品数量',
`create_time` string COMMENT '创建时间'
) COMMENT '订单明细表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
location '/warehouse/gmall/ods/ods_order_detail/'
;
