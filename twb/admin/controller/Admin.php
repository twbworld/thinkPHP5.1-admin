<?php
namespace app\admin\controller;

use app\common\logic\AdminLogic;
use app\common\logic\ModuleLogic;
use app\common\model\Admin as AdminModel;
use app\common\model\AdminRole;
use app\common\model\SystemMenu;
use think\Db;
use think\facade\Hook;
use think\facade\Request;
use think\facade\Session;
use think\Validate;

class Admin extends Base
{

    /*登录*/
    public function login()
    {

        if (Request::isPost()) {
            /*Request::isPost() && Request::isAjax()*/
            // $input=Request::only(['username'=>0,'password'=>0], 'post');
            $input['verify'] = input('post.verify');
            $input['username'] = input('post.username/s');
            $input['password'] = input('post.password/s');
            $input['__token__'] = input('post.__token__');

            //表单令牌验证
            $validate = Validate::make([
                '__token__' => ['require', 'length:32', 'token'],
            ])->message([
                '__token__.require' => '非法提交',
                '__token__.length' => '非法提交',
                '__token__.token' => '禁止重复提交',
            ]);
            if (!$validate->check($input)) {
                return json(['code' => 0, 'msg' => $validate->getError(), 'wait' => 2]);
            }

            if (empty($input['verify']) || !captcha_check($input['verify'])) {
                return json(['code' => 0, 'msg' => '验证码都打错,斗鸡啊', 'wait' => 2.5]);
            }

            $adminLogic = new AdminLogic;
            $return = $adminLogic->login($input['username'], $input['password']);

            return json($return);
        }
        if (Session::has('admin_id') && Session::get('admin_id') > 0) {
            $this->error("登左仲想登?", 'admintp/index/index', '', 2);
        }
        return $this->fetch();

    }

    /*退登*/
    public function logout()
    {
        $adminLogic = new AdminLogic;
        $adminLogic->logout(Session::get('admin_id'));

        $this->success("退登左啦,翻去训啦", '/', '', 2);
    }

    /*管理员列表页*/
    public function adminList()
    {
        return $this->fetch();
    }

    /*ajax管理员列表*/
    public function ajaxAdminList()
    {
        $data = Db::name('admin')
            ->alias('a')
            ->leftJoin('admin_role r', 'a.role_id = r.role_id AND r.delete_time = 0')
            ->where('a.delete_time = 0')
            ->field('admin_id,user_name,last_login,last_ip,create_time,update_time,role_name')
            ->select();

        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     *  管理员 添加/修改页面
     */
    public function adminInfo()
    {
        $id = Request::param('id/d'); //只能用param()获取url的get参数
        $data = array();
        $act = 'add';

        if ($id) {
            $act = 'edit';
            $data = AdminModel::get($id);
            if (!$data) {
                $this->error("没有该角色", 'admin/admin/adminList', '', 2);
            }
            $data->password = '';
        }
        $role = AdminRole::all();

        $this->assign('data', $data);
        $this->assign('role', $role);
        $this->assign('act', $act);
        return $this->fetch();
    }

    /**
     *  管理员 数据处理
     */
    public function adminHandle()
    {
        $input['user_name'] = Request::post('user_name/s', ''); //强制转换成字符串,且默认为空字符串,因为数据库设置了这字段不能为null
        $input['password'] = Request::post('password/s');
        $input['role_id'] = Request::post('role_id/d');
        $input['__token__'] = Request::post('__token__/s');

        $input['act'] = Request::post('act/s', 'add');

        $input['admin_id'] = $input['act'] == 'del' ? Request::post('id/s', '') : Request::post('id/d');
        $input['admin_id'] = rtrim($input['admin_id'], ","); //去除最后的","

        if ($input['act'] == 'del') {
            //把字符串转换成数组,判断是否正整数
            foreach (explode(',', $input['admin_id']) as $key => $value) {
                if ($value <= 0 || (floor($value) - $value) != 0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
                if ($value == 1) {
                    return json(['code' => 0, 'msg' => '含有禁止删除的管理员', 'wait' => 3]);
                }
            }

            $r = AdminModel::destroy($input['admin_id']); //注意:model用了软删除
            $log = '管理员进回收站,id为 ' . $input['admin_id'];

        } else {
            $result = $this->validate($input, 'admin.' . $input['act']); //验证器
            if (true !== $result) {
                return json(['code' => 0, 'msg' => $result, 'wait' => 2]);
            }

            if ($input['act'] == 'add') {
                $log = '管理员添加,名称为 ' . $input['user_name'];
                unset($input['admin_id']); //如果是添加管理员,则不需要id
            } elseif ($input['admin_id'] == 1) {
                if (Session::get('admin_id') !== 1) {
                    return json(['code' => 0, 'msg' => '无权修改', 'wait' => 2]); //id为1的超级管理员只能亲自操作
                }
                unset($input['role_id']); //id为1的超级管理员不许改角色
            }
            if ($input['act'] == 'edit' && empty($input['password'])) {
                unset($input['password']); //修改管理员时,如果密码为空,默认使用原密码
            } else {
                $input['password'] = encrypt($input['password']); //如果密码不为空则加密
            }

            $AdminModel = $input['admin_id'] > 0 ? AdminModel::get($input['admin_id']) : new AdminModel; //如果有id则是编辑否则添加,用模型操作数据库,先用get查询
            if ($input['act'] == 'edit') {
                if ($input['admin_id'] == 1) {
                    $log = '管理员资料修改,id为 ' . $input['admin_id'];
                    $log .= $AdminModel->user_name == $input['user_name'] ? ' (修改密码)' : ' (名称为"' . $AdminModel->user_name . '"修改为"' . $input['user_name'] . '")'; //id为1的超级管理员专属日志,只能它能修改用户名
                } else {
                    if ($AdminModel->user_name !== $input['user_name']) {
                        return json(['code' => 0, 'msg' => '用户名禁止修改', 'wait' => 2]);
                    } else {
                        $log = '管理员密码修改,id为 ' . $input['admin_id'];
                    }
                }
            }
            $r = $AdminModel->allowField(true)->save($input);
        }

        if (!$r) {
            return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
        }
        Hook::listen('log', $log);
        return json(['code' => 1, 'msg' => '得左', 'wait' => 2, 'url' => url('admintp/admin/adminList')]);

    }

    /*管理员 回收站*/
    public function adminRecycle()
    {
        if (Request::isPost()) {
            $act = Request::post('act/s');
            $id = explode(",", rtrim(Request::post('id/s'), ",")); //去除最后的",",并转换成数组
            //把字符串转换成数组,判断是否正整数
            foreach ($id as $key => $value) {
                if ($value <= 0 || (floor($value) - $value) != 0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            if ($act == 'del') {
                $logs = AdminModel::onlyTrashed()->all($id);
                $log = '管理员从回收站被永久删除,名称为 ';
                foreach ($logs as $key => $user) {
                    $log .= $user->user_name . '和';
                }
                $log = rtrim($log, '和');

                $r = AdminModel::destroy($id, true); //永久删除

            } elseif ($act == 'restore') {
                $AdminModel = new AdminModel();
                $r = $AdminModel->restore(['admin_id' => $id]); //恢复数据
                $log = '管理员从回收站被恢复,id为 ' . Request::post('id/s');
            }

            if (!$r) {
                return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
            }

            Hook::listen('log', $log);
            return json(['code' => 1, 'msg' => '得左', 'wait' => 1.5]);
        }

        $data = AdminModel::onlyTrashed()->select(); //只取软删除数据

        $this->assign('data', $data);
        return $this->fetch();
    }

    /*角色页*/
    public function roleList()
    {
        return $this->fetch();
    }

    /*ajax角色列表*/
    public function ajaxRoleList()
    {
        $data = AdminRole::all();
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     *  角色添加/修改页面
     */
    public function role()
    {
        $id = Request::param('id/d'); //只能用param()获取url的get参数
        $data = array();
        $act = 'add';

        if ($id) {
            $act = 'edit';
            $data = AdminRole::get($id);
            if (!$data) {
                $this->error("没有该角色", 'admin/admin/roleList', '', 2);
            }
            $data['act_list'] = explode(',', $data['act_list']);
        }

        $right = SystemMenu::order('id')->all();
        foreach ($right as $val) {
            $val['enable'] = !empty($data) ? in_array($val['id'], $data['act_list']) : ''; //过滤失效的权限码id,保证角色的每个权限码id都是真实存在的
            $modules[$val['group']][] = $val; //用分组名作为索引,方便前端分组处理
        }
        $group = (new ModuleLogic)->getPrivilege(0); ///获取权限码全部分组名

        $this->assign('data', $data);
        $this->assign('act', $act);
        $this->assign('modules', $modules);
        $this->assign('group', $group);
        return $this->fetch();
    }

    /**
     *  角色 数据处理
     */
    public function roleHandle()
    {
        $input['role_name'] = Request::post('role_name/s', ''); //强制转换成字符串,且默认为空字符串,因为数据库设置了这字段不能为null
        $input['role_desc'] = Request::post('role_desc/s', '');
        $input['act_list'] = Request::post('right/a', array()); //接收数组必须要用/a
        $input['act'] = Request::post('act/s', 'add');
        $input['__token__'] = Request::post('__token__'); //表单令牌,用于验证器

        $input['role_id'] = $input['act'] == 'del' ? Request::post('id/s', '') : Request::post('id/d');
        $input['role_id'] = rtrim($input['role_id'], ","); //去除最后的","

        if ($input['act'] == 'del') {
            //把字符串转换成数组,判断是否正整数
            foreach (explode(',', $input['role_id']) as $key => $value) {
                if ($value <= 0 || (floor($value) - $value) != 0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            $user_names = AdminModel::whereIn('role_id', $input['role_id'])->field('user_name')->select(); //查找是否含有该角色的管理员
            if ($user_names[0]) {
                $user_name = '';
                foreach ($user_names as $key => $value) {
                    $user_name .= '【' . $value["user_name"] . '】';
                }
                return json(['code' => 0, 'msg' => "请先清空所属该角色的管理员" . $user_name, 'wait' => 3]);
            }

            $r = AdminRole::destroy($input['role_id']); //注意:model用了软删除
        } else {
            $result = $this->validate($input, 'Role.' . $input['act']); //验证器
            if (true !== $result) {
                return json(['code' => 0, 'msg' => $result, 'wait' => 2]);
            }

            $input['act_list'] = is_array($input['act_list']) ? implode(',', $input['act_list']) : ''; //数组转字符串

            $AdminRole = $input['role_id'] > 0 ? AdminRole::get($input['role_id']) : new AdminRole; //如果有id则是编辑否则添加,用模型操作数据库,先用get查询
            $r = $AdminRole->allowField(true)->save($input);
        }

        if (!$r) {
            return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
        }
        return json(['code' => 1, 'msg' => '得左', 'wait' => 2, 'url' => url('admintp/admin/roleList')]);

    }

    /*角色 回收站*/
    public function roleRecycle()
    {
        if (Request::isPost()) {
            $act = Request::post('act/s');
            $id = explode(",", rtrim(Request::post('id/s'), ",")); //去除最后的",",并转换成数组
            //把字符串转换成数组,判断是否正整数
            foreach ($id as $key => $value) {
                if ($value <= 0 || (floor($value) - $value) != 0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            if ($act == 'del') {
                $r = AdminRole::destroy($id, true); //永久删除
            } elseif ($act == 'restore') {
                $AdminRole = new AdminRole();
                $r = $AdminRole->restore(['role_id' => $id]); //恢复数据
            }

            if (!$r) {
                return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
            }
            return json(['code' => 1, 'msg' => '得左', 'wait' => 1.5]);
        }

        $data = AdminRole::onlyTrashed()->select(); //只取软删除数据

        $this->assign('data', $data);
        return $this->fetch();
    }

    /*日志页*/
    public function logList()
    {
        return $this->fetch();
    }

    /*ajax日志列表*/
    public function ajaxLogList()
    {
        $time = Request::post('id/s', 'm'); //默认获取本月数据

        $info = Db::name('admin_log')
            ->alias('l')
            ->leftJoin('admin a', 'l.admin_id = a.admin_id')
            ->whereTime('log_time', $time)
            ->field('l.admin_id,log_id,log_info,log_ip,log_url,log_time,user_name,delete_time')
            ->order('log_id desc')
            ->select();
        if (!$info) {
            return json(['code' => 0, 'msg' => '暂无数据', 'wait' => 2]);
        } else {
            $data = array();
            if ($time == 'y') {
                foreach ($info as $key => $value) {
                    $data[date("m-d", $value['log_time'])][] = $value;
                }
            } else {
                foreach ($info as $key => $value) {
                    $data[date("d", $value['log_time'])][] = $value;
                }
            }
        }

        $this->assign('data', $data);
        return $this->fetch();
    }

    /*ajax个人日志列表*/
    public function ajaxOneLogList()
    {
        $id = Request::post('id/d');
        if ($id < 1) {
            return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
        }
        //获取用户个人信息
        $info = Db::name('admin')
            ->alias('a')
            ->leftJoin('admin_role r', 'a.role_id = r.role_id')
            ->where('admin_id', $id)
            ->field('user_name,create_time,role_name,a.delete_time')
            ->find();

        if (!$info) {
            return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
        } else {
            //获取用户日志
            $log = Db::name('admin_log')
                ->where('admin_id', $id)
                ->field('log_info,log_ip,log_url,log_time')
                ->order('log_id desc')
                ->select();

            $data = array();
            foreach ($log as $key => $value) {
                $data[date("m-d", $value['log_time'])][] = $value;
            }
        }

        $this->assign('data', $data);
        $this->assign('info', $info);
        return $this->fetch('ajax_log_list');
    }

}
