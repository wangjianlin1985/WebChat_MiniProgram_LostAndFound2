<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Announce" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Announce announce = (Announce)request.getAttribute("announce");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>修改公告信息信息</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li class="active">公告信息信息修改</li>
	</ul>
		<div class="row"> 
      	<form class="form-horizontal" name="announceEditForm" id="announceEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="announce_announceId_edit" class="col-md-3 text-right">公告编号:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="announce_announceId_edit" name="announce.announceId" class="form-control" placeholder="请输入公告编号" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="announce_announceTitle_edit" class="col-md-3 text-right">公告标题:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="announce_announceTitle_edit" name="announce.announceTitle" class="form-control" placeholder="请输入公告标题">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="announce_announceContent_edit" class="col-md-3 text-right">公告内容:</label>
		  	 <div class="col-md-9">
			    <textarea id="announce_announceContent_edit" name="announce.announceContent" rows="8" class="form-control" placeholder="请输入公告内容"></textarea>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="announce_announceDate_edit" class="col-md-3 text-right">发布日期:</label>
		  	 <div class="col-md-9">
                <div class="input-group date announce_announceDate_edit col-md-12" data-link-field="announce_announceDate_edit" data-link-format="yyyy-mm-dd">
                    <input class="form-control" id="announce_announceDate_edit" name="announce.announceDate" size="16" type="text" value="" placeholder="请选择发布日期" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
			  <div class="form-group">
			  	<span class="col-md-3""></span>
			  	<span onclick="ajaxAnnounceModify();" class="btn btn-primary bottom5 top5">修改</span>
			  </div>
		</form> 
	    <style>#announceEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
   </div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*弹出修改公告信息界面并初始化数据*/
function announceEdit(announceId) {
	$.ajax({
		url :  basePath + "Announce/" + announceId + "/update",
		type : "get",
		dataType: "json",
		success : function (announce, response, status) {
			if (announce) {
				$("#announce_announceId_edit").val(announce.announceId);
				$("#announce_announceTitle_edit").val(announce.announceTitle);
				$("#announce_announceContent_edit").val(announce.announceContent);
				$("#announce_announceDate_edit").val(announce.announceDate);
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*ajax方式提交公告信息信息表单给服务器端修改*/
function ajaxAnnounceModify() {
	$.ajax({
		url :  basePath + "Announce/" + $("#announce_announceId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#announceEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.reload(true);
                $("#announceQueryForm").submit();
            }else{
                alert(obj.message);
            } 
		},
		processData: false,
		contentType: false,
	});
}

$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse > a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
    /*发布日期组件*/
    $('.announce_announceDate_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd',
    	minView: 2,
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
    announceEdit("<%=request.getParameter("announceId")%>");
 })
 </script> 
</body>
</html>

