<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件


error_reporting(E_ALL ^ E_NOTICE);//除了E_NOTICE("运行时提醒",如使用一个未为空的变量)报告其他所有错误
define('AUTH_CODE','password');

//加密
function encrypt($str){
    return md5($str.AUTH_CODE);
}

