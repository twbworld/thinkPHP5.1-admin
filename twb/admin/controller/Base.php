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
 * Author: 当燃
 * Date: 2015-09-09
 */

namespace app\admin\controller;

use app\common\model\SystemMenu; //获取配置
use think\Controller; //数据库
// use think\response\Json;
use think\facade\Request;
use think\facade\Session;
use think\facade\Hook;

class Base extends Controller
{

    public $begin;
    public $end;
    public $page_size = 0;
    public $admin_id = 0;

    /**
     * 析构函数
     */
    public function __construct()
    {
        // session_start(); //session初始化
        header("Cache-control: private"); // history.back返回后输入框值丢失问题 参考文章 http://www.tp-shop.cn/article_id_1465.html  http://blog.csdn.net/qinchaoguang123456/article/details/29852881
        parent::__construct();
        // $upgradeLogic = new UpgradeLogic();
        // $upgradeMsg = $upgradeLogic->checkVersion(); //升级包消息
        // $this->assign('upgradeMsg',$upgradeMsg);
        // //用户中心面包屑导航
        // $navigate_admin = navigate_admin();
        // $this->assign('navigate_admin',$navigate_admin);
        // tpversion();
    }

    /*如果url通过了route规则,实际却没有对应的操作,则使用空操作跳转*/
    public function _empty($name)
    {
        $this->error("抱歉!页面出错");
    }

    /**
     * 初始化操作
     */
    public function initialize()
    {
        // Saas::instance()->checkSso();

        //过滤不需要登陆的行为

        // var_dump(request()->action());exit();
        if (!in_array(request()->action(), array('login', 'vertify'))) {
            if (Session::get('admin_id') > 0) {
                $this->checkPriv(); //检查管理员操作权限
                $this->admin_id = Session::get('admin_id');
            } else {
                (request()->action() == 'index') && $this->redirect('admintp/admin/login');
                $this->error("抱歉!页面出错", '/', '', 1);
            }
        }
        Hook::add('session','app\\admin\\behavior\\adminSession');//绑定"钩子",用于后期写入session
        Hook::add('log','app\\admin\\behavior\\adminLog');//绑定"钩子",用于后期记录日志
        $this->publicAssign();
    }

    /**
     * 保存公告变量到 smarty中
     */
    public function publicAssign()
    {
        if (Request::post('start_time/s')) {
            $begin = Request::post('start_time/s');
            $end = Request::post('end_time/s');
        } else {
            $begin = date('Y-m-d', strtotime("-1 month")); //一个月前
            $end = date('Y-m-d', strtotime('now'));
        }

        $this->assign('start_time', $begin);
        $this->assign('end_time', $end);
        $this->begin = $begin;
        $this->end = date('Y-m-d', strtotime($end) + 86400); //加一天便于取库,注意:如控制器用时间戳范围作为查询条件,则要用+86399
    }

    /*检查操作权限*/
    public function checkPriv()
    {
        $ctl = Request::controller();
        $act = Request::action();
        $act_list = Session::get('act_list');

        //无需验证的操作
        $uneed_check = array('login', 'logout', 'imageUp', 'uploadOne', 'uploadDel', 'vertifyHandle', 'vertify', 'videoUp', 'login_task');
        if ($ctl == 'Index' || $act_list == 'all' || $ctl == 'Wx3rd') {
            //后台首页控制器无需验证,超级管理员无需验证,微信第三方平台控制器无需验证
            return true;
        } elseif (in_array(strtolower($act), array_map('strtolower', $uneed_check))) {
            //部分请求不需要验证权限
            return true;
        } else {
            $res = $this->verifyAction();
            if ($res['status'] == -1) {
                if (Request::isAjax()) {
                    exit(json_encode(['code' => 0, 'msg' => $res['msg'], 'wait' => 3]));
                }
                $this->error($res['msg'], $res['url'], '', 3);
            };
        }
    }

    /*匹配管理员操作权限*/
    private function verifyAction()
    {
        $ctl = Request::controller();
        $act = Request::action();
        $act_list = Session::get('act_list');

        // $right = SystemMenu::where("id", "in", $act_list)->cache(true)->getField('right',true);
        $right = SystemMenu::cache(true)->all($act_list); //获取相关 权限资源

        $role_right = '';
        foreach ($right as $val) {
            $role_right .= $val->right . ','; //拼接所有权限码
        }

        $role_right = explode(',', $role_right);

        //检查是否拥有此操作权限
        if (!in_array(strtolower($ctl . '@' . $act), array_map('strtolower', $role_right))) {
            return ['status' => -1, 'msg' => '您没有操作权限【' . ($ctl . '@' . $act) . '】', 'url' => url('admintp/index/welcome')];
        }
    }

    /**
     * 要验证的ajax
     * @param $act
     * @return bool
     */
/*    private function verifyAjaxRequest($act){
$verifyAjaxArr = ['delGoodsCategory','delGoodsAttribute','delBrand','delGoods'];//默认一般ajax是不设定权限的,这里设定例外的ajax
if(Request::isAjax() && in_array($act,$verifyAjaxArr)){
$res = $this->verifyAction();
if($res['status'] == -1){
return json(['code' => $res['status'], 'msg' => $res['msg'], 'wait' => 2, 'url' => $res['url']]);
}else{
return true;
};
}else{
return true;
}
}*/

}
