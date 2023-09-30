<?php

// 站点设置参数
$abcdefile = Yii::getAlias('@frontend') . '/web/data/setting.php';
if(file_exists($abcdefile) && ($setting = require($abcdefile))) {
	$params = is_array($setting) ? $setting : [];
}else{
	$params=[];
}

return array_merge((array) $params, [
    'adminEmail' => 'admin@example.com',
    'supportEmail' => 'support@example.com',
         'createRights'=>array(3,4,5),///**********************权限判断,创建用户[START]JchengCustom with local**********************/

    'user.passwordResetTokenExpire' => 3600,
]);
