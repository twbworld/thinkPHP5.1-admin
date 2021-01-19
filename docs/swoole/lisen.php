<?php
// Swoole异常监控
while (true) {
    echo (shell_exec('docker top php_container_name | grep swoole_process_1 | wc -l') < 1 ? '异常' : '正常') . PHP_EOL;
    sleep(1);
}
