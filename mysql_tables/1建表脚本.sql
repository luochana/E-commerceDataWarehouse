 
 
 CREATE TABLE `order_info` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `consignee` VARCHAR(100) DEFAULT NULL COMMENT '收货人',
  `consignee_tel` VARCHAR(20) DEFAULT NULL COMMENT '收件人电话',
  `total_amount` DECIMAL(10,2) DEFAULT NULL COMMENT '总金额',
  `order_status` VARCHAR(20) DEFAULT NULL COMMENT '订单状态',
  `user_id` BIGINT(20) DEFAULT NULL COMMENT '用户id',
  `payment_way` VARCHAR(20) DEFAULT NULL COMMENT '付款方式',
  `delivery_address` VARCHAR(1000) DEFAULT NULL COMMENT '送货地址',
  `order_comment` VARCHAR(200) DEFAULT NULL COMMENT '订单备注',
  `out_trade_no` VARCHAR(50) DEFAULT NULL COMMENT '订单交易编号（第三方支付用)',
  `trade_body` VARCHAR(200) DEFAULT NULL COMMENT '订单描述(第三方支付用)',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `operate_time` DATETIME DEFAULT NULL COMMENT '操作时间',
  `expire_time` DATETIME DEFAULT NULL COMMENT '失效时间',
  `tracking_no` VARCHAR(100) DEFAULT NULL COMMENT '物流单编号',
  `parent_order_id` BIGINT(20) DEFAULT NULL COMMENT '父订单编号',
  `img_url` VARCHAR(200) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单表 订单表';

 

 DROP TABLE IF EXISTS sku_info;

CREATE TABLE `sku_info` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '库存id(itemID)',
  `spu_id` BIGINT(20) DEFAULT NULL COMMENT '商品id',
  `price` DECIMAL(10,0) DEFAULT NULL COMMENT '价格',
  `sku_name` VARCHAR(200) DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` VARCHAR(2000) DEFAULT NULL COMMENT '商品规格描述',
  `weight` DECIMAL(10,2) DEFAULT NULL COMMENT '重量',
  `tm_id` BIGINT(20) DEFAULT NULL COMMENT '品牌(冗余)', 
  `category3_id` BIGINT(20) DEFAULT NULL COMMENT '三级分类id（冗余)',
  `sku_default_img` VARCHAR(200) DEFAULT NULL COMMENT '默认显示图片(冗余)',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='库存单元表';


CREATE TABLE `user_info` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `login_name` VARCHAR(200) DEFAULT NULL COMMENT '用户名称',
  `nick_name` VARCHAR(200) DEFAULT NULL COMMENT '用户昵称',
  `passwd` VARCHAR(200) DEFAULT NULL COMMENT '用户密码',
  `name` VARCHAR(200) DEFAULT NULL COMMENT '用户姓名',
  `phone_num` VARCHAR(200) DEFAULT NULL COMMENT '手机号',
  `email` VARCHAR(200) DEFAULT NULL COMMENT '邮箱',
  `head_img` VARCHAR(200) DEFAULT NULL COMMENT '头像',
  `user_level` VARCHAR(200) DEFAULT NULL COMMENT '用户级别',
  `birthday` DATE DEFAULT NULL COMMENT '用户生日',
  `gender` VARCHAR(1) DEFAULT NULL COMMENT '性别 M男,F女',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=9501 DEFAULT CHARSET=utf8 COMMENT='用户表';



 

CREATE TABLE `order_detail` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` BIGINT(20) DEFAULT NULL COMMENT '订单编号',
  `sku_id` BIGINT(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_name` VARCHAR(200) DEFAULT NULL COMMENT 'sku名称（冗余)',
  `img_url` VARCHAR(200) DEFAULT NULL COMMENT '图片名称（冗余)',
  `order_price` DECIMAL(10,2) DEFAULT NULL COMMENT '购买价格(下单时sku价格）',
  `sku_num` VARCHAR(200) DEFAULT NULL COMMENT '购买个数',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=55750 DEFAULT CHARSET=utf8 COMMENT='订单明细表';




DROP TABLE  IF EXISTS `payment_info`;
CREATE   TABLE  `payment_info`
(
       `id`            BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
       `out_trade_no`   VARCHAR(20) COMMENT '对外业务编号',
       `order_id`         VARCHAR(20)  COMMENT '订单编号',
       `user_id`          VARCHAR(20) COMMENT '用户编号',
       `alipay_trade_no`  VARCHAR(20)  COMMENT '支付宝交易流水编号',
       `total_amount`    DECIMAL(16,2) COMMENT '支付金额',
       `subject`          VARCHAR(20)  COMMENT '交易内容',
       `payment_type`          VARCHAR(20)  COMMENT '支付方式',
       `payment_time`    VARCHAR(20) COMMENT '支付时间',
        PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=55750 DEFAULT CHARSET=utf8 COMMENT='支付流水表';


 

CREATE TABLE  `base_category1`
(
       `id`              BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL COMMENT '编号',
       `name`            VARCHAR(100) NOT NULL COMMENT '分类名称'
);
ALTER TABLE `base_category1` COMMENT= '一级分类表';




CREATE TABLE  `base_category2`
(
       `id`              BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL COMMENT '编号',
       `name`            VARCHAR(200) NOT NULL COMMENT '二级分类名称',
       `category1_id`     BIGINT COMMENT '一级分类编号'
);
ALTER TABLE `base_category2` COMMENT= '二级分类表';



 CREATE TABLE  `base_category3`
(
       `id`              BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL COMMENT '编号',
       `name`            VARCHAR(200) NOT NULL COMMENT '三级分类名称',
       `category2_id`     BIGINT COMMENT '二级分类编号'
);
ALTER TABLE `base_category3` COMMENT= '三级分类表';
#####