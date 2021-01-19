<?php
namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;//软删除

class Menu extends Model
{
    use SoftDelete;
    protected $pk = 'id'; //表的主键
    protected $deleteTime = 'delete_time'; //软删除标记字段
    protected $defaultSoftDelete = 0; //软删除标记字段的默认值
    protected $autoWriteTimestamp = true; //自动时间戳开关

    // 模型初始化
    protected static function init()
    {
        //TODO:初始化内容
    }

    public function getcatIdAttr($value)
    {
        if ($value == 0) {
            return '一级';
        }
        $text = $this->field('text')->get($value); //model内使用model
        if ($text['text'] == '' || $text['text'] == null) {
            return '(无分类)';
        }
        return $text['text'];
    }

    /*处理target字段*/
    public function gettargetAttr($value)
    {
        $status = [0 => 'iframe页面 (默认)', 1 => 'iframe页面最大化', 2 => '新页面'];
        return $status[$value];
    }

}
