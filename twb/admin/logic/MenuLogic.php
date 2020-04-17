<?php
namespace app\admin\logic;

use app\common\model\Menu;

class MenuLogic
{

    /*获取后台菜单栏*/
    public function getMenu()
    {
        // $r = Db::name('menu')->field('id,cat_id,text,icon,target,url,top')->where('enabled', 1)->order('id')->select();//设置了软删除,不能用Db
        $r = Menu::where('enabled', 1)->field('id,cat_id,text,icon,target,url,top')->order('id')->select();

        $menu[0] = array(); //定义数组,避免第一步出错
        $menu[0]['id'] = 233333333; //临时赋值id,避免第三步出错
        //第一步,过滤出"置顶"
        foreach ($r as $key => $value) {
            if ($value->top == 1 && $value->getData('cat_id') !== 0) {
                array_push($menu[0], $value->getData());
            }
        }
        //第二部,过滤出一级菜单
        foreach ($r as $key => $value) {
            if ($value->getData('cat_id') == 0) {
                $value->child = array(); //定义成数组,避免后面程序的报错
                array_push($menu, $value->getData());
            }
        }
        //第三步,判断父子关系并组成数组
        foreach ($menu as $key => $value) {
            foreach ($r as $k => $v) {
                if ($v->getData('cat_id') == $value['id']) {
                    array_push($menu[$key]['child'], $v->getData()); //组成菜单栏的父子关系
                }
            }
        }
        unset($menu[0]['id']); //删除临时赋的值
        return $menu;
    }

}
