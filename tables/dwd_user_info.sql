drop table if exists dwd_user_info;
create external table dwd_user_info( 
 `id` string COMMENT 'id',
 `name` string COMMENT '', 
 `birthday` string COMMENT '',
 `gender` string COMMENT '',
 `email` string COMMENT '',
 `user_level` string COMMENT '',
 `create_time` string COMMENT ''
) 
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t'
location '/warehouse/gmall/dwd/dwd_user_info/'
;
