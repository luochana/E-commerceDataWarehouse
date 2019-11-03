drop table if exists dwd_order_detail;
create external table dwd_order_detail( 
 `id` string COMMENT '',
 `order_id` decimal(10,2) COMMENT '', 
 `user_id` string COMMENT 'id',
 `sku_id` string COMMENT 'id',
 `sku_name` string COMMENT '',
 `order_price` string COMMENT '',
 `sku_num` string COMMENT '',
 `create_time` string COMMENT ''
)
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/dwd/dwd_order_detail/'
;
