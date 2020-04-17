<?php
namespace app\admin\controller;

use app\admin\logic\MenuLogic;
use think\facade\Session;

class Index extends Base
{

    protected $beforeActionList = [
        'first',
    ];
    protected function first()
    {

    }

    public function read($id)
    {

    }

    public function index()
    {
        $MenuLogic = new MenuLogic();
        $menu = $MenuLogic->getMenu();
        $admin['user_name']=Session::get('user_name');
        $admin['role_name']=Session::get('role_name');

        $this->assign('menu', $menu);
        $this->assign('admin', $admin);
        return $this->fetch();
    }

    public function welcome()
    {
        return $this->fetch();
    }

}
