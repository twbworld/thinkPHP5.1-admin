<?php

namespace app\admin\validate;

use think\Db;
use think\Validate;

class Role extends Validate
{
    //验证规则
    protected $rule = [
        '__token__' => ['require', 'length:32', 'token'],
        'act_list|权限资源' => ['require','array'],
        'role_name|角色名称' => ['require', 'length:2,20', 'unique:admin_role'],
        'role_id' => ['require', 'number', 'checkRoleId'],
    ];

    //错误消息
    protected $message = [
        '__token__.require' => '非法提交',
        '__token__.length' => '非法提交',
        '__token__.token' => '禁止重复提交',
        'role_name.unique' => '已存在相同名称',
        'role_id.require' => '参数错误',
        'role_id.number' => '参数错误',
    ];

    //验证场景
    protected $scene = [
        'edit' => ['__token__', 'act_list', 'role_name', 'role_id'],
        'add' => ['__token__', 'act_list', 'role_name'],
    ];

    protected function checkRoleId($value)
    {
        $name = Db::name('admin_role')->field('role_name')->where('role_id', $value)->find();
        if ($name) {
            return true;
        }
        return '参数错误';
    }

}
