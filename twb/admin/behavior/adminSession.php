<?php

namespace app\admin\behavior;

use think\facade\Session;

class adminSession
{
    /*写入登录session*/
    public function run($params)
    {
        Session::set('admin_id', $params['admin_id']);
        Session::set('last_login_time', $params['last_login']);
        Session::set('last_login_ip', $params['last_ip']);
        Session::set('user_name', $params['user_name']);
        Session::set('role_name', $params['role_name']);
    }
}
