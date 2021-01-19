<?php
namespace app\admin\controller;

use think\Db;
use think\facade\Request;

class Api extends Base
{
    /*ajax 修改指定数据,如是否开启的按钮*/
    public function changeTableVal()
    {
        $table = Request::post('table/s'); //表名
        $id_name = Request::post('id_name/s'); //主键
        $id_value = Request::post('id_value/d'); //主键值
        $field = Request::post('field/s'); //字段
        $value = Request::post('value'); //值

        $return = Db::name($table)->where($id_name, $id_value)->update([$field => $value]);
        if (!$return) {
            return json(['code' => 0, 'msg' => "修改失败", 'wait' => 1.5]);
        }
        return json(['code' => 1, 'msg' => "修改成功", 'wait' => 1]);
    }

}
