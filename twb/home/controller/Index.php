<?php
namespace app\home\controller;

use think\Controller;
use think\facade\Request;
use think\facade\Cookie;

class Index extends Controller
{
    public function miss()
    {
        $this->error("页面出错!抱歉", '/', '', 2);
    }

    /**
     * @OA\Info(
     *     title="My First APIS [这里](https://www.baidu.com)",
     *     version="1.0",
     *     description="my project 接口文档, V2-3.<br>以后大家就在这里愉快的对接口把!<br>以后大家就在这里愉快的对接口把!"
     * )
     * @OA\Server(
     *     description="hello world",
     *     url="http://www.centos.top"
     * )
     * @OA\ExternalDocumentation(
     *     description="关于项目",
     *     url="http://swagger.io"
     * )
     *
     * @OA\Tag(
     *     name="shop",
     *     description="商城",
     *     @OA\ExternalDocumentation(
     *         description="获取更多商城信息",
     *         url="http://swagger.io"
     *     )
     * )
     * @OA\Tag(
     *     name="user",
     *     description="用户中心",
     *     @OA\ExternalDocumentation(
     *         description="获取更多商城信息",
     *         url="http://swagger.io"
     *     )
     * )
     */



    /**
    * @OA\Schema(
    *     schema="request-user",
    *     required={"name","img"},
    *     @OA\Property(
    *        description="名称",
    *        property="name",
    *        type="string",
    *        maxLength=10,
    *        minLength=3,
    *     ),
    *     @OA\Property(
    *        description="相册",
    *        property="img",
    *        type="array",
    *        default={"a","v"},
    *        @OA\Items(
    *         type="string",
    *         pattern="^[1-9]",
    *        )
    *     ),
    *     @OA\Property(
    *        description="模式",
    *        property="type",
    *        type="string",
    *        enum={"open", "merged", "declined"},
    *        default="merged",
    *     )
    * )
    */

    /**
    * @OA\Schema(
    *     schema="response-home-index-swagger",
    *     required={"status"},
    *     @OA\Property(
    *         description="状态;0:成功;1:失败",
    *         property="status",
    *         type="integer",
    *         example=0,
    *     ),
    *     @OA\Property(
    *         description="数据",
    *         property="data",
    *         ref="#/components/schemas/response-goods"
    *     )
    * )
    */

    /**
    * @OA\Schema(
    *     schema="response-goods",
    *     @OA\Property(
    *         description="商品数据",
    *         property="goods",
    *         type="array",
    *         @OA\Items(
    *             required={"goods_name"},
    *             @OA\Property(
    *                 description="商品名",
    *                 property="goods_name",
    *                 type="string",
    *                 example="",
    *             ),
    *             @OA\Property(
    *                 description="价格",
    *                 property="price",
    *                 type="string",
    *                 example="0.00",
    *             )
    *         )
    *     )
    * )
    */







     /**
     * @OA\Post(
     *    path="/index/swagger.html",
     *    tags={"shop"},
     *    summary="典型接口",
     *    description="# 这是接口描述,支持MD语法",
     *    operationId="home-index-swagger",
     *    @OA\ExternalDocumentation(
     *        description="测试用例地址",
     *        url="http://swagger.io"
     *    ),
     *    @OA\Parameter(
     *        name="X-Requested-With",
     *        in="header",
     *        required=true,
     *        @OA\Schema(type="string"),
     *        description="制造Ajax请求头",
     *        example="XMLHttpRequest",
     *    ),
     *    @OA\RequestBody(
     *        description="Post请求Body,这里比较奇怪,不能发送索引数组",
     *        @OA\MediaType(
     *            mediaType="application/x-www-form-urlencoded",
     *            @OA\Schema(
     *                ref="#/components/schemas/request-user"
     *            )
     *        )
     *    ),
     *
     *    @OA\Response(
     *        response="default",
     *        description="成功",
     *        @OA\Header(
     *            description="设置cookie",
     *            header="set-cookie",
     *            allowEmptyValue=true,
     *            @OA\Schema(
     *                type="string",
     *                example="PHPSESSID=dos17fqe63c98vdfffjt3kjjo7"
     *            ),
     *        ),
     *        @OA\JsonContent(
     *            ref="#/components/schemas/response-home-index-swagger"
     *        )
     *    )
     *
     * )
    */











      /**
      * @OA\Post(
      *    path="/index/swagger.html?id={id}",
      *    tags={"shop","user"},
      *    summary="接口示例",
      *    description="# 这是接口描述,支持MD语法",
      *    operationId="home-index-swagger-id",
      *    @OA\ExternalDocumentation(
      *        description="测试用例地址",
      *        url="http://swagger.io"
      *    ),
      *    @OA\Parameter(
      *        name="id",
      *        in="path",
      *        required=true,
      *        style="form",
      *        example=1,
      *        description="这个值用于url",
      *        @OA\Schema(
      *            type="integer",
      *            format="int64",
      *            minimum=1,
      *            maximum=10
      *        )
      *    ),
      *    @OA\Parameter(
      *        name="id2",
      *        in="query",
      *        required=true,
      *        style="form",
      *        example=2,
      *        description="这个值用于url",
      *        @OA\Schema(type="string"),
      *    ),
      *    @OA\Parameter(
      *        description="传递数组格式",
      *        name="img[]",
      *        in="query",
      *        required=true,
      *        explode=true,
      *        @OA\Schema(
      *            type="array",
      *            default={"ab","cd"},
      *            @OA\Items(
      *                type="string",
      *                enum = {"ab", "bc", "cd"},
      *            )
      *        ),
      *    ),
      *    @OA\Parameter(
      *        name="userid",
      *        in="cookie",
      *        required=true,
      *        example="2",
      *        description="设置cookie;这里比较奇怪,设置不了cookie",
      *        @OA\Schema(type="string"),
      *    ),
      *    @OA\Parameter(
      *        name="X-Requested-With",
      *        in="header",
      *        required=true,
      *        @OA\Schema(type="string"),
      *        description="制造Ajax请求头",
      *        example="XMLHttpRequest",
      *    ),
      *    @OA\RequestBody(
      *        description="Post请求Body",
      *        @OA\MediaType(
      *            mediaType="application/json; charset=UTF-8",
      *            @OA\Schema(
      *                ref="#/components/schemas/request-user"
      *            ),
      *            example={"name": "aaa", "img": {"1","2"}, "type": "open"}
      *        )
      *    ),
      *    security={
      *        {"petstore_auth": {"write:pets", "read:pets"}}
      *    },
      *
      *
      *    @OA\Response(
      *        response="200",
      *        description="成功",
      *        @OA\Header(
      *            description="设置cookie",
      *            header="set-cookie",
      *            allowEmptyValue=true,
      *            @OA\Schema(
      *                type="string",
      *                example="PHPSESSID=dos17fqe63c98vdfffjt3kjjo7"
      *            ),
      *        ),
      *        @OA\JsonContent(
      *            ref="#/components/schemas/response-home-index-swagger"
      *        )
      *    ),
      *    @OA\Response(
      *        response="404",
      *        description="成功",
      *        @OA\JsonContent(
      *            required={"status"},
      *            @OA\Property(
      *                description="状态;0:成功;1:失败",
      *                property="status",
      *                type="integer",
      *                example=1,
      *            ),
      *            @OA\Property(
      *                description="数据",
      *                property="message",
      *                type="string",
      *                example="error",
      *            )
      *        )
      *    )
      *
      * )
     */



     /**
     * @OA\Post(
     *    path="/index/swagger2.html",
     *    deprecated=true,
     *    tags={"user"},
     *    summary="上传文件接口",
     *    description="# 这是接口描述,支持MD语法",
     *    operationId="home-index-swagger-upload",
     *    @OA\ExternalDocumentation(
     *        description="测试用例地址",
     *        url="http://swagger.io"
     *    ),
     *    @OA\Parameter(
     *        name="X-Requested-With",
     *        in="header",
     *        required=true,
     *        @OA\Schema(type="string"),
     *        description="制造Ajax请求头",
     *        example="XMLHttpRequest",
     *    ),
     *    @OA\RequestBody(
     *        description="Post请求Body",
     *        @OA\MediaType(
     *            mediaType="multipart/form-data",
     *            @OA\Schema(
     *                required={"upload_file"},
     *                @OA\Property(
     *                    property="upload_file",
     *                    type="file",
     *                    description="上传文件"
     *                )
     *            )
     *        )
     *    ),
     *
     *    @OA\Response(
     *        response="default",
     *        description="成功",
     *        @OA\Header(
     *            description="设置cookie",
     *            header="set-cookie",
     *            allowEmptyValue=true,
     *            @OA\Schema(
     *                type="string",
     *                example="PHPSESSID=dos17fqe63c98vdfffjt3kjjo7"
     *            ),
     *        ),
     *        @OA\JsonContent(
     *            ref="#/components/schemas/response-home-index-swagger"
     *        )
     *    )
     *
     * )
    */



    public function index()
    {


        $host = "php_container_name";
        $port = 9501;
        $socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP) or die("Could not create socket\n");
        socket_connect($socket, $host, $port) or die("Could not connet server\n");

        $data = 'hello world !';
        socket_write($socket, $data) or die("Write failed\n");
        socket_close($socket);



        $_POST['http_server']->task(['num' => '15521157787', 'code' => '好的']);






        // var_dump('1');exit();

        // $openapi = \OpenApi\scan(APP_PATH . 'home/controller');
        $openapi = \OpenApi\scan(APP_PATH . '../vendor/zircote/swagger-php/Examples/petstore.swagger.io');
        $is_write = file_put_contents(APP_PATH . '../public/swagger_ui/swagger.json', $openapi->toJson(), LOCK_EX);
        $is_write != true && exit('swagger写入json失败');

        // echo $openapi->toYaml();
        // echo $openapi->toJson();

        // echo \think\facade\App::version(); //查看tp版本
        return $this->fetch();
    }


    public function index2()
    {
        // var_dump('1');exit();

        $openapi = \OpenApi\scan(APP_PATH . 'home/controller');
        // $openapi = \OpenApi\scan(APP_PATH . '../vendor/zircote/swagger-php/Examples/petstore-3.0');
        $is_write = file_put_contents(APP_PATH . '../public/swagger_ui/swagger.json', $openapi->toJson(), LOCK_EX);
        $is_write != true && exit('swagger写入json失败');

        // echo $openapi->toYaml();
        // echo $openapi->toJson();

        // echo \think\facade\App::version(); //查看tp版本
        return $this->fetch();
    }



    public function swagger()
    {
        // var_dump(Request::param(''));
        // var_dump(Request::header(''));
        var_dump(Request::get(''));
        var_dump(Request::post(''));
        // var_dump(Request::isAjax());
        exit();

        $data = json_encode(Request::param(''));
        file_put_contents(APP_PATH . 'request.json', $data, FILE_APPEND | LOCK_EX);exit();


        return '{"aa":"as","cv":"dc"}';

    }




}
