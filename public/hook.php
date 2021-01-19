<?php
/* 参考 : https://blog.csdn.net/qq_32346189/article/details/82627299 */
$path = '/var/www/html/tp';
$token = '2019122';
if ($_GET['token'] == $token && is_dir($path)) {
    echo shell_exec("cd $path && unset GIT_DIR && git checkout -f && git pull origin master && git checkout master && chown -R apache:apache $path");
} else {
    header("HTTP/1.1 404 Not Found");
}
exit();
