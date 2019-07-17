<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link rel="stylesheet" href="static/bootstrap-3.3.7/css/bootstrap.css">
    <script type="text/javascript" src="static/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7/js/bootstrap.min.js"></script>	
    <script type="text/javascript" src="js/front.js"></script>
    <link rel="stylesheet" href="css/front.css">
  </head>
  <body>
	<div >
		<ul>
		  	<li style="float: left;"><span class="span1">小明博客</span></li>
		  	<s:set name="name" value="#session.userName"/>
			<s:if test="#name==null">
			<li><a href="Login.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;登录</a></li>
			</s:if>
			<s:else>
				<li style="padding-top: 10px;"><s:property value="#name"/>,欢迎来到小明博客~ <a href="Login.jsp">退出</a></li>
			</s:else>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<li><a href="FrontAbout.jsp"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;关于</a></li>
			<li><a href="leaveWords.jsp"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;留言</a></li>
			<li><a href="BlogPage.jsp"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;博客</a></li>
			<li><a href="frontDesk.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a></li>
		</ul>
	</div>
  </body>
</html>
