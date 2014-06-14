<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="List.aspx.cs" Inherits="LidyCms.Web.Admin.Templates.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>模板管理</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />
    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../js/function.js"></script>
    <script type="text/javascript">
        //隔行变色
        $(function() {
            $(".msgtable tr:nth-child(odd)").addClass("tr_bg"); 
            $(".msgtable tr").hover(
			    function() {
			        $(this).addClass("tr_hover_col");
			    },
			    function() {
			        $(this).removeClass("tr_hover_col");
			    }
		    );
        });
        //放大图片
        $(function(){
	        var x = 10;
	        var y = 20;
	        $(".imgtip").mouseover(function(e){
		        this.myTitle = this.title;
		        this.title = "";	
		        var imgtip = "<div id='imgtip'><img src='"+ this.href +"' width='300' alt='预览图'/><\/div>"; //创建 div 元素
		        $("body").append(imgtip);	//把它追加到文档中						 
		        $("#imgtip")
			        .css({
				        "top": (e.pageY+y) + "px",
				        "left":  (e.pageX+x)  + "px"
			        }).show("fast");	  //设置x坐标和y坐标，并且显示
            }).mouseout(function(){
		        this.title = this.myTitle;	
		        $("#imgtip").remove();	 //移除 
            }).mousemove(function(e){
		        $("#imgtip")
			        .css({
				        "top": (e.pageY+y) + "px",
				        "left":  (e.pageX+x)  + "px"
			        });
	        });
        });
    </script>
</head>
<body style="padding:10px;">
<form id="form1" runat="server">
    <div class="navigation"><b>您当前的位置：首页 &gt; 系统管理 &gt; 模板列表</b></div>
    <div class="spClear"></div>
    <asp:Repeater ID="rptList" runat="server" onitemcommand="rptList_ItemCommand" 
        onitemdatabound="rptList_ItemDataBound">
    <HeaderTemplate>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="12%">预览图</th>
        <th align="left">模板名称</th>
        <th width="12%">作者</th>
        <th width="16%">创建日期</th>
        <th width="8%">版本号</th>
        <th width="12%">适用版本</th>
        <th width="10%">操作</th>
      </tr>
      </HeaderTemplate>
      <ItemTemplate>
      <tr>
        <td align="center"><asp:HiddenField ID="hideSkinName" runat="server" Value='<%#Eval("skinname") %>' /><img src="<%#Eval("img")%>" width="45" height="30" class="imgtip" /></td>
        <td><%#Eval("name")%> <%#Eval("skinname").ToString().ToLower() == webset.TemplateSkin ? "<b>[当前模板]</b>" : ""%></td>
        <td align="center"><%#Eval("author")%></td>
        <td align="center"><%#Eval("createdate")%></td>
        <td align="center"><%#Eval("ver")%></td>
        <td align="center"><%#Eval("fordntver")%></td>
        <td align="center">
          <span><asp:LinkButton ID="lbtnStart" CommandName="start" Text="启用模板" runat="server" /></span>
          <span><asp:LinkButton ID="lbtnReMark" CommandName="remark" Text="重新生成" runat="server" Visible="False" OnClientClick="return confirm( '此操作将全部生成模板文件，可能比较耗时，确定要这样做吗？ ');" /></span>
        </td>
      </tr>
      </ItemTemplate>
      <FooterTemplate>
      </table>
      </FooterTemplate>
    </asp:Repeater>
      
</form>
</body>
</html>
