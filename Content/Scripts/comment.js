//==================评论星级JS监听事件=================
function CommentStar(stars, stars_a, hidStar){
	//var stars = "#comment #stars"; --星级DIV容器
	//var stars_a = "#comment #stars a"; --每个星级的容器
	//var hidStar = "#hidStar"; --隐藏域ID
	
	//鼠标经过
	$(stars_a).bind("mousemove",function(){
		//alert($(stars_a).index($(this)));
		var num = $(stars_a).index($(this)) + 1;
		$(stars).removeClass();
		$(stars).addClass("star star" + num);
	});
	//鼠标离开
	$(stars_a).bind("mouseout",function(){
		var num = $(hidStar).val();
		if(num == ""){
			num = 0;
		}
		$(stars).removeClass();
		$(stars).addClass("star star" + num);
	});
	//鼠标单击
	$(stars_a).bind("click",function(){
		var num = $(stars_a).index($(this)) + 1;
		$(hidStar).val(num);
	});
}
//==================显示分页列表=================
function AjaxCommentList(divId, pageSize, pageCount, sendUrl) {
    //分页参数设置
    //pageIndex -页面索引初始值
    //pageSize -每页显示条数初始化
    //pageCount -取得总页数

    $(function() {
        InitComment(0);//初始化评论数据
        
        $(divId).pagination(pageCount, {
            callback: pageselectCallback,
            prev_text: "« 上一页",
            next_text: "下一页 »",
            items_per_page:pageSize,
            num_display_entries:3,
            current_page:0,
            num_edge_entries:5,
            link_to:"javascript:void(0);"
        });
    });

    //分页点击事件
    function pageselectCallback(page_id, jq) {
        InitComment(page_id);
    }
    //请求评论数据
    function InitComment(page_id) {                                
        $.ajax({ 
            type: "POST",
            dataType: "text",
            url: sendUrl + "&pageSize=" + pageSize + "&pageIndex=" + page_id,
            success: function(data) {
                $("#commentList").html(data);
                $("#comment .item:nth-child(even)").addClass("odd"); //隔行变色
            }
        });
    }
}