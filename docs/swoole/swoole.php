<?php

/**
 *需要修改
*thinkphp\library\think\view\driver\Think.php下的fetch方法
*thinkphp\library\think\Request.php下的pathinfo和path方法
 */
class Swoole
{

    private $http = null;

    public function __construct()
    {
        $this->http  = new \Swoole\Http\Server("php_container_name", 9501);
        $this->http->set([
            'task_worker_num' => 1,
            'worker_num' => 1,
            'enable_coroutine' => true,
            'task_enable_coroutine' => true
        ]);

        $this->http->on('start', [$this, 'onstart']);
        $this->http->on('WorkerStart', [$this, 'onWorkerStart']);
        $this->http->on('request', [$this, 'onrequest']);
        $this->http->on('task', [$this, 'ontask']); //异步
        $this->http->on('finish', [$this, 'onfinish']);

        $this->http->start();
    }

    public function onstart($ws)
    {
        swoole_set_process_name("swoole_process_1"); //指定警车名称,用于reload
    }

    public function onWorkerStart($server, $worker_id)
    {
        define('APP_PATH', __DIR__ . '/../../twb/');
        // 加载基础文件
        require APP_PATH . '../thinkphp/base.php';
    }

    public function onrequest($request, $response)
    {


        $_POST = $_GET = [];
        if (isset($request->server)) {
            foreach ($request->server as $key => $value) {
                $_SERVER[strtoupper($key)] = $value;
            }
        }
        if (isset($request->header)) {
            foreach ($request->header as $key => $value) {
                $_SERVER[strtoupper($key)] = $value;
            }
        }
        if (isset($request->post)) {
            foreach ($request->post as $key => $value) {
                $_POST[$key] = $value;
            }
        }
        if (isset($request->get)) {
            foreach ($request->get as $key => $value) {
                $_GET[$key] = $value;
            }
        }

        $_POST['http_server'] = $this->http; //任何地方可使用: $_POST['http_server']->task()等方法

        ob_start();

        \think\Container::get('app')->path(APP_PATH)->run()->send();

        $res = ob_get_contents();
        ob_end_clean();

        $response->end($res);
    }

    public function ontask($serv, $task)
    {
        $redis = new \Swoole\Coroutine\Redis();
        $redis->connect('redis_container_name', 6379);
        $redis->set($task->data['num'], $task->data['code']);

        return '完成';
    }

    public function onfinish()
    {
    }
}

new Swoole();
