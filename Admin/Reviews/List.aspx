<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="List.aspx.cs" Inherits="LidyCms.Web.Admin.Reviews.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>评论管理</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />
    <link href="../css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.pagination.js"></script>
    <script type="text/javascript" src="../js/function.js"></script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(<%=pcount %>, {
            callback: pageselectCallback,
            prev_text: "« 上一页",
            next_text: "下一页 »",
            items_per_page:<%=pagesize %>,
		    num_display_entries:3,
		    current_page:<%=page %>,
		    num_edge_entries:2,
		    link_to:"?<%=CombUrlTxt(this.kindId, this.parentId, this.keywords, this.property) %>page=__id__"
           });
        });
        function pageselectCallback(page_id, jq) {
           //alert(page_id); 回调函数，进一步使用请参阅说明文档
        }
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
    </script>
</head>
<body style="padding:10px;">
    <form id="form1" runat="server">
    <div class="navigation"><b>您当前的位置：首页 &gt; 评论管理 &gt; 评论列表</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50" align="center">请选择：</td>
        <td>
            <asp:DropDownList ID="ddlKindId" runat="server" CssClass="select" onselectedindexchanged="ddlKindId_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>&nbsp;
            <asp:DropDownList ID="ddlProperty" runat="server" CssClass="select" onselectedindexchanged="ddlProperty_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="">所有属性</asp:ListItem>
                <asp:ListItem Value="isLock">未审核</asp:ListItem>
                <asp:ListItem Value="unIsLock">已审核</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td width="50" align="right">关健字：</td>
        <td width="150"><asp:TextBox ID="txtKeywords" runat="server" CssClass="keyword"></asp:TextBox></td>
        <td width="60" align="center"><asp:Button ID="btnSelect" runat="server" Text="查询" CssClass="submit" onclick="btnSelect_Click" /></td>
        </tr>
    </table>
    <div class="spClear"></div>
    <asp:Repeater ID="rptList" runat="server">
      <HeaderTemplate>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      </HeaderTemplate>
      <ItemTemplate>
      <tr>
        <td class="comment">
          <div class="user">
            <span class="left">[<%#ViewKind(Convert.ToInt32(Eval("KindId")))%>]<asp:HiddenField ID="hidId" Value='<%#Eval("Id")%>' runat="server" /></span>
            <span>网友：<%#Eval("UserName").ToString()%></span>
            <span class="grade<%#Eval("Grade").ToString()%>"></span>
            <span><%#string.Format("{0:g}", Eval("AddTime"))%></span>
          </div>
          <dl class="ask">
            <dt><b><asp:CheckBox ID="cb_id" CssClass="checkall" runat="server" style="position:absolute;top:-3px;left:-2px;" /></b>相关信息：</dt>
            <dd><%# Convert.ToInt32(Eval("IsLock")) == 1 ? "<img src=\"../Images/wsh01.gif\" title=\"未审核\" />" : ""%><%#ViewTitle(Convert.ToInt32(Eval("KindId")), Convert.ToInt32(Eval("ParentId")))%></dd>
          </dl>
          <dl class="answer">
            <dt><b></b>评论内容：</dt>
            <dd><%#Eval("Content").ToString()%></dd>
          </dl>
        </td>
      </tr>
      </ItemTemplate>
      <FooterTemplate>
      </table>
      </FooterTemplate>
      </asp:Repeater>

    <div class="spClear"></div>
        <div style="line-height:30px;height:30px;">
            <div id="Pagination" class="right flickr"></div>
            <div class="left">
                <span class="btn_all" onclick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <asp:LinkButton ID="lbtnAudit" runat="server" onclick="lbtnAudit_Click">审 核</asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnDel" runat="server" 
                    OnClientClick="return confirm( '确定要删除这些记录吗？ ');" onclick="lbtnDel_Click">删 除</asp:LinkButton>
                </span>
            </div>
	</div>
    </form>
</body>
</html>
