drop table if exists dws_sale_detail_daycount;
create external table dws_sale_detail_daycount
(   
 user_id string comment '用户 id',
 sku_id string comment '商品 Id',
 user_gender string comment '用户性别',
 user_age string comment '用户年龄',
 user_level string comment '用户等级',
 order_price decimal(10,2) comment '商品价格',
 sku_name string comment '商品名称',
 sku_tm_id string comment '品牌id',
 sku_category3_id string comment '商品三级品类id',
 sku_category2_id string comment '商品二级品类id',
 sku_category1_id string comment '商品一级品类id',
 sku_category3_name string comment '商品三级品类名称',
 sku_category2_name string comment '商品二级品类名称',
 sku_category1_name string comment '商品一级品类名称',
 spu_id string comment '商品 spu',
 sku_num int comment '购买个数',
 order_count string comment '当日下单单数',
 order_amount string comment '当日下单金额'
) COMMENT '用户购买商品明细表'
PARTITIONED BY (`dt` string)
row format delimited  fields terminated by '\t'
location '/warehouse/gmall/dws/dws_user_sale_detail_daycount/'
;
