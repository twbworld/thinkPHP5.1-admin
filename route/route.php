<?php
//禁止后台登录页面
Route::rule('admintp/admin/login', 'home/index/miss')->method('get');
//后台登录页面
Route::rule('admintp/:id$', 'admin/admin/login')->ext('login')->pattern(['id' => '[0-9]+'])->method('get')->https(false);
//后台ajax
Route::rule('admintp/:c/:a', 'admin/:c/:a')->ajax()->method('post')->https(false);
//后台页面
Route::rule('admintp/:c/:a', 'admin/:c/:a')->ext('html')->ajax(false)->method('get')->https(false);
//后台图片上传处理
Route::rule('Upload/:a', 'admin/Upload/:a')->method('post')->https(false);

//菜单栏页编辑
Route::rule('admintp/menu/menu/:id', 'admin/menu/menu')->method('get')->pattern(['id' => '[0-9]+']);
//文章页编辑
Route::rule('admintp/article/article/:id', 'admin/article/article')->method('get')->pattern(['id' => '[0-9]+']);
//文章分类编辑
Route::rule('admintp/article/category/:id', 'admin/article/category')->method('get')->pattern(['id' => '[0-9]+']);
//权限码编辑
Route::rule('admintp/system/right/:id', 'admin/system/right')->method('get')->pattern(['id' => '[0-9]+']);
//角色编辑
Route::rule('admintp/admin/role/:id', 'admin/admin/role')->method('get')->pattern(['id' => '[0-9]+']);
//管理员编辑
Route::rule('admintp/admin/admininfo/:id', 'admin/admin/adminInfo')->method('get')->pattern(['id' => '[0-9]+']);



//前台首页
Route::rule('/', 'home/index/index')->method('get')->ext('html')->https(false);
//前台页面
Route::rule(':c/:a', 'home/:c/:a')->ext('html')->https(false);
Route::rule('home/:c/:a', 'home/:c/:a')->method('get')->ext('html')->https(false);

Route::miss('home/index/miss'); //跳转错误页面(相当于开启了强制路由模式)
// Route::resource('admintp', 'admintp/index'); //资源路由
