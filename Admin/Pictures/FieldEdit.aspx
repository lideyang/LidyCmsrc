<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="FieldEdit.aspx.cs" Inherits="LidyCms.Web.Admin.Pictures.FieldEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改字段</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />
    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../js/messages_cn.js"></script>
    <script type="text/javascript" src="../js/function.js"></script>
    <script type="text/javascript">
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
<body>
    <form id="form1" runat="server">
    <div class="navigation">
      <span class="back"><a href="FieldList.aspx">返回列表</a></span><b>您当前的位置：首页 &gt; 图文管理 &gt; 修改字段</b>
    </div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th colspan="2" align="left">修改扩展字段</th>
      </tr>
      <tr>
        <td width="25%" align="right">字段标题：</td>
        <td width="75%">
          <asp:TextBox ID="txtTitle" runat="server" CssClass="input required" size="30" 
            maxlength="50" HintTitle="扩展字段的标题" HintInfo="请填写字段的标题，如“规格”，小于50个字符。"></asp:TextBox>
        </td>
       </tr>
       <tr>
        <td width="25%" align="right">字段类型：</td>
        <td width="75%">
          <asp:DropDownList id="ddlFieldType" CssClass="required" runat="server">
              <asp:ListItem Value="">请选择类型</asp:ListItem>
              <asp:ListItem Value="Text">文本</asp:ListItem>
              <asp:ListItem Value="Numeric">数值</asp:ListItem>
            </asp:DropDownList>
        </td>
       </tr>
       <tr>
        <td width="25%" align="right" valign="top">字段说明：</td>
        <td width="75%">
          <asp:TextBox ID="txtFieldRemark" runat="server" TextMode="MultiLine" CssClass="textarea" style="width:300px;height:50px;" HintTitle="扩展字段的说明" MaxLength="250" 
            HintInfo="扩展字段的说明，当用户输入时给予的提示信息，最多250个字符。"></asp:TextBox>
        </td>
       </tr>
       <tr>
        <td width="25%" align="right">是否必填：</td>
        <td width="75%">
          <asp:CheckBox ID="cbIsNull" runat="server" Text="非必填字段" Checked="True" />
        </td>
       </tr>
       <tr>
         <td width="25%" align="right">优先级别：</td>
         <td width="75%">
            <asp:TextBox ID="txtSortId" CssClass="input required number" size="10" runat="server" maxlength="9" HintTitle="扩展字段的排列顺序" HintInfo="纯数字，数字越少越向前。"></asp:TextBox>
         </td>
       </tr>
     </table>
     <div style="margin-top:10px; text-align:center;">
            <asp:Button ID="btnSave" runat="server" Text="确认保存" CssClass="submit" 
                onclick="btnSave_Click" />
&nbsp;&nbsp; 
            <input type="reset" name="button" id="btnReset" value="重 置" class="submit" />
     </div>
    </form>
</body>
</html>
