// 保存文章
function saveArticle(){
    var arr = [];
    //获取输入的内容 getContent()   (包含和页面相关的标签)
    arr.push(UE.getEditor('editor').getContent());
    var content = arr.join("\n");
    // alert(content);
    
    // 简介 （getContentTxt() 获取纯文本内容，并且只截取前10个字）
    var description = UE.getEditor('editor').getContentTxt().substring(0,10);

    // 保存文章
    $.ajax({
        type : "POST",
        url : '../test/addContent',         //提交内容用这个URL
        data : "content="+content+"&description="+description,
        success  : function(data) {
        	if(data.resultCode != 'success'){
                //成功了就显示详情
                console.log("sssssss"+content);
                window.location.href = "../test/detail";
                autoCloseAlert(data.errorInfo,1000);
				return false;
			}else{
        	    alert("失败哦");
				// 重新添加
				window.location.href = "../test/add";
			}
		}
    });
}

//取消后跳转到add
function cancelSaveArticle(){
	window.location.href = "../test/add";
}