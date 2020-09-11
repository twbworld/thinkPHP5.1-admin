# 用于修改过项目文件,swoole重新加载
echo "Swoole开始reload"

pid=`pidof server2`
kill -USR1 $pid

echo "Swoole成功reload"
