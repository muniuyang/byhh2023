<?php

return array (
  'widgets' => 
  array (
     '_widget_417' => 
    array (
      'name' => 'df_byhhmcate',
      'options' => 
      array (
        'bgcolor' => '#fc2b34',
        'txtcolor' => '#ffffff',
        'selColor' => '#ffffff',
        'txtbold' => '1',
        'homehide' => '1',
        'morehide' => '0',
        'space' => '0',
      ),
    ),
    '_widget_612' => 
    array (/*广告专区*/
      'name' => 'df_swiper',
      'options' => 
      array (
        'images' => 
        array (
          0 => 
          array (
            'ad_image_url' => 'data/files/mall/template/20210902101154967.jpg',
            'ad_link_url' => 'goods/index.html?id=37',
          ),
          1 => 
          array (
            'ad_image_url' => 'data/files/mall/template/20210902101146758.jpg',
            'ad_link_url' => 'goods/index.html?id=35',
          ),
          2 => 
          array (
            'ad_image_url' => 'data/files/mall/template/20210902101200542.jpg',
            'ad_link_url' => 'goods/index.html?id=38',
          ),
        ),
        'bgcolor' => '#fc2b34',
        'radius' => 'round',
        'space' => '0',
      ),
    ),
    '_widget_110' => 
    array (/*占位行*/
      'name' => 'df_blank',
      'options' => 
      array (
        'bgcolor' => '',
        'height' => '10',
      ),
    ),
 
    '_widget_271' => 
    array (/*公告专区*/
      'name' => 'df_byhhnotice',
      'options' => 
      array (
        'style' => '2',
        'source' => 'choice',
        'cate_id' => '1',
        'cate_name' => '系统分类',
        'items' => '1,3,2,4,5,6',
        'quantity' => '9',
        'bgcolor' => '#ffffff',
        'radius' => 'round',
        'space' => '10',
      ),
    ),
 
 
    '_widget_136' => 
    array (/*活动专区*/
      'name' => 'df_byhhimagead',
      'options' => 
      array (
        'title' => '热卖区',
        'label' => '全场5折起 上不封顶',
        'color' => '#ffffff',
        'column' => '3',
        'radius' => 'round',
        'ad_image_url' => 
        array (
          0 => 'data/files/mall/template/20210824125533323.jpeg',
          1 => 'data/files/mall/template/20210824125542590.jpeg',
          2 => 'data/files/mall/template/20210824125549707.jpeg',
        ),
        'ad_link_url' => 
        array (
          0 => '',
          1 => '',
          2 => '',
        ),
        'bgcolor' => '#7529f5',
        'space' => '10',
      ),
    ),
 
    '_widget_692' => 
    array (/*活动专区*/
      'name' => 'df_byhhimagead',
      'options' => 
      array (
        'title' => '热卖区',
        'label' => '',
        'color' => '#555555',
        'column' => '2',
        'radius' => 'round',
        'ad_image_url' => 
        array (
          0 => 'data/files/mall/template/20210824102124757.jpeg',
          1 => 'data/files/mall/template/20210824102128800.jpeg',
          2 => 'data/files/mall/template/20210823164309235.jpg',
        ),
        'ad_link_url' => 
        array (
          0 => 'mobile/goods/index.html?id=42',
          1 => '2',
          2 => '3',
        ),
        'bgcolor' => '#ffffff',
        'space' => '10',
      ),
    ),
    '_widget_280' => 
    array (/*限时活动专区*/
      'name' => 'df_byhhlimitbuy',
      'options' => 
      array (
        'direction' => 'horizontal',
        'source' => 'choice2',
        'items' => '12',
        'quantity' => '2',
        'txtcolor' => '#fc2b34',
        'bgcolor' => '',
        'space' => '10',
      ),
    ),
    '_widget_724' => 
    array (/*拼团专区*/
      'name' => 'df_byhhteambuy',
      'options' => 
      array (
        'source' => 'choice',
        'items' => '24,17',
        'quantity' => '2',
        'bgcolor' => '',
        'space' => '5',
      ),
    ),
  ),
  'config' => 
  array (
    'index' => 
    array (
      1 => '_widget_417',
      2 => '_widget_612',
      3 => '_widget_110',
      5 => '_widget_271',
      10 => '_widget_136',/*活动专区*/
      12 => '_widget_692',/*活动专区*/
      13 => '_widget_280',/*活动专区*/
      14 => '_widget_724',/*拼团专区*/
    ),
  ),
);