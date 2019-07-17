<%@page import="po.Admin"%>
<%@page import="dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
 <head>
<title>修改信息</title>
	<link rel="stylesheet" href="static/bootstrap-3.3.7/css/bootstrap.css">
    <script type="text/javascript" src="static/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7/js/bootstrap.min.js"></script>		
   <link rel="stylesheet" href="css/about.css">	
 </head>

<body>
<%
	AdminDao aDao=new AdminDao();
	Admin admin=aDao.getAdmin("ygm123");
	request.setAttribute("p", admin);
 %>
 		<div class="bodyer">
			<form  method="post" name="form1" action='editAdmin.action'>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">用户名</span>
					  <input type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1" value="${p.name}" disabled="true">	
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">年&nbsp;&nbsp;&nbsp;龄</span>
					  <input type="text" class="form-control" placeholder="年龄" aria-describedby="basic-addon1" value="${p.age}" disabled="true">
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">个性签名</span>
					  <input type="text" class="form-control" placeholder="个性签名" aria-describedby="basic-addon1" value="${p.signature}" disabled="true">
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">爱好</span>
					  <input type="text" class="form-control" placeholder="爱&nbsp;&nbsp;&nbsp;好" aria-describedby="basic-addon1" value="${p.hobby}" disabled="true">
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">邮箱</span>
					  <input type="text" class="form-control" placeholder="邮&nbsp;&nbsp;&nbsp;箱" aria-describedby="basic-addon1" value="${p.email}" disabled="true">
				</div>
				<input type="hidden" name="admin.id" value="${p.id}">
				<div class="btn1">
					<input type="submit" value="修改" class="btn btn-block btn-primary " style="font-size: 17px;" > 				
				</div>
			</form>
		</div>
<br/>
</body>
</html>