<?php
namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;//软删除

class ArticleCat extends Model
{
    use SoftDelete;
    protected $pk = 'cat_id'; //表的主键
    protected $deleteTime = 'delete_time'; //软删除标记字段
    protected $defaultSoftDelete = 0; //软删除标记字段的默认值
    protected $autoWriteTimestamp = true; //自动时间戳开关

    // 模型初始化
    protected static function init()
    {

    }

    public function getdeleteTimeAttr($value)
    {
        return date('Y-m-d H:i:s', $value);
    }

}
