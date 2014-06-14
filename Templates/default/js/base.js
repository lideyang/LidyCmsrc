//搜索查询
function SiteSearch(send_url, divTgs) {
	var str = $.trim($(divTgs).val());
	if (str.length > 0) {
		window.location.href = send_url + "?keyword=" + encodeURI($(divTgs).val());
	}
}

//替换关健字
function ReplaceKeywords(divTgs, keyword){
	var divHtml = $(divTgs).html();
	var reg = new RegExp("\\" + keyword, "g");
	divHtml = divHtml.replace(reg, "<span style=\"color:#F00;font-weight:normal;\">" + keyword + "</span>");
	$(divTgs).html(divHtml);
}

//控制字体大小
function SetFontSize(divTgs, fontSize){
    $(divTgs).css("font-size", fontSize + "px");
    $(divTgs + " a").css("font-size", fontSize + "px");
    $(divTgs + " b").css("font-size", fontSize + "px");
    $(divTgs + " span").css("font-size", fontSize + "px");
    $(divTgs + " p").css("font-size", fontSize + "px");
}

//页面放大缩放
//var _pagesize = 1; //缩位变量
//function TogglePageSize(zoom){
//	switch(zoom)
//	{
//		case "big":
//			_pagesize=_pagesize+2;
//			document.body.style.zoom = 1+_pagesize/100;
//			break
//		case "small":
//			_pagesize=_pagesize-2;
//			if(_pagesize>0){
//				document.body.style.zoom = 1+_pagesize/100;
//			}
//			break
//	}
//}

//======================以下代码适用于一般页面========================
//字体缩放函数
//function ToggleFontSize(divTgs, zoom){
//	var step = 2; //字体放大步长px
//	var minSize = 5; //最小字体px
//	var maxSize = 36; //最大字体px
//	var isRun = true; //保正比例大小
//	//检查整体字体大小
//	$(divTgs).children().each(function(){
//		var _font = parseInt($(this).css("font-size"));
//		if(zoom == "big" && _font >= maxSize){
//			isRun = false;
//			return;
//		}
//		if(zoom == "small" && _font <= minSize){
//			isRun = false;
//			return;
//		}
//	});
//	//执行放大或缩小
//	if(isRun == true){
//		$(divTgs).children().each(function(){
//			var font;
//			switch(zoom)
//			{
//				case "big":
//					font = parseInt($(this).css("font-size")) + step;
//				break
//				case "small":
//					font = parseInt($(this).css("font-size")) - step;
//				break
//			}
//			if(font >= minSize && font <= maxSize){
//				$(this).css("font-size", font + "px");
//			}
//		});
//	}
//};
//==================================================================