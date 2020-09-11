<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>跳转提示</title>
</head>

<body id="mybg" style=" background: #23272b;">
    <div style="display: none;">
        <span><?php echo($code);?></span>
        <p>
            <?php echo(strip_tags($msg));?>
        </p>
        <h1><?php echo($wait);?></h1>
        <a><?php echo($url);?></a>
    </div>
    <script src="__STATIC__/common/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="__STATIC__/admin/js/mybg.js" type="text/javascript"></script>
    <script src="__STATIC__/plugins/layer-v3.1.1/layer.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function() {
        var code = $("span").text() + 5,
            msg = $("p").text(),
            wait = $("h1").text(),
            url = $("a").text();
        layer.msg(msg, { icon: code, time: wait * 1000, anim: 1, skin: 'layui-layer-molv' }, function() {
            parent.location.href = url ? url : '/';
        });

    });
    </script>
</body>

</html>