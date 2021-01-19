<?php
/**
 * tpshop
 * ============================================================================
 * 版权所有 2015-2027 深圳搜豹网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.tp-shop.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * 采用最新Thinkphp5助手函数特性实现单字母函数M D U等简写方式
 * ============================================================================
 * Author: lhb
 */

namespace app\common\logic;

use app\common\model\Admin;
use think\Db;
use think\facade\Request;
use think\facade\Session;
use think\facade\Hook;

class AdminLogic
{
    public function login($username, $password)
    {
        if (empty($username) || empty($password)) {
            return ['code' => 0, 'msg' => '有也冇填都睇唔到,吊你老味', 'wait' => 2];
        }

        $condition['a.user_name'] = $username;
        $condition['a.password'] = encrypt($password);
        $condition['a.delete_time'] = 0;

        $admin = Db::name('admin')
            ->alias('a')
            ->join('__ADMIN_ROLE__ ar', 'a.role_id=ar.role_id AND ar.delete_time = 0')
            ->where($condition)
            ->find();

        if (!$admin) {
            return ['code' => 0, 'msg' => '你估是账号错定密码错?食屎啦,梁非凡', 'wait' => 2.5];
        }
        $this->handleLogin($admin, $admin['act_list']); //相关处理

        $url = Session::get('from_url') ? Session::get('from_url') : url('admintp/index/index');
        return ['code' => 1, 'msg' => '甘都比你登左,算你好彩', 'url' => $url, 'wait' => 2];
    }

    public function handleLogin($admin, $actList)
    {

        // 添加用户登录信息
        $Admin = Admin::get($admin['admin_id']);
        $Admin->last_ip = Request::ip(); //登录ip
        $Admin->last_login = time(); //登录时间
        $Admin->isAutoWriteTimestamp(false)->save(); //关闭自动时间戳,入库

        // $this->sessionRoleRights($actList);

        Session::set('act_list', $actList); //写入session权限信息

        Hook::listen('session',$admin);//监听"钩子",执行"钩子"的"行为",即写入登录session
        Hook::listen('log','后台登录');

        // adminLog('后台登录'); //数据库记录登录信息
    }

    public function logout($adminId)
    {
        session_unset();
        session_destroy();
        Session::clear();
    }
}
