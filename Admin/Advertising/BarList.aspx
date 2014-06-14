<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="BarList.aspx.cs" Inherits="LidyCms.Web.Admin.Advertising.BarList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>广告管理</title>
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
		    link_to:"?<%=CombAdUrlTxt(this.pid, this.keywords) %>&page=__id__"
           });
        });
        
        function pageselectCallback(page_id, jq) {
                //alert(page_id); 回调函数，进一步使用请参阅说明文档
        }
        
        $(function() {
            $(".msgtable tr:nth-child(odd)").addClass("tr_bg"); //隔行变色
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
    <div class="navigation"><span class="add"><a href="BarAdd.aspx?Pid=<%=this.pid %>">增加广告</a></span><b>您当前的位置：管理中心 &gt; 系统管理 &gt; 广告列表</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100" align="center"><b>所属广告位：</b></td>
        <td>
            <asp:Label ID="lblAdTitle" runat="server"></asp:Label>
          </td>
        <td width="50" align="right">关健字：</td>
        <td width="150"><asp:TextBox ID="txtKeywords" runat="server" CssClass="keyword"></asp:TextBox></td>
        <td width="60" align="center">
            <asp:Button ID="btnSelect" runat="server" Text="查询" 
                CssClass="submit" onclick="btnSelect_Click" /></td>
        </tr>
    </table>
    <div class="spClear"></div>
    <asp:Repeater ID="rptList" runat="server" >
    <HeaderTemplate>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="6%">选择</th>
        <th width="25%">广告名称</th>
        <th width="12%">开始时间</th>
        <th width="12%">到期时间</th>
        <th width="10%">链接</th>
        <th width="8%">状态</th>
        <th width="18%">发布时间</th>
        <th width="9%">管理操作</th>
      </tr>
      </HeaderTemplate>
      <ItemTemplate>
      <tr>
        <td align="center"><asp:CheckBox ID="cb_id" CssClass="checkall" runat="server" /><asp:Label ID="lb_id" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label></td>
        <td><a title="查看广告" target="_blank" href="<%#Eval("AdUrl") %>"><%#Eval("Title")%></a></td>
        <td align="center"><%#string.Format("{0:yyyy-MM-dd}", Eval("StartTime"))%></td>
        <td align="center"><%#string.Format("{0:yyyy-MM-dd}", Eval("EndTime"))%></td>
        <td align="center"><a target="_blank" href="<%#Eval("LinkUrl") %>">广告链接</a></td>
        <td align="center"><%#GetAdState(Eval("IsLock").ToString(), Eval("EndTime").ToString())%></td>
        <td align="center"><%#string.Format("{0:g}",Eval("AddTime"))%></td>
        <td align="center"><span><a href="BarEdit.aspx?id=<%#Eval("ID") %>">编辑</a></span></td>
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
                    <asp:LinkButton ID="lbtnDel" runat="server" 
                    OnClientClick="return confirm( '确定要删除这些记录吗？ ');" 
                    onclick="lbtnDel_Click">删 除</asp:LinkButton>&nbsp;<a href="AdvList.aspx">返回广告位</a>
                </span>
            </div>
	</div>
</form>
</body>
</html>
