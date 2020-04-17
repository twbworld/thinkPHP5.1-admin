<?php
/**
 *
 * @authors Your Name (you@example.org)
 * @date    2018-12-08
 * @version $Id$
 */
namespace app\admin\controller;

use think\facade\Request;

class Upload extends Base
{

/*文件上传,保存*/
    public function uploadOne()
    {
        $file = request()->file('upload') ? request()->file('upload') : request()->file('file'); //获取文件,PS:'upload'和'file'分别是CKEditor和webuploader上传
        if (!$file) {
            return json(['uploaded' => false, 'url' => '参数错误']);
        }
        $path = 'static/upload/' . date('Ym', time()); //自定义文件保存项目路径
        $info = $file->validate(['size' => 3145728, 'ext' => 'png,jpg,jpeg,gif'])->move($path); //文件验证和保存
        if ($info) {
            $url = str_replace("\\", '/', '/' . $path . '/' . $info->getSaveName()); //组成访问文件的url
            return json(['uploaded' => true, 'url' => $url]);
        } else {
            return json(['uploaded' => false, 'url' => $file->getError()]);
        }

    }

    /*删除文件*/
    public function uploadDel()
    {
        $path = Request::post('path');
        $path = str_replace('../', '/', $path);
        $path = trim($path, '.');

        if (!empty($path) && file_exists('.' . $path)) {
            $filetype = strtolower(strstr($path, '.')); //获取文件类型
            $phpfile = strtolower(strstr($path, '.php')); //是否为php文件
            $erasable_type = array('.png', '.jpg', '.jpeg', '.gif'); //允许的文件类型
            if (!in_array($filetype, $erasable_type) || $phpfile) {
                exit;
            }
            @unlink('.' . $path);
            exit;
        }
        exit;

    }

}
