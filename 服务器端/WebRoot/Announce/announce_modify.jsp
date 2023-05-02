<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/announce.css" />
<div id="announce_editDiv">
	<form id="announceEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">公告编号:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="announce_announceId_edit" name="announce.announceId" value="<%=request.getParameter("announceId") %>" style="width:200px" />
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
		<div class="operation">
			<a id="announceModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/Announce/js/announce_modify.js"></script> 
