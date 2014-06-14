<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Add.aspx.cs" Inherits="LidyCms.Web.Admin.Pictures.Add" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>发布图文</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />
    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../js/messages_cn.js"></script>
    <script type="text/javascript" src="../js/jquery.form.js"></script>
    <script type="text/javascript" src="../js/function.js"></script>
    <script type="text/javascript" src="../js/multipleupload_add.js"></script>
    <script type="text/javascript" src="../../KindEditor/kindeditor.js"></script>
    <script type="text/javascript">
        KE.show({
            id : 'txtContent',
            imageUploadJson : '../../../Tools/upload_json.ashx',
            fileManagerJson : '../../../Tools/file_manager_json.ashx',
            allowFileManager : true
        });
       
        $(function() {
            //表单验证JS
            $("#form1").validate({
                //出错时添加的标签
                errorElement: "span",
                success: function(label) {
                    //正确时的样式
                    label.text(" ").addClass("success");
                }
            });
        });
    </script>
</head>
<body style="padding:10px;">
    <form id="form1" runat="server">
    <div class="navigation">
      <span class="back"><a href="List.aspx">返回列表</a></span><b>您当前的位置：首页 &gt; 图文管理 &gt; 发布图文</b>
    </div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="3" align="left">发布图文信息</th>
        </tr>
        <tr>
            <td width="100" align="right">图文标题：</td>
            <td>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="input w250 required" 
            maxlength="250" minlength="3" HintTitle="发布的图文标题名称" HintInfo="控制在100个字符内，标题文本尽量不要太长。"></asp:TextBox>
            </td>
            <td width="204" rowspan="8" valign="top">
              <div class="imgbox"></div>
              <div class="imgItems">
                <ul></ul>
                <div class="clear"></div>
              </div>
              <div class="line5"></div>
              <div class="filebtn">
                <a class="upfiles"><input type="file" name="FileUpload" id="FileUpload" /></a> <img src="../images/loading2.gif" style="display:none;" id="idProcess" />
              </div>
            </td>
        </tr>
        
        <asp:Repeater ID="rptField" runat="server">
        <ItemTemplate>
        <tr>
            <td align="right"><%#Eval("Title") %>：</td>
            <td>
                <asp:HiddenField ID="hideFieldId" Value='<%#Eval("Id") %>' runat="server" />
                <asp:HiddenField ID="hideFieldTitle" Value='<%#Eval("Title") %>' runat="server" />
                <asp:TextBox ID="txtFieldContent" runat="server" size="30" CssClass='<%# WriteCss(Convert.ToBoolean(Eval("IsNull")), Eval("FieldType").ToString())%>' maxlength="250" HintTitle='<%#Eval("Title") %>' HintInfo='<%#Eval("FieldRemark") %>'></asp:TextBox>
            </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>

        <tr>
            <td align="right">价格：</td>
            <td>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="input required number" size="10" 
            maxlength="10" HintTitle="图文所涉及的价格" HintInfo="货币格式如“150.5”,单位为元，0代表暂无价格。">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">所属类别：</td>
            <td><asp:DropDownList id="ddlClassId" CssClass="required" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" valign="top">图文详细：</td>
            <td>
                <textarea id="txtContent" cols="100" rows="8" style="width:100%;height:400px;visibility:hidden;" runat="server"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">图文属性：</td>
            <td>
                <asp:CheckBoxList ID="cblItem" runat="server" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1">允许评论</asp:ListItem>
                    <asp:ListItem Value="1">置顶</asp:ListItem>
                    <asp:ListItem Value="1">推荐</asp:ListItem>
                    <asp:ListItem Value="1">热点</asp:ListItem>
                    <asp:ListItem Value="1">幻灯</asp:ListItem>
                    <asp:ListItem Value="1">隐藏</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td align="right">浏览次数：</td>
            <td>
            <asp:TextBox ID="txtClick" runat="server" CssClass="input required number" size="10" 
            maxlength="10" HintTitle="图文的浏览次数" HintInfo="纯数字，本图文被浏览的次数。">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">优先级别：</td>
            <td>
            <asp:TextBox ID="txtSortId" runat="server" CssClass="input required number" size="10" 
            maxlength="10" HintTitle="图文的排序数字" HintInfo="纯数字，越小越向前。">0</asp:TextBox>
            </td>
        </tr>
    </table>
    <div style="margin-top:10px;text-align:center;">
      <asp:Button ID="btnSave" runat="server" Text="确认保存" CssClass="submit" onclick="btnSave_Click" />
  &nbsp;
  <input name="重置" type="reset" class="submit" value="重置" />
</div>
    </form>
</body>
</html>
