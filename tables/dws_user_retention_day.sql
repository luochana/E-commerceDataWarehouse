drop table if exists dws_user_retention_day;
create external table dws_user_retention_day 
(
    `mid_id` string COMMENT '设备唯一标识',
    `user_id` string COMMENT '用户标识', 
    `version_code` string COMMENT '程序版本号', 
    `version_name` string COMMENT '程序版本名', 
`lang` string COMMENT '系统语言', 
`source` string COMMENT '渠道号', 
`os` string COMMENT '安卓系统版本', 
`area` string COMMENT '区域', 
`model` string COMMENT '手机型号', 
`brand` string COMMENT '手机品牌', 
`sdk_version` string COMMENT 'sdkVersion', 
`gmail` string COMMENT 'gmail', 
`height_width` string COMMENT '屏幕宽高',
`app_time` string COMMENT '客户端日志产生时的时间',
`network` string COMMENT '网络模式',
`lng` string COMMENT '经度',
`lat` string COMMENT '纬度',
   `create_date`    string  comment '设备新增时间',
   `retention_day`  int comment '截止当前日期留存天数'
)  COMMENT '每日用户留存情况'
PARTITIONED BY (`dt` string)
stored as parquet
location '/warehouse/gmall/dws/dws_user_retention_day/'
;
