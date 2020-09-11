/**
 * @Author   1174865138@qq.com
 * @DateTime 2019-01-14T22:23:02+0800
 * @param  {string} upload_url  服务器上传文件地址
 * @param  {string} editor_id  生成编辑器位置的对应id
 *
 */
function ckeditorInit(upload_url, editor_id) {

    ClassicEditor.create(document.querySelector(editor_id), {
            toolbar: [
                'Undo',//撤销
                'Redo', '|',//重做
                'Heading', '|',//标题
                'FontFamily', //字体
                'FontSize', //字体大小
                'Highlight', //颜色
                'Bold', //粗体
                'Italic', //斜体
                'Underline', //下划线
                'Strikethrough', //删除线
                'Subscript', //下标
                'Superscript', //上标
                'Alignment', '|', //对齐
                'NumberedList', //数字列表
                'BulletedList', //项目列表
                'BlockQuote', //块引用
                'Code', '|', //代码块
                'Link', //链接
                'ImageUpload', //图片上传
                'MediaEmbed', //视频
                'InsertTable', //表格
                'BlockToolbar',//左浮工作栏
            ],
            blockToolbar:[
                'Bold',
                'Italic',
                'Underline',
                'Strikethrough',
                'Subscript',
                'Superscript','|',
                'Link',
                'ImageUpload'
            ],
            image: {
                toolbar: [
                    'ImageStyle:full',
                    'ImageStyle:alignCenter',
                    'ImageStyle:alignLeft',
                    'ImageStyle:alignRight',
                    'ImageStyle:side', '|',
                    'ImageTextAlternative',
                ],
                styles: [
                    'full',
                    'side',
                    'alignLeft',
                    'alignCenter',
                    'alignRight',
                ]
            },
            table: {
                contentToolbar: [
                    'TableRow',
                    'TableColumn',
                    'MergeTableCells'
                ]
            },
            language: 'zh-cn',
            //ckfinder: {uploadUrl: upload_url}//这里是CKeditor最简化的上传文件方法,也可使用适配器的方法
        })
        .then(editor => {
            // 这个地方加载了适配器,上传文件方法,可改用简化的的ckfinder方法
            editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
                return new UploadAdapter(loader, upload_url);
            };
        })
        .catch(error => { console.log(error); });

}


/*上传适配器，参考https://ckeditor.com/docs/ckeditor5/latest/framework/guides/deep-dive/upload-adapter.html*/
class UploadAdapter {
    constructor(loader, upload_url) {
        this.loader = loader;
        this.upload_url = upload_url;
    }
    upload() {
        return new Promise((resolve, reject) => {
            const data = new FormData();
            data.append('upload', this.loader.file);
            data.append('allowSize', 10); //允许图片上传的大小/兆
            $.ajax({
                url: this.upload_url,
                type: 'POST',
                data: data,
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function(data) {
                    data.uploaded ? resolve({ default: data.url }) : layer.msg('请删除,重新上传');
                },
                error: function(err) {
                    layer.msg('网络错误');
                }
            });

        });
    }
    abort() {}
}