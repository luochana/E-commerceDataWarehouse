drop table if exists ods_base_category3;
create external table ods_base_category3(
 `id` string COMMENT ' id',
 `name` string COMMENT '名称',
 category2_id string COMMENT '二级品类id'
) COMMENT '商品三级分类'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ods/ods_base_category3/'
;

