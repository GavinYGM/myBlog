<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>登录</title>
	<link rel="stylesheet" href="static/bootstrap-3.3.7/css/bootstrap.css">
    <script type="text/javascript" src="static/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7/js/bootstrap.min.js"></script>	
    <script type="text/javascript" src="js/login.js"></script>
    <link rel="stylesheet" href="css/login.css">
  </head>
  <body>
		<div class="bodyer">
			<form  method="post" name="form1" action='login.action'>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">用户名</span>
					  <input type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1" id="name" name="user.name" value="${user.name }">	
				</div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">密&nbsp;&nbsp;&nbsp;码</span>
					  <input type="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1" id="psw" name="user.password" value="${user.password }">
				</div>	
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">验证码</span>
					  <input type="text" class="form-control" placeholder="点击图片切换" aria-describedby="basic-addon1" id="code" name="checkCode" value="">
					  <span class="input-group-addon" id="basic-addon2"><img id="image" border="0"  onclick="refresh()"  src="createImageAction.action" title="看不清，换一张"></span>
				</div>	
				<div class="btn1">
					<input type="submit" value="登录" class="btn btn-block btn-primary " style="font-size: 17px;" onclick="return login()" > 				
				</div>
				<div class="span1">
					<a href="register.jsp"><span class="text-primary">没有账号，点击注册</span></a>
				</div>	
			</form>
		</div>
  </body>
</html>
