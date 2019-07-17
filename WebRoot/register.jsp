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
    <script type="text/javascript" src="js/register.js"></script>
  </head>
  <style>
  	*{
  		margin: 0;
  		padding: 0;
  	}
  	body{
	  	background-image: url(images/bg.jpg); 
	  	background-size:cover;	
  	}
  	div.bodyer{
  		position: absolute;
  		top: 30%;
  		left:35%;
  		padding:10px;
  		padding-top:15px;
  		border: 1px solid gray;
  		border-radius:15px;
  		width: 30%;
  		background-color: rgba(0,1,1,0.3);
  	}
	div.div1{
		margin:10px;
		margin-left:17px;
		width: 90%;
	}
  	div.btn1{
		margin: 0 10%;
  		margin-top: 25px;
  		margin-bottom: 40px;
  	}
  	div.span1{
  		font-size: 16px;
  		position: absolute;
  		bottom: 10px;
  		right: 10px;
  	}
  	div.span2{
  		font-size: 16px;
  		position: relative;
  		left: 20px;
  		color: red;
  	}
  </style>

  <body>
		<div class="bodyer">
			<form  method="post" name="form1" action='addUser.action'>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">用户名</span>
					  <input type="text" class="form-control" placeholder="用户名" 
					  aria-describedby="basic-addon1" id="name" name="user.name" value="${user.name }"
					  onblur="loginAjax()">	
				</div>
				<div class="span2"><span id="Divname"></span></div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">密&nbsp;&nbsp;&nbsp;码</span>
					  <input type="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1" id="psw" name="user.password" value="${user.password }">
				</div>	
				<div class="span2"><span id="DivPsw"></span></div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">确认密码</span>
					  <input type="password" class="form-control" placeholder="确认密码" aria-describedby="basic-addon1" id="repsw" value="${user.password }">
				</div>	
				<div class="span2"><span id="DivRepsw"></span></div>
				<div class="input-group div1">
					  <span class="input-group-addon" id="basic-addon1">验证码</span>
					  <input type="text" class="form-control" placeholder="点击图片切换" aria-describedby="basic-addon1" id="code" 
					   name="checkCode" value="" onblur="checkCode1()">
					  <span class="input-group-addon" id="basic-addon2"><img id="image" border="0"  onclick="refresh()"  src="createImageAction.action" title="看不清，换一张"></span>
				</div>	
				<div class="span2"><span id="DivCode"></span></div>
				<div class="btn1">
					<input type="submit" value="注册" class="btn btn-block btn-primary " style="font-size: 17px;" onclick="return jugdesub()"> 				
				</div>
				<div class="span1">
					<a href="Login.jsp"><span class="text-primary">已有账号，点击登录</span></a>
				</div>	
			</form>
		</div>
  </body>
</html>
