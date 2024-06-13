UPDATE `swd_order_goods` SET `goods_name` = REPLACE(`goods_name`, '开业花篮', '花篮');
UPDATE `swd_order_goods` SET `goods_name` = REPLACE(`goods_name`, '开业绿植', '绿植');
UPDATE `swd_order_goods` SET `goods_name` = REPLACE(`goods_name`, '+', '~');
UPDATE `swd_order_goods` SET `goods_name` = REPLACE(`goods_name`, '+', '~');
UPDATE `swd_goods` SET `goods_name` = REPLACE(`goods_name`, '开业绿植', '绿植');
UPDATE `swd_goods` SET `goods_name` = REPLACE(`goods_name`, '开业花篮', '花篮');
UPDATE `swd_goods` SET `goods_name` = REPLACE(`goods_name`, '-', '~');
UPDATE `swd_goods` SET `goods_name` = REPLACE(`goods_name`, '-', '~');


UPDATE `swd_user` SET `real_name` = REPLACE(`real_name`, '-', '~'),`username` = REPLACE(`username`, '-', '~');


#更新地址信息
UPDATE `swd_address` SET address='银座富一楼特1号' WHERE consignee='荣煜纺织';
UPDATE `swd_order_extm` SET address='银座富一楼特1号'  WHERE consignee='荣煜纺织';
UPDATE `swd_address_serv` SET address='银座富一楼特1号'  WHERE consignee='荣煜纺织';
UPDATE `swd_address_customer` SET address='银座富一楼特1号'  WHERE consignee='荣煜纺织';