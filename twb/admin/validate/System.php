<?php

namespace app\admin\validate;

use app\common\logic\ModuleLogic;
use think\Db;
use think\Validate;

class System extends Validate
{
    //验证规则
    protected $rule = [
        '__token__'   =>  ['require','length:32','token'],
        'name|名称' => ['require', 'min' => '2'],
        'right|权限码' => ['require', 'array'],
        'group|分组' => ['require', 'checkGroup'],
        'id|Id' => ['require', 'number', 'checkId'],
    ];

    //错误消息
    protected $message = [
        '__token__.require' => '非法提交',
        '__token__.length'  => '非法提交',
        '__token__.token'   => '禁止重复提交',
        'name.min' => '最小长度为2',
        'right.array' => '权限码错误',
        'id.number' => 'Id出错',
    ];

    //验证场景
    protected $scene = [
        'edit' => ['__token__','name', 'right', 'group', 'id'],
        'add' => ['__token__','name', 'right', 'group'],
    ];

    protected function checkGroup($value)
    {
        $moduleLogic = new ModuleLogic;
        $groups = $moduleLogic->getPrivilege(0);
        if (in_array($value, array_keys($groups))) {
            return true;
        }
        return '分组不存在';
    }

    protected function checkId($value)
    {
        $name = Db::name('system_menu')->field('name')->where('id', $value)->find();
        if ($name) {
            return true;
        }
        return '参数错误';
    }

}
