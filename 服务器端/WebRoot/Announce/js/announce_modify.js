$(function () {
	$.ajax({
		url : "Announce/" + $("#announce_announceId_edit").val() + "/update",
		type : "get",
		data : {
			//announceId : $("#announce_announceId_edit").val(),
		},
		beforeSend : function () {
			$.messager.progress({
				text : "正在获取中...",
			});
		},
		success : function (announce, response, status) {
			$.messager.progress("close");
			if (announce) { 
				$("#announce_announceId_edit").val(announce.announceId);
				$("#announce_announceId_edit").validatebox({
					required : true,
					missingMessage : "请输入公告编号",
					editable: false
				});
				$("#announce_announceTitle_edit").val(announce.announceTitle);
				$("#announce_announceTitle_edit").validatebox({
					required : true,
					missingMessage : "请输入公告标题",
				});
				$("#announce_announceContent_edit").val(announce.announceContent);
				$("#announce_announceContent_edit").validatebox({
					required : true,
					missingMessage : "请输入公告内容",
				});
				$("#announce_announceDate_edit").datebox({
					value: announce.announceDate,
					required: true,
					showSeconds: true,
				});
			} else {
				$.messager.alert("获取失败！", "未知错误导致失败，请重试！", "warning");
				$(".messager-window").css("z-index",10000);
			}
		}
	});

	$("#announceModifyButton").click(function(){ 
		if ($("#announceEditForm").form("validate")) {
			$("#announceEditForm").form({
			    url:"Announce/" +  $("#announce_announceId_edit").val() + "/update",
			    onSubmit: function(){
					if($("#announceEditForm").form("validate"))  {
	                	$.messager.progress({
							text : "正在提交数据中...",
						});
	                	return true;
	                } else {
	                    return false;
	                }
			    },
			    success:function(data){
			    	$.messager.progress("close");
                	var obj = jQuery.parseJSON(data);
                    if(obj.success){
                        $.messager.alert("消息","信息修改成功！");
                        $(".messager-window").css("z-index",10000);
                        //location.href="frontlist";
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    } 
			    }
			});
			//提交表单
			$("#announceEditForm").submit();
		} else {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		}
	});
});
