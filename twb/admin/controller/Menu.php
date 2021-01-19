<?php
namespace app\admin\controller;

use app\common\model\Menu as MenuModel;
use think\facade\Request;

class Menu extends Base
{
    /*菜单列表页*/
    public function menuList()
    {
        return $this->fetch();
    }


    /*ajax菜单列表*/
    public function ajaxMenuList()
    {
        // $data = Db::name('menu')->field('id,cat_id,text,icon,url,target,top,enabled')->order('id desc')->select();
        $data = MenuModel::all(); //模型对象查询,经过了获取器

        $this->assign('data', $data);
        return $this->fetch();

    }

    /*菜单添加/修改页面*/
    public function menu()
    {
        $id = Request::param('id/d'); //这里奇怪,用只能用param()获取url的get参数
        $data = array();

        // $cat = Db::name('menu')->field('id,text')->where('cat_id', 0)->select(); //获取一级菜单
        $cat = MenuModel::where('cat_id', 0)->select();

        $act = 'add';
        if ($id) {
            $act = 'edit';
            $data = MenuModel::get($id); //getData()不会经过获取器
            if (!$data) {
                $this->error("没有该菜单", 'admin/menu/menuList', '', 2);
            }
            //判断当前是否为一级菜单
            if ($data->cat_id == 0) {
                foreach ($cat as $key => $value) {
                    if ($value->id == $data->id) {
                        unset($cat[$key]); //删除本身
                    }
                }
            }
        }
        $this->assign('data', $data->getData());
        $this->assign('act', $act);
        $this->assign('cat', $cat);
        return $this->fetch();
    }

    /*菜单数据处理*/
    public function menuHandle()
    {
        // $input=Request::only(['cat_id','text'=>'','icon'=>'','target'=>0,'url'=>'','top'=>0,'enabled'=>1,'act'=>'add'], 'post');
        $input['cat_id'] = Request::post('cat_id/d');
        $input['text'] = Request::post('text/s', ''); //强制转换成字符串,且默认为空字符串,因为数据库设置了这字段不能为null
        $input['icon'] = Request::post('icon/s', '');
        $input['target'] = Request::post('target/d', 0);
        $input['url'] = Request::post('url/s', '');
        $input['top'] = Request::post('top/d', 0);
        $input['enabled'] = Request::post('enabled/d', 1);
        $input['act'] = Request::post('act/s', 'add');
        $input['__token__'] = Request::post('__token__'); //表单令牌,用于验证器

        $input['id'] = $input['act'] == 'del' ? Request::post('id/s', '') : Request::post('id/d');
        $input['id'] = rtrim($input['id'], ","); //去除最后的","
        // $input['id']     = explode(",",rtrim($input['id'],","));

        if ($input['act'] == 'del') {
            //把字符串转换成数组,判断是否正整数
            foreach (explode(',', $input['id']) as $key => $value) {
                if ($value <= 0 || (floor($value) - $value)!=0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            $cat_ids = MenuModel::whereIn('cat_id', $input['id'])->field('text')->select(); //查找是否含有子菜单
            if ($cat_ids[0]) {
                $cat_id = '';
                foreach ($cat_ids as $key => $value) {
                    $cat_id .= '【' . $value["text"] . '】';
                }
                return json(['code' => 0, 'msg' => "含子菜单" . $cat_id . ",不得删除!", 'wait' => 3]);
            }
            $r = MenuModel::destroy($input['id']); //注意:model用了软删除
        } else {
            $result = $this->validate($input, 'Menu.' . $input['act']); //验证器
            if (true !== $result) {
                return json(['code' => 0, 'msg' => $result, 'wait' => 2]);
            }
            $MenuModel = $input['id'] > 0 ? MenuModel::get($input['id']) : new MenuModel; //如果有id则是编辑否则添加,用模型操作数据库,先用get查询
            $r = $MenuModel->allowField(true)->save($input);
        }

        if (!$r) {
            return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
        }
        return json(['code' => 1, 'msg' => '得左', 'wait' => 2, 'url' => url('admintp/menu/menuList')]);

    }

    /*菜单回收站*/
    public function menuRecycle()
    {
        if (Request::isPost()) {
            $act = Request::post('act/s');
            // $id = rtrim(Request::post('id/s'), ",");
            $id = explode(",", rtrim(Request::post('id/s'), ",")); //去除最后的",",并转换成数组
            //把字符串转换成数组,判断是否正整数
            foreach ($id as $key => $value) {
                if ($value <= 0 || (floor($value) - $value)!=0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            if ($act == 'del') {
                $r = MenuModel::destroy($id, true); //永久删除
            } elseif ($act == 'restore') {
                $MenuModel = new MenuModel();
                $r = $MenuModel->restore(['id' => $id]); //恢复数据
            }

            if (!$r) {
                return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
            }
            return json(['code' => 1, 'msg' => '得左', 'wait' => 1.5]);
        }

        $data = MenuModel::onlyTrashed()->select(); //只取软删除数据

        $this->assign('data', $data);
        return $this->fetch();
    }

}
