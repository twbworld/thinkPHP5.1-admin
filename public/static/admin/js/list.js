
/*单行点击选中*/
$(document).on('click','#table_id>tbody>tr',function(){
    $(this).toggleClass('trSelected');
});


/*ajax获取table表格*/
function ajax_get_table(url,form_id) {
    layer.load();//"加载中"图标
    $.ajax({
        type: "POST",
        url: url,
        data: form_id?$('#' + form_id).serialize():'',//form序列化
        success: function (data) {
            if (data.code=='0') {
                layer.close(layer.index); //关闭最近弹出的图标
                layer.msg(data.msg, { icon: 5, time: data.wait * 1000, anim: 2, skin: 'layui-layer-molv' });
            }else{
                $("#flexigrid").html('').append(data);
                dataTable_ajax();//dataTable插件初始化
                layer.close(layer.index); //关闭最近弹出的图标
            }
        }
    });
}


/*全选*/
function check_all(obj){
    $(obj).toggleClass('btntrSelected');
    if($(obj).hasClass('btntrSelected')){
        $('#table_id>tbody>tr').addClass('trSelected');
    }else{
        $('#table_id>tbody>tr').removeClass('trSelected');
    }
}


/*弹出层*/
function layer_show(title, url) {
    layer.open({
        type: 2, //2是弹出iframe页
        area: ['900px', '450px'],
        fix: false, //固定
        maxmin: true, //最大/小化按钮
        resize: true, //拉伸
        scrollbar: false, //浏览器滚动条
        shade: 0.6, //遮罩透明度
        title: title,
        content: url,
        cancel: function(index){
            layer.close(index);
            window.location.reload();//关闭iframe页,则刷新页面
        }
    });
}


/*统计多选数量&&实现多种操作*/
function layer_handle(show_url,del_url){
    var ids = '',amount=0;
    $('#table_id .trSelected').each(function(i,o){
        //ids.push($(o).data('id'));
        ids += $(o).data('id')+',';//拼接选中状态的id
        amount++;//选中状态的数量
    });

    if (!del_url) {
        if (amount == 0) {
            layer_show('添加',show_url);//添加数据
        }else if (amount == 1) {
            var show_url_edit=show_url.replace(".html","/"+ids.replace(",","")+".html");
            layer_show('修改',show_url_edit);//修改数据
        }else{
            layer.msg('不支持多条修改!', { icon: 5, time: 2000, anim: 2, skin: 'layui-layer-molv' });
        }
        return false;
    }
    if (amount == 0) {
        layer_show('回收站',show_url);//打开回收站
        return false;
    }
    layer_del_post(ids,amount,del_url); //删除操作
}


/*删除操作*/
function layer_del_post(ids,amount,del_url){
    layer.confirm('<b>'+amount+'</b> 条数据 放进回收站 ?', {
      title:'提示',
      icon: 3,
      btn: ['确定','取消']
    }, function(){
        $.ajax({
            type:'post',
            dataType:'json',
            timeout: 1000,
            url: del_url,
            data:{'act':'del','id':ids},
            success: function (data) {
                if (data.code == 1) {
                    //success弹窗
                    layer.msg(data.msg, { icon: 6, time: data.wait * 1000, anim: 1, skin: 'layui-layer-molv' }, function() {
                        if (data.url) {
                            location.href = data.url;
                        }
                    });
                } else {
                    layer.msg(data.msg, { icon: 5, time: data.wait * 1000, anim: 2, skin: 'layui-layer-molv' });
                }
              },
            error: function (err) {
                layer.msg('网络错误', { icon: 5, time: 1500, anim: 6, skin: 'layui-layer-molv' });
              }
        });
        return false;
    }, function(index){
        layer.close(index);
    });

}



/*按钮开启和关闭*/
function changeTableVal(table,id_name,id_value,field,obj){
    var value=$(obj).hasClass("yes")?0:1;
    $.ajax({
        type:'post',
        dataType:'json',
        timeout: 1000,
        url: "/admintp/Api/changeTableVal",
        data:{'table':table,'id_name':id_name,'id_value':id_value,'field':field,'value':value},
        success: function (data) {
            if (data.code == 1) {
                layer.msg(data.msg, { icon: 6, time: data.wait * 1000, anim: 2, skin: 'layui-layer-molv' });
                $(obj).removeClass();
                value == 1?$(obj).addClass("far fa-check-circle fa-lg yes"):$(obj).addClass("far fa-times-circle fa-lg no");
            } else {
                layer.msg(data.msg, { icon: 5, time: data.wait * 1000, anim: 2, skin: 'layui-layer-molv' });
            }
          },
        error: function (err) {
            layer.msg('网络错误');
          }
    });
    return false;
}

/*input修改*/
function changeTableVal2(table,id_name,id_value,field,obj){
    var value = $(obj).val();
    $.ajax({
        type:'post',
        dataType:'json',
        timeout: 1000,
        url: "/admintp/Api/changeTableVal",
        data:{'table':table,'id_name':id_name,'id_value':id_value,'field':field,'value':value},
        success: function (data) {
            if (data.code == 1) {
                layer.msg(data.msg, { icon: 6, time: data.wait * 1000, anim: 2, skin: 'layui-layer-molv' });
            } else {
                layer.msg(data.msg, { icon: 5, time: data.wait * 1000, anim: 2, skin: 'layui-layer-molv' });
            }
          },
        error: function (err) {
            layer.msg('网络错误');
          }
    });
    return false;
}