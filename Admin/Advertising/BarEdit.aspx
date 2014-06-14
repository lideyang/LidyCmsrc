<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="BarEdit.aspx.cs" Inherits="LidyCms.Web.Admin.Advertising.BarEdit" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编辑广告条</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />
    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../js/messages_cn.js"></script>
    <script type="text/javascript" src="../js/jquery.form.js"></script>
    <script type="text/javascript" src="../js/calendar.js"></script>
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
<body style="padding:10px;">
<form id="form1" runat="server">
    <div class="navigation">
      <span class="back"><a href="BarList.aspx?Pid=<%=pid %>">返回列表</a></span><b>您当前的位置：管理中心 &gt; 系统管理 &gt; 编辑广告内容</b>
    </div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th colspan="2" align="left">编辑广告条</th>
      </tr>
      <tr>
        <td width="25%" align="right">所属广告位：</td>
        <td width="75%">
            <asp:Label ID="lblAdTitle" runat="server" Font-Bold="True"></asp:Label>
            </td>
       </tr>
       <tr>
         <td align="right">广告名称：</td>
         <td>
          <asp:TextBox ID="txtTitle" runat="server" CssClass="input w250 required" size="30" 
            maxlength="50" HintTitle="广告标题名称" HintInfo="请填写广告名称以方便标识，如果是文字广告，将直接显示该文字，不能大于50个字符。"></asp:TextBox>
           </td>
        </tr>
       <tr>
         <td align="right">投放时间：</td>
         <td>
                    <asp:TextBox ID="txtStartTime" runat="server" CssClass="input required dateISO" size="20" maxlength="20"
            onclick="return Calendar('txtStartTime');"></asp:TextBox>
           </td>
       </tr>
       <tr>
         <td align="right">到期时间：</td>
         <td>
                    <asp:TextBox ID="txtEndTime" runat="server" CssClass="input required dateISO" size="20" maxlength="20"
            onclick="return Calendar('txtEndTime');"></asp:TextBox>
           </td>
       </tr>
       <tr>
         <td align="right">上传文件：</td>
         <td>
           <asp:TextBox ID="txtImgUrl" runat="server" CssClass="input w380 left"></asp:TextBox>
           <a href="javascript:void(0);" class="files filesbg2"><input type="file" id="FileUpload" name="FileUpload" onchange="SingleUpload('txtImgUrl','FileUpload',0)" /></a>
           <span class="uploading">正在上传，请稍候...</span>
         </td>
       </tr>
       <tr>
         <td align="right">链接地址：</td>
         <td> 
          <asp:TextBox ID="txtLinkUrl" runat="server" CssClass="input w250 url" 
            maxlength="250" HintTitle="广告链接的网址" 
                 HintInfo="请填写广告要链接的网站，选填项，只对文字、图片广告有效，请以“http://”为开头，URL地址长度不可大于250位字符。"></asp:TextBox>
           </td>
       </tr>
       <tr>
         <td align="right">备注(代码)：</td>
         <td> 
          <asp:TextBox ID="txtAdRemark" runat="server" CssClass="textarea" style="width:300px;height:80px;" 
            HintTitle="备注(代码)" HintInfo="选填项，如果该广告位类别是代码，请务必将内容填写在这里，如果该广告位类别是文字、图片、幻灯片、动画、视频，该项可以为空。" TextMode="MultiLine"></asp:TextBox>
           </td>
       </tr>
       <tr>
          <td align="right">优先级别：</td>
          <td>
            <asp:TextBox ID="txtSortId" runat="server" CssClass="input required number" size="10" maxlength="10" HintTitle="广告内容的优先级别" HintInfo="纯数字，数值越小越靠前。">0</asp:TextBox>
          </td>
        </tr>
       <tr>
         <td align="right">活动状态：</td>
         <td>
             <asp:RadioButtonList ID="rblIsLock" runat="server" 
                 RepeatDirection="Horizontal" RepeatLayout="Flow">
                 <asp:ListItem Selected="True" Value="0">正常 </asp:ListItem>
                 <asp:ListItem Value="1">暂停</asp:ListItem>
             </asp:RadioButtonList>
           </td>
       </tr>
     </table>
     <div style="margin-top:10px; text-align:center;">
            <asp:Button ID="btnSave" runat="server" Text="确认保存" CssClass="submit" 
                onclick="btnSave_Click" />
            &nbsp;&nbsp;<input type="reset" name="button" id="btnReset" value="重 置" class="submit" />
     </div>
</form>
</body>
</html>
