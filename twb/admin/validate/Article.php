<?php

namespace app\admin\validate;

use think\Db;
use think\Validate;


class Article extends Validate
{
    //验证规则
    protected $rule = [
        'title|标题'     => ['require', 'min' => '2'],
        'publish_time|发布时间' => ['require', 'date'],
        'is_top|置顶'      => ['require', 'in' => '0,1'],
        'is_open|开启'  => ['require', 'in' => '0,1'],
        'cat_id|分类'   => ['require', 'number', 'checkCatId'],
        'article_id|Id' => ['require', 'number', 'checkArticleId'],
    ];

    //错误消息
    protected $message = [
        'title.min'       => '最小长度为2',
        'publish_time.date'       => '时间格式错误',
        'is_top.in'            => '置顶选择错误',
        'is_open.in'        => '开启选择错误',
        'cat_id.number'        => '参数错误',
        'article_id.number'        => '参数错误',
    ];

    //验证场景
    protected $scene = [
        'edit' => ['title', 'publish_time', 'is_top', 'is_open', 'cat_id', 'article_id'],
        'add' => ['title', 'publish_time', 'is_top', 'is_open', 'cat_id'],
    ];

    protected function checkCatId($value)
    {
        $r = Db::name('article_cat')->field('cat_id')->where('cat_id', $value)->find();
        if ($r) {
            return true;
        }
        return '分类不存在';
    }

    protected function checkArticleId($value)
    {
        $cat_id = Db::name('article')->field('cat_id')->where('article_id', $value)->find();
        if ($cat_id) {
            return true;
        }
        return '文章不存在';
    }


}
