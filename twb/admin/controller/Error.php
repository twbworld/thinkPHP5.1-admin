<?php
namespace app\admin\controller;

use think\Controller;//获取配置

/*如果url通过了route规则,实际却没有对应的控制器,则跳转到此空控制器*/
class Error extends Controller
{
    public function initialize()
    {
        $this->error("抱歉!页面出错");
    }
}
