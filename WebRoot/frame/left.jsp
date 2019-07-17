<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>菜单页面</title>
	<link rel="stylesheet" href="../static/bootstrap-3.3.7/css/bootstrap.css">
  	<script type="text/javascript" src="../static/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="../static/bootstrap-3.3.7/js/bootstrap.min.js"></script>		
	 <script type="text/javascript" src="../js/index.js"></script>
	 <link rel="stylesheet" href="../css/index.css">
  </head>
</head>
<body>
<div class="dropdown">
  <button class="dropbtn" id="b1"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;  我的博客&nbsp;&nbsp;</button>
	  <div class="dropdown-content" id="d1">
	    <a href="../BlogEditor.jsp" target="content">&nbsp;&nbsp;&nbsp;&nbsp;写博客</a>
	    <a href="../BlogManage.jsp" target="content">&nbsp;&nbsp;&nbsp;&nbsp;博客管理</a>
	    <a href="../MessageManage.jsp"target="content">&nbsp;&nbsp;&nbsp;&nbsp;评论管理</a>
	  </div>
</div>
<div class="dropdown">
  <button class="dropbtn" id="b2"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;  留言管理&nbsp;&nbsp;</button>
	  <div class="dropdown-content" id="d2">
	    <a href="../CommentManage.jsp" target="content">&nbsp;&nbsp;&nbsp;&nbsp;留言管理</a>
	  </div>
</div>
<div class="dropdown">
  <button class="dropbtn" id="b3"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;  关于&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
	  <div class="dropdown-content" id="d3">
	    <a href="../AboutManage.jsp" target="content">&nbsp;&nbsp;&nbsp;&nbsp;修改信息</a>
	  </div>
</div>
<div class="dropdown">
  <button class="dropbtn" id="b4"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;  用户管理&nbsp;&nbsp;</button>
	  <div class="dropdown-content" id="d4">
	    <a href="../AlterRights.jsp" target="content">&nbsp;&nbsp;&nbsp;&nbsp;修改权限</a>
	  </div>
</div>
<div class="dropdown">
  <button class="dropbtn" id="b5"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;  退出登录&nbsp;&nbsp;</button>
	  <div class="dropdown-content" id="d5">
	    <a href="../frontDesk.jsp">&nbsp;&nbsp;&nbsp;&nbsp;退出</a>
	  </div>
</div>
</body>
</html>
