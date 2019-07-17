<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" isELIgnored="false"%>
 
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<html>
  <head>
<title>修改信息</title>
	<link rel="stylesheet" href="static/bootstrap-3.3.7/css/bootstrap.css">
    <script type="text/javascript" src="static/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7/js/bootstrap.min.js"></script>	
   <link rel="stylesheet" href="css/about.css">	
 </head>
<body>
  		<div class="bodyer">
			<form  method="post" name="form1" action='updateAdmin.action'>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">用户名</span>
					  <input type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1" name="admin.name" value="${admin.name}">	
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">年&nbsp;&nbsp;&nbsp;龄</span>
					  <input type="text" class="form-control" placeholder="年龄" aria-describedby="basic-addon1"  name="admin.age" value="${admin.age}">
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">个性签名</span>
					  <input type="text" class="form-control" placeholder="个性签名" aria-describedby="basic-addon1"name="admin.signature" value="${admin.signature}">
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">爱好</span>
					  <input type="text" class="form-control" placeholder="爱&nbsp;&nbsp;&nbsp;好" aria-describedby="basic-addon1" name="admin.hobby" value="${admin.hobby}">
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">邮箱</span>
					  <input type="text" class="form-control" placeholder="邮&nbsp;&nbsp;&nbsp;箱" aria-describedby="basic-addon1" name="admin.email" value="${admin.email}">
				</div>
				<input type="hidden" name="admin.id" value="${admin.id}">
				<div class="btn1">
					<input type="submit" value="修改" class="btn btn-block btn-primary " style="font-size: 17px;" > 				
				</div>
			</form>
		</div>
</body>
</html>