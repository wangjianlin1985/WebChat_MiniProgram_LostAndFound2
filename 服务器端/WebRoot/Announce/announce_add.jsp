<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/announce.css" />
<div id="announceAddDiv">
	<form id="announceAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">公告标题:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="announce_announceTitle" name="announce.announceTitle" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">公告内容:</span>
			<span class="inputControl">
				<textarea id="announce_announceContent" name="announce.announceContent" rows="6" cols="80"></textarea>

			</span>

		</div>
		<div>
			<span class="label">发布日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="announce_announceDate" name="announce.announceDate" />

			</span>

		</div>
		<div class="operation">
			<a id="announceAddButton" class="easyui-linkbutton">添加</a>
			<a id="announceClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/Announce/js/announce_add.js"></script> 
