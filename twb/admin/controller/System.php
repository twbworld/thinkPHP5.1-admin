<?php
namespace app\admin\controller;

use app\common\logic\ModuleLogic;
use app\common\model\SystemMenu;
use think\facade\Request;

class System extends Base
{

    /*权限资源列表*/
    public function rightList()
    {
        return $this->fetch();
    }

    /**
     *  ajax权限列表
     */
    public function ajaxRightList()
    {
        $data = SystemMenu::all();
        $moduleLogic = new ModuleLogic;
        $group = $moduleLogic->getPrivilege(0);

        $this->assign('data', $data);
        $this->assign('group', $group);
        return $this->fetch(); //这里是给ajax请求返回整个html模板
    }

    /*修改添加页*/
    public function right()
    {
        $id = Request::param('id/d'); //只能用param()获取url的get参数
        $data = array();
        $act = 'add';

        if ($id) {
            $data = SystemMenu::get($id);
            if (!$data) {
                $this->error("没有该权限资源", 'admin/system/rightList', '', 2);
            }
            $data->right = explode(',', $data->right);
            $act = 'edit';
        }

        $moduleLogic = new ModuleLogic;
        $group = $moduleLogic->getPrivilege(0);
        $modules = $moduleLogic->getModules();
        $planPath = APP_PATH . $modules[0]['name'] . '/controller'; //这是模块控制器目录
        $planList = array();
        $dirRes = opendir($planPath); //打开目录
        while ($dir = readdir($dirRes)) //读取目录下的文件
        {
            if (!in_array($dir, array('.', '..', '.svn'))) {
                $planList[] = basename($dir, '.php'); //取文件的文件名,去除后缀
            }
        }

        $this->assign('data', $data);
        $this->assign('act', $act);
        $this->assign('group', $group); //"分组"的select选项
        $this->assign('planList', $planList); //"权限码"的select选项
        return $this->fetch();
    }

    /*数据处理*/
    public function rightHandle()
    {
        $input['name'] = Request::post('name/s', ''); //强制转换成字符串,且默认为空字符串,因为数据库设置了这字段不能为null
        $input['group'] = Request::post('group/s', '');
        $input['right'] = Request::post('right/a', array()); //接收数组必须要用/a
        $input['act'] = Request::post('act/s', 'add');
        $input['__token__'] = Request::post('__token__'); //表单令牌,用于验证器

        $input['id'] = $input['act'] == 'del' ? Request::post('id/s', '') : Request::post('id/d');
        $input['id'] = rtrim($input['id'], ","); //去除最后的","

        if ($input['act'] == 'del') {
            //把字符串转换成数组,判断是否正整数
            foreach (explode(',', $input['id']) as $key => $value) {
                if ($value <= 0 || (floor($value) - $value) != 0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            $r = SystemMenu::destroy($input['id']); //注意:model用了软删除
        } else {
            $result = $this->validate($input, 'System.' . $input['act']); //验证器
            if (true !== $result) {
                return json(['code' => 0, 'msg' => $result, 'wait' => 2]);
            }

            $SystemMenu = $input['id'] > 0 ? SystemMenu::get($input['id']) : new SystemMenu; //如果有id则是编辑否则添加,用模型操作数据库,先用get查询
            $input['right'] = implode(',', $input['right']); //数组转字符串
            $r = $SystemMenu->allowField(true)->save($input);
        }

        if (!$r) {
            return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
        }
        return json(['code' => 1, 'msg' => '得左', 'wait' => 2, 'url' => url('admintp/system/rightList')]);

    }

    /*权限回收站*/
    public function rightRecycle()
    {
        if (Request::isPost()) {
            $act = Request::post('act/s');
            // $id = rtrim(Request::post('id/s'), ",");
            $id = explode(",", rtrim(Request::post('id/s'), ",")); //去除最后的",",并转换成数组
            //把字符串转换成数组,判断是否正整数
            foreach ($id as $key => $value) {
                if ($value <= 0 || (floor($value) - $value) != 0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            if ($act == 'del') {
                $r = SystemMenu::destroy($id, true); //永久删除
            } elseif ($act == 'restore') {
                $SystemMenu = new SystemMenu();
                $r = $SystemMenu->restore(['id' => $id]); //恢复数据
            }

            if (!$r) {
                return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
            }
            return json(['code' => 1, 'msg' => '得左', 'wait' => 1.5]);
        }

        $data = SystemMenu::onlyTrashed()->select(); //只取软删除数据
        $moduleLogic = new ModuleLogic;
        $group = $moduleLogic->getPrivilege(0);

        $this->assign('data', $data);
        $this->assign('group', $group);
        return $this->fetch();
    }

    /*ajax获取权限码*/
    public function ajaxGetAction()
    {
        $control = Request::post('controller/s', '');
        $module = (new ModuleLogic)->getModule(0);
        $selectControl = [];
        $className = "app\\" . $module['name'] . "\\controller\\" . $control; //拼接对应的php文件
        $methods = (new \ReflectionClass($className))->getMethods(\ReflectionMethod::IS_PUBLIC); //使用PHP内置的类库,建立 该文件下的类的反射类,获取给定类型的方法
        foreach ($methods as $method) {
            if ($method->class == $className) {
                if ($method->name != '__construct' && $method->name != '_initialize') {
                    $selectControl[] = $method->name; //将方法名加入数组
                }
            }
        }
        return $selectControl;
    }

}
