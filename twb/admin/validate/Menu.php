<?php

namespace app\admin\validate;

use think\Db;
use think\Validate;


class Menu extends Validate
{
    //验证规则
    protected $rule = [
        '__token__'   =>  ['require','length:32','token'],
        'text|标题'     => ['require', 'length' => '2,10'],
        'target|跳转模式' => ['require', 'number', 'in' => '0,1,2'],
        'top|置顶'      => ['require', 'in' => '0,1'],
        'enabled|开启'  => ['require', 'in' => '0,1'],
        'cat_id|分类'   => ['require', 'number', 'different' => 'id', 'checkCatId'],
        'id|Id'          => ['require', 'number', 'checkId'],
    ];

    //错误消息
    protected $message = [
        '__token__.require' => '非法提交',
        '__token__.length'  => '非法提交',
        '__token__.token'   => '禁止重复提交',
        'text.length'       => '标题长度为2-10',
        'target.in'         => '跳转模式选择错误',
        'top.in'            => '置顶选择错误',
        'enabled.in'        => '开启选择错误',
        'cat_id.different'    => '分类选择错误',
        'cat_id.number'    => '参数错误',
        'id.number'    => '参数错误',
    ];

    //验证场景
    protected $scene = [
        'edit' => ['__token__','text', 'target', 'top', 'enabled', 'cat_id', 'id'],
        'add' => ['__token__','text', 'target', 'top', 'enabled'],
    ];

    protected function checkCatId($value)
    {
        if ($value == 0) {
            return true;
        }
        $r = Db::name('menu')->field('id')->where('id', $value)->find();
        if ($r) {
            return true;
        }
        return '分类不存在';
    }

    protected function checkId($value)
    {
        $cat_id = Db::name('menu')->field('cat_id')->where('id', $value)->find();
        if ($cat_id) {
            return true;
        }
        return '菜单不存在';
    }


}
