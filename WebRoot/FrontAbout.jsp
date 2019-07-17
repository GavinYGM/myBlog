<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="po.Admin"%>
<%@page import="dao.AdminDao"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>关于</title>
	<link rel="stylesheet" href="css/about.css">
  </head>
  
  <body>
  
  <%
	AdminDao aDao=new AdminDao();
	Admin admin=aDao.getAdmin("ygm123");
	request.setAttribute("p", admin);
 %>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="aboutbd">
		<img alt="头像" src="images/photo.jpg" width="180px">
		<div class="bdleft">
			<h1>我的介绍</h1>
			<h4>姓名：${p.name }</h4>
			<h4>年龄：${p.age }</h4>
			<h4>爱好：${p.hobby }</h4>
			<h4>个性签名：${p.signature }</h4>			
		</div>
		
		<h1>联系方式</h1>
		<h4>邮箱：${p.email }</h4>
		<h4>QQ：304753882</h4>
		<div class="bdright">
			<img alt="微信" src="images/vx.JPG" width="200px">
		</div>
		
	</div>
	<div class="abfooter">
		<center>© 2018 xiaoming's blog</center>
   		<center>Welcome to visit xiaoming blog</center>
    </div>
  </body>
</html>
