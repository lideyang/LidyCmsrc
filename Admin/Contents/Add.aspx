<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Add.aspx.cs" Inherits="LidyCms.Web.Admin.Contents.Add" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>增加内容</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />
    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../js/messages_cn.js"></script>
    <script type="text/javascript" src="../js/function.js"></script>
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
      <span class="back"><a href="List.aspx">返回列表</a></span><b>您当前的位置：首页 &gt; 内容管理 &gt; 增加内容</b>
    </div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">增加内容</th>
        </tr>
        <tr>
            <td width="15%" align="right">内容标题：</td>
            <td width="85%">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="input w380 required" 
            maxlength="100" minlength="3" HintTitle="增加的内容信息标题" HintInfo="控制在100个字数内，标题文本尽量不要太长。"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">调用标识：</td>
            <td>
            <asp:TextBox ID="txtCallIndex" runat="server" CssClass="input required" size="30" 
            maxlength="50" minlength="3" HintTitle="自定义供调用的标识" HintInfo="可重复，但系统只会提取第一条显示，最好使用英文，如：“about”，控制在50个字数内。"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">所属类别：</td>
            <td><asp:DropDownList id="ddlClassId" CssClass=" required" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right">优先级别：</td>
            <td>
            <asp:TextBox ID="txtSortId" runat="server" CssClass="input required number" size="10" 
            maxlength="10" HintTitle="内容的优先级别" HintInfo="纯数字，数值越小越靠前。">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">内容详细：</td>
            <td>
              <textarea id="txtContent" cols="100" rows="8" style="width:100%;height:400px;visibility:hidden;" runat="server"></textarea>
            </td>
        </tr>
    </table>
    <div style="margin-top:10px;text-align:center;">
  <asp:Button ID="btnSave" runat="server" Text="确认保存" CssClass="submit" onclick="btnSave_Click" 
        />
  &nbsp;
  <input name="重置" type="reset" class="submit" value="重置" />
</div>
    </form>
</body>
</html>
