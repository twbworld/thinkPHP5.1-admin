<?php

namespace app\admin\behavior;

use think\Db;
use think\facade\Request;
use think\facade\Session;

class adminLog
{
    public function run($params)
    {
        $add['log_info'] = $params;
        $add['log_time'] = time();
        $add['admin_id'] = Session::get('admin_id');
        $add['log_ip'] = Request::ip();
        $add['log_url'] = Request::baseUrl();

        Db::name('admin_log')->insert($add);
    }
}
