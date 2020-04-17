<?php
namespace app\admin\controller;

use app\admin\logic\ArticleCatLogic;
use app\common\model\Article as ArticleModel;
use app\common\model\ArticleCat;
use think\facade\Request;

class Article extends Base
{
    /**
     *  文章列表页
     */
    public function articleList()
    {
        return $this->fetch();
    }

    /**
     *  ajax文章列表
     */
    public function ajaxArticleList()
    {
        $ArticleModel = ArticleModel::whereBetweenTime('create_time', $this->begin, $this->end)->all(); //模型对象查询,经过了获取器,$this->begin对象位于所继承的base,默认查询前一个月的数据
        $ArticleCat = new ArticleCatLogic();
        $cat = $ArticleCat->articleCatList(0, 0, false); //获取全部分类

        if ($ArticleModel) {
            foreach ($ArticleModel as $val) {
                $val['category'] = $cat[$val['cat_id']]['cat_name']; //匹配文章对应的分类名
                $data[] = $val;
            }
        }

        $this->assign('data', $data);
        return $this->fetch(); //这里是给ajax请求返回整个html模板
    }

    /**
     *  文章添加/修改页面
     */
    public function article()
    {
        $id = Request::param('id/d'); //只能用param()获取url的get参数
        $data = array();
        $act = 'add';

        if ($id) {
            $act = 'edit';
            $data = ArticleModel::get($id);
            if (!$data) {
                $this->error("没有该文章", 'admin/article/articleList', '', 2);
            }
        } else {
            $data['publish_time'] = time();
        }

        $ArticleCat = new ArticleCatLogic();
        $cat = $ArticleCat->articleCatList(0, $data->cat_id); //组装下拉框选项

        $this->assign('data', $data);
        $this->assign('act', $act);
        $this->assign('cat', $cat);
        return $this->fetch();
    }

    /**
     *  文章数据处理
     */
    public function articleHandle()
    {
        // $input=Request::only(['cat_id','text'=>'','icon'=>'','target'=>0,'url'=>'','top'=>0,'enabled'=>1,'act'=>'add'], 'post');
        $input['cat_id'] = Request::post('cat_id/d');
        $input['title'] = Request::post('title/s', ''); //强制转换成字符串,且默认为空字符串,因为数据库设置了这字段不能为null
        $input['link'] = Request::post('link/s', '');
        $input['publish_time'] = Request::post('publish_time/s', date('Y-m-d', time()));
        $input['description'] = Request::post('description/s', '');
        $input['thumb'] = Request::post('thumb/s', '');
        $input['content'] = Request::post('content/s', '');
        $input['is_top'] = Request::post('is_top/d', 0);
        $input['is_open'] = Request::post('is_open/d', 1);
        $input['act'] = Request::post('act/s', 'add');

        $input['article_id'] = $input['act'] == 'del' ? Request::post('id/s', '') : Request::post('id/d');
        $input['article_id'] = rtrim($input['article_id'], ","); //去除最后的","
        //$input['article_id']=explode(",",rtrim($input['article_id'],","));

        if ($input['act'] == 'del') {
            //把字符串转换成数组,判断是否正整数
            foreach (explode(',', $input['article_id']) as $key => $value) {
                if ($value <= 0 || (floor($value) - $value) != 0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            $r = ArticleModel::destroy($input['article_id']); //注意:model用了软删除
        } else {
            if (!$input['publish_time']) {
                $input['publish_time'] = date('Y-m-d', time());
            }
            $result = $this->validate($input, 'Article.' . $input['act']); //验证器
            if (true !== $result) {
                return json(['code' => 0, 'msg' => $result, 'wait' => 2]);
            }

            $ArticleModel = $input['article_id'] > 0 ? ArticleModel::get($input['article_id']) : new ArticleModel; //如果有id则是编辑否则添加,用模型操作数据库,先用get查询
            $r = $ArticleModel->allowField(true)->save($input);
        }

        if (!$r) {
            return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
        }
        return json(['code' => 1, 'msg' => '得左', 'wait' => 2, 'url' => url('admintp/article/articleList')]);

    }

    /*文章回收站*/
    public function articleRecycle()
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
                $r = ArticleModel::destroy($id, true); //永久删除
            } elseif ($act == 'restore') {
                $ArticleModel = new ArticleModel();
                $r = $ArticleModel->restore(['article_id' => $id]); //恢复数据
            }

            if (!$r) {
                return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
            }
            return json(['code' => 1, 'msg' => '得左', 'wait' => 1.5]);
        }

        $ArticleModel = ArticleModel::onlyTrashed()->select(); //只取软删除数据
        $ArticleCat = new ArticleCatLogic();
        $cat = $ArticleCat->articleCatList(0, 0, false); //获取全部分类

        if ($ArticleModel[0]) {
            foreach ($ArticleModel as $val) {
                $val['category'] = $cat[$val['cat_id']]['cat_name']; //匹配文章对应的分类名
                $data[] = $val;

            }
        }

        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     *  文章分类页
     */
    public function categoryList()
    {
        return $this->fetch();
    }

    /**
     *  ajax文章分类列表
     */
    public function ajaxCategoryList()
    {
        $ArticleCat = new ArticleCatLogic();
        $data = $ArticleCat->articleCatList(0, 0, false);

        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     *  文章分类添加/修改
     */
    public function category()
    {

        $id = Request::param('id/d'); //这里奇怪,用只能用param()获取url的get参数
        $data = array();
        $act = 'add';
        $parent_id = '';

        if ($id) {
            $act = 'edit';
            $data = ArticleCat::get($id);
            if (!$data) {
                $this->error("没有该分类", 'admin/article/categoryList', '', 2);
            }
            $parent_id = $data->parent_id;
        }

        $ArticleCat = new ArticleCatLogic();
        $cat = $ArticleCat->articleCatList(0, $parent_id); //组装下拉框选项

        $this->assign('data', $data);
        $this->assign('act', $act);
        $this->assign('cat', $cat);
        return $this->fetch();
    }

    /**
     *  分类数据处理
     */
    public function categoryHandle()
    {
        // $input=Request::only(['cat_id','text'=>'','icon'=>'','target'=>0,'url'=>'','top'=>0,'enabled'=>1,'act'=>'add'], 'post');
        $input['parent_id'] = Request::post('parent_id/d');
        $input['cat_name'] = Request::post('cat_name/s', '');
        $input['sort_order'] = Request::post('sort_order/d', 50);
        $input['cat_desc'] = Request::post('cat_desc/s', '');
        $input['act'] = Request::post('act/s', 'add');

        $input['cat_id'] = $input['act'] == 'del' ? Request::post('id/s', '') : Request::post('id/d');
        $input['cat_id'] = rtrim($input['cat_id'], ","); //去除最后的","
        //$input['article_id'] =explode(",",rtrim($input['article_id'],","));

        if ($input['act'] == 'del') {
            //把字符串转换成数组,判断是否正整数
            foreach (explode(',', $input['cat_id']) as $key => $value) {
                if ($value <= 0 || (floor($value) - $value) != 0) {
                    return json(['code' => 0, 'msg' => '参数错误', 'wait' => 2]);
                }
            }
            $parent_ids = ArticleCat::whereIn('parent_id', $input['cat_id'])->field('cat_name')->select(); //查找是否含有子菜单
            if ($parent_ids[0]) {
                $parent_id = '';
                foreach ($parent_ids as $key => $value) {
                    $parent_id .= '【' . $value["cat_name"] . '】';
                }
                return json(['code' => 0, 'msg' => "含子分类" . $parent_id . ",不得删除!", 'wait' => 3]);
            }
            $r = ArticleCat::destroy($input['cat_id']); //注意:model用了软删除
        } else {
            $data = ArticleCat::get($input['parent_id']);
            if ($data[0]) {
                return json(['code' => 0, 'msg' => '上级分类 选择错误', 'wait' => 2]);
            }
            $ArticleCat = $input['cat_id'] > 0 ? ArticleCat::get($input['cat_id']) : new ArticleCat; //如果有id则是编辑否则添加,用模型操作数据库,先用get查询
            $r = $ArticleCat->allowField(true)->save($input);
        }

        if (!$r) {
            return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
        }
        return json(['code' => 1, 'msg' => '得左', 'wait' => 2, 'url' => url('admintp/article/categoryList')]);

    }

    /*文章分类回收站*/
    public function categoryRecycle()
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
                $r = ArticleCat::destroy($id, true); //永久删除
            } elseif ($act == 'restore') {
                $ArticleCat = new ArticleCat();
                $r = $ArticleCat->restore(['cat_id' => $id]); //恢复数据
            }

            if (!$r) {
                return json(['code' => 0, 'msg' => '死火', 'wait' => 2]);
            }
            return json(['code' => 1, 'msg' => '得左', 'wait' => 1.5]);
        }

        $ArticleCat = ArticleCat::onlyTrashed()->select();
        $ArticleCatLogic = new ArticleCatLogic();
        $cat = $ArticleCatLogic->articleCatList(0, 0, false); //获取全部分类
        if ($ArticleCat[0]) {
            foreach ($ArticleCat as $val) {
                $val['parent_category'] = $cat[$val['parent_id']]['cat_name']; //匹配分类对应的父级分类
                $data[] = $val;
            }
        }

        $this->assign('data', $data);
        return $this->fetch();
    }

}
