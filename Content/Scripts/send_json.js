//=====================切换验证码======================
function ToggleCode(obj, codeurl) {
    obj_img = $(obj).children("img").eq(0);
    obj_img.attr("src", codeurl + "?time=" + Math.random());
}
//==================表单AJAX提交封装====================
function AjaxOnSubmit(form_id, btn_id, send_url){
    //表单验证JS
    $("#" + form_id).validate({
        //出错时添加的标签
        errorElement: "span",
        success: function(label) {
            //正确时的样式
            label.text(" ").addClass("success");
        },
        //AJAX提交表单
        submitHandler: function(form) {
            //AJAX提交表单
            $(form).ajaxSubmit({
                beforeSubmit: formRequest,
                success: formResponse,
                error: formError,
                url: send_url,
                type: "post",
                dataType: "json",
                //resetForm: true,
                timeout: 30000
            });
            return false;
        }
    });
    
    //表单提交前
    function formRequest(formData, jqForm, options) {
        $("#" + btn_id).attr("disabled", "disabled");
        $("#" + btn_id).val("提交中...");
    }

    //表单提交后
    function formResponse(data, textStatus) {
        //alert('状态: ' + textStatus + '\n 返回的内容是: \n' + data);
        if (data.msg == 1) {
            $("#" + btn_id).val("提交成功");
            alert(data.msgbox);
        } else {
            alert(data.msgbox);
            $("#" + btn_id).attr("disabled", "");
            $("#" + btn_id).val("再次提交");
        }
    }

    //表单提交出错
    function formError(XMLHttpRequest, textStatus, errorThrown) {
        alert("状态：" + textStatus + "；出错提示：" + errorThrown);
        $("#" + btn_id).attr("disabled", "");
        $("#" + btn_id).val("再次提交");
    }
}