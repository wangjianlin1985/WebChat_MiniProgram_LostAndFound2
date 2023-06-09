<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/announce.css" /> 

<div id="announce_manage"></div>
<div id="announce_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="announce_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="announce_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="announce_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="announce_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="announce_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="announceQueryForm" method="post">
			公告标题：<input type="text" class="textbox" id="announceTitle" name="announceTitle" style="width:110px" />
			发布日期：<input type="text" id="announceDate" name="announceDate" class="easyui-datebox" editable="false" style="width:100px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="announce_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="announceEditDiv">
	<form id="announceEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">公告编号:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="announce_announceId_edit" name="announce.announceId" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">公告标题:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="announce_announceTitle_edit" name="announce.announceTitle" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">公告内容:</span>
			<span class="inputControl">
				<textarea id="announce_announceContent_edit" name="announce.announceContent" rows="8" cols="60"></textarea>

			</span>

		</div>
		<div>
			<span class="label">发布日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="announce_announceDate_edit" name="announce.announceDate" />

			</span>

		</div>
	</form>
</div>
<script type="text/javascript" src="Announce/js/announce_manage.js"></script> 
