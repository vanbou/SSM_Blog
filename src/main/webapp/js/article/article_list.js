$(function () {
    loadNextPage(99999999999);


//创建ajax加载函数，并设置变量C，用于输入调用的页面频道,请根据实际情况判断使用，非必要。
    function loadNextPage(lastId) {
        $.ajax({
            url: 'loadPageAll',
            type: "get",
            success: function (data) {
                if ($.trim(data) != '') {
                    $("#lastId").remove();
                    $("#content").append(data);
                    $('img').lazyload();
                }
            }
        });
    }
});  
