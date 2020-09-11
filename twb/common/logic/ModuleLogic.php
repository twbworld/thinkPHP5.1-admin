<?php
/**
 * tpshop
 * ============================================================================
 * 版权所有 2015-2027 深圳搜豹网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.tp-shop.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * 如果商业用途务必到官方购买正版授权, 以免引起不必要的法律纠纷.
 * ============================================================================
 */

namespace app\common\logic;


class ModuleLogic
{
    /**
     * 所有模块
     * @var array
     */
    public $modules = [];



    public function getModules()
    {

        $modules = [
            [
                'name'  => 'admin', 'title' => '平台后台', 'show' => 1,
                'privilege' => [
                    'system'=>'系统设置','content'=>'内容管理','other'=>'其他'
                ],
            ]
        ];
        $this->modules = $modules;

        return $this->modules;
    }

    public function getModule($moduleIdx)
    {
        $modules = $this->getModules();
        return $modules[$moduleIdx];
    }

    public function isModuleExist($moduleIdx)
    {
        return key_exists($moduleIdx, $this->getModules());
    }

    public function getPrivilege($moduleIdx)
    {
        $modules = $this->getModules();
        return $modules[$moduleIdx]['privilege'];
    }
}