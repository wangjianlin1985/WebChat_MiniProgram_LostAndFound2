$(function () {
	$("#announce_announceTitle").validatebox({
		required : true, 
		missingMessage : '请输入公告标题',
	});

	$("#announce_announceContent").validatebox({
		required : true, 
		missingMessage : '请输入公告内容',
	});

	$("#announce_announceDate").datebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	//单击添加按钮
	$("#announceAddButton").click(function () {
		//验证表单 
		if(!$("#announceAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		} else {
			$("#announceAddForm").form({
			    url:"Announce/add",
			    onSubmit: function(){
					if($("#announceAddForm").form("validate"))  { 
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
                    //此处data={"Success":true}是字符串
                	var obj = jQuery.parseJSON(data); 
                    if(obj.success){ 
                        $.messager.alert("消息","保存成功！");
                        $(".messager-window").css("z-index",10000);
                        $("#announceAddForm").form("clear");
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    }
			    }
			});
			//提交表单
			$("#announceAddForm").submit();
		}
	});

	//单击清空按钮
	$("#announceClearButton").click(function () { 
		$("#announceAddForm").form("clear"); 
	});
});
