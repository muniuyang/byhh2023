UPDATE `swd_order_goods` SET `goods_name` = REPLACE(`goods_name`, '开业花篮', '花篮');
UPDATE `swd_order_goods` SET `goods_name` = REPLACE(`goods_name`, '开业绿植', '绿植');
UPDATE `swd_order_goods` SET `goods_name` = REPLACE(`goods_name`, '+', '~');
UPDATE `swd_order_goods` SET `goods_name` = REPLACE(`goods_name`, '+', '~');
UPDATE `swd_goods` SET `goods_name` = REPLACE(`goods_name`, '开业绿植', '绿植');
UPDATE `swd_goods` SET `goods_name` = REPLACE(`goods_name`, '开业花篮', '花篮');
UPDATE `swd_goods` SET `goods_name` = REPLACE(`goods_name`, '-', '~');
UPDATE `swd_goods` SET `goods_name` = REPLACE(`goods_name`, '-', '~');


UPDATE `swd_user` SET `real_name` = REPLACE(`real_name`, '-', '~'),`username` = REPLACE(`username`, '-', '~');
