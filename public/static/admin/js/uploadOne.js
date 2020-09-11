/**
 * @Author   1174865138@qq.com
 * @DateTime 2019-01-14T22:23:40+0800
 * @param  {string}    upload_url  服务器上传文件地址
 * @param  {string}    input_id    服赋予返回地址的文件id
 * @param  {string}    button_id   选择文件按钮id
 * @param  {string}    father_id   整个上传模块的id
 * @param  {string}    uploadDel_url   服务器删除文件地址
 */
function uploadOne(upload_url, input_id, button_id, father_id, uploadDel_url) {

    times = 0; //全局变量,uploadOne内使用,用于计算文件上传次数
    initial_url = $(input_id).val();

    var uploader = WebUploader.create({
        auto: true, //自动上传
        server: upload_url, // 文件接收服务端。
        // 选择文件的按钮
        pick: {
            id: button_id,
            multiple: false //是否开起同时选择多个文件
        },
        resize: false, //不压缩image,默认压缩jpeg再上传
        //只允许选择的文件
        accept: {
            title: 'Images',
            extensions: 'jpg,jpeg,png,gif',
            mimeTypes: 'image/*'
        },
        //缩略图
        thumb: {
            quality: 1000, // 图片质量
            crop: false, // 是否允许裁剪
            allowMagnify: true, // 是否允许放大
        },
        compress: false, //上传前不进行压缩

    });


    /*创建缩略图*/
    uploader.on('fileQueued', function(file) {
        uploader.makeThumb(file, function(error, src) {
            if (error) {
                $(father_id).find('img').replaceWith('<span>不能预览</span>');
                return;
            }
            $(father_id).find('img').attr('src', src);
        });
    });



    /*进度条*/
    uploader.on('uploadProgress', function(file, percentage) {
        var $percent = $(father_id).find('.progress-bar'),
            $position = $(father_id).find('.position-relative'),
            progress = percentage * 100 + '%';

        // 避免重复创建
        if (!$percent.length) {
            $percent = $('<div class="progress position-absolute w-100 rounded-0"><div class="progress-bar progress-bar-striped progress-bar-animated font-weight-bold text-warning"></div></div>').appendTo($position).find('.progress-bar');
        }

        $percent.css('width', progress).text(progress);
    });



    /*上传成功*/
    uploader.on('uploadSuccess', function(file, respond) {
        var old_url = $(input_id).val(); //上传前的url地址
        if (respond.uploaded) {
            // 第二次上传才执行 删除第一次上传的文件
            if (times > 0 && old_url != initial_url) {
                $.ajax({
                    url: uploadDel_url,
                    data: { path: old_url },
                    dataType: "json",
                    type: "post"
                });
            }
            times++;
            $(input_id).val(respond.url); //给input赋予url值
            $(father_id).find('img').attr('src', respond.url); //更新临时缩略图
            $(father_id).find('.progress-bar').text('上传成功');
        } else {
            $(father_id).find('.progress-bar').text('上传失败').css('width', 'auto');
            $(input_id).val(old_url); //删除缩略图,重回旧图
        }
    });


    /*上传失败*/
    uploader.on('uploadError', function(file) {
        $(father_id).find('.progress-bar').text('上传失败');
    });


}