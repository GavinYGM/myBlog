<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写博客</title>
	<link rel="stylesheet" href="static/bootstrap-3.3.7/css/bootstrap.css">
    <script type="text/javascript" src="static/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7/js/bootstrap.min.js"></script>		
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="static/jquery-1.12.4.js"></script>
</head>
<script type="text/javascript">
var flag=true;

function editorAjax(){
	flag=true;
	var name = $("#name").val();
	//AJAX异步表单验证
		$.ajax({
			url:"editorajax.action",
			type:"post",	//post请求
			async:"false",	//异步
			data:{"name":name},
			dataType:"text",	//数据格式为文本格式
			success:function(result){
				$("#ed").text(result);
				if(result=="标题不能为空！！！"||result=="该博客已存在！！！"){
					flag=false;
				}
			}
		});
}
function sub(){
	var name = $("#name").val();
	if(name==""){
		flag=false;
	}
	return flag;
}
</script>
<style>
	div.titlediv{
		width: 30%;
		margin: 20px 35%;
	}
	div.btndiv{
		width: 20%;
		margin: 20px 40%;
		
	}
	#ed{
		color: red;
	}
</style>
<body>
	<form action="blogeditor.action" method="post">
		<div class="titlediv">
			<div class="input-group div1 ">
				  <span class="input-group-addon" id="basic-addon1">标题</span>
				  <input type="text" class="form-control"
					  aria-describedby="basic-addon1" placeholder="请输入标题" id="name" name="name" value="${name }"
					  onblur="editorAjax()">
			</div>
			<div id="ed"></div>
		</div>
		<div>
			<textarea name="editor" rows="100"></textarea>
			<script type="text/javascript">CKEDITOR.replace("editor");</script>
		</div>
		<div class="btndiv">
			<input type="submit" value="确  认" class="btn btn-primary " style="font-size: 17px;" onclick="return sub()"> &nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;
			<input type="reset" value="重  写" class="btn btn-primary " style="font-size: 17px;" >
		</div>
	</form>
</body>
</html>