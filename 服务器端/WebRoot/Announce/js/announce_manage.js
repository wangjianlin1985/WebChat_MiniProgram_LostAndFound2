var announce_manage_tool = null; 
$(function () { 
	initAnnounceManageTool(); //建立Announce管理对象
	announce_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#announce_manage").datagrid({
		url : 'Announce/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "announceId",
		sortOrder : "desc",
		toolbar : "#announce_manage_tool",
		columns : [[
			{
				field : "announceId",
				title : "公告编号",
				width : 70,
			},
			{
				field : "announceTitle",
				title : "公告标题",
				width : 140,
			},
			{
				field : "announceDate",
				title : "发布日期",
				width : 140,
			},
		]],
	});

	$("#announceEditDiv").dialog({
		title : "修改管理",
		top: "50px",
		width : 700,
		height : 515,
		modal : true,
		closed : true,
		iconCls : "icon-edit-new",
		buttons : [{
			text : "提交",
			iconCls : "icon-edit-new",
			handler : function () {
				if ($("#announceEditForm").form("validate")) {
					//验证表单 
					if(!$("#announceEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#announceEditForm").form({
						    url:"Announce/" + $("#announce_announceId_edit").val() + "/update",
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
						    	console.log(data);
			                	var obj = jQuery.parseJSON(data);
			                    if(obj.success){
			                        $.messager.alert("消息","信息修改成功！");
			                        $("#announceEditDiv").dialog("close");
			                        announce_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#announceEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#announceEditDiv").dialog("close");
				$("#announceEditForm").form("reset"); 
			},
		}],
	});
});

function initAnnounceManageTool() {
	announce_manage_tool = {
		init: function() {
		},
		reload : function () {
			$("#announce_manage").datagrid("reload");
		},
		redo : function () {
			$("#announce_manage").datagrid("unselectAll");
		},
		search: function() {
			var queryParams = $("#announce_manage").datagrid("options").queryParams;
			queryParams["announceTitle"] = $("#announceTitle").val();
			queryParams["announceDate"] = $("#announceDate").datebox("getValue"); 
			$("#announce_manage").datagrid("options").queryParams=queryParams; 
			$("#announce_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#announceQueryForm").form({
			    url:"Announce/OutToExcel",
			});
			//提交表单
			$("#announceQueryForm").submit();
		},
		remove : function () {
			var rows = $("#announce_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var announceIds = [];
						for (var i = 0; i < rows.length; i ++) {
							announceIds.push(rows[i].announceId);
						}
						$.ajax({
							type : "POST",
							url : "Announce/deletes",
							data : {
								announceIds : announceIds.join(","),
							},
							beforeSend : function () {
								$("#announce_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#announce_manage").datagrid("loaded");
									$("#announce_manage").datagrid("load");
									$("#announce_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#announce_manage").datagrid("loaded");
									$("#announce_manage").datagrid("load");
									$("#announce_manage").datagrid("unselectAll");
									$.messager.alert("消息",data.message);
								}
							},
						});
					}
				});
			} else {
				$.messager.alert("提示", "请选择要删除的记录！", "info");
			}
		},
		edit : function () {
			var rows = $("#announce_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "Announce/" + rows[0].announceId +  "/update",
					type : "get",
					data : {
						//announceId : rows[0].announceId,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (announce, response, status) {
						$.messager.progress("close");
						if (announce) { 
							$("#announceEditDiv").dialog("open");
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
						}
					}
				});
			} else if (rows.length == 0) {
				$.messager.alert("警告操作！", "编辑记录至少选定一条数据！", "warning");
			}
		},
	};
}
