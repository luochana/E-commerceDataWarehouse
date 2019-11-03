drop table if exists ods_base_category1;
create external table ods_base_category1( 
 `id` string COMMENT 'id',
 `name` string COMMENT '名称'
) COMMENT '商品一级分类'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/ods/ods_base_category1/'
;
