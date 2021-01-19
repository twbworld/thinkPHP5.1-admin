<?php

namespace app\admin\validate;

use think\Db;
use think\Validate;

class Admin extends Validate
{
    //验证规则
    protected $rule = [
        '__token__' => ['require', 'length:32', 'token'],
        'password|密码' => ['length:6,18', 'requireIf:act,add'],
        'user_name|用户名' => ['require', 'unique:admin', 'length:2,20'],
        'admin_id|Id' => ['require', 'number', 'checkAdminId'],
        'role_id|角色' => ['number', 'requireCallback:checkRoleIdRequire', 'checkRoleId'],
    ];

    //错误消息
    protected $message = [
        '__token__.require' => '非法提交',
        '__token__.length' => '非法提交',
        '__token__.token' => '禁止重复提交',
        'user_name.unique' => '已存在相同用户名',
        'admin_id.require' => '参数错误',
        'admin_id.number' => '参数错误',
        'role_id.number' => '角色选择错误',
    ];

    //验证场景
    protected $scene = [
        'edit' => ['__token__', 'password', 'user_name', 'role_id', 'admin_id'],
        'add' => ['__token__', 'password', 'user_name', 'role_id'],
    ];

    protected function checkRoleId($value)
    {
        $name = Db::name('admin_role')->field('role_name')->where('role_id', $value)->find();
        if ($name) {
            return true;
        }
        return '参数错误';
    }

    protected function checkAdminId($value)
    {
        $name = Db::name('admin')->field('user_name')->where('admin_id', $value)->find();
        if ($name) {
            return true;
        }
        return '参数错误';
    }

    //检查是否id为1的超级管理员,如果是,角色不必要
    protected function checkRoleIdRequire($value, $data)
    {
        return $data['admin_id'] == 1 ? false : true;
    }

}
