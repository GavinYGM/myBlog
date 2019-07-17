<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="po.Comment"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommentDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>留言管理</title>
	<link rel="stylesheet" href="static/bootstrap-3.3.7/css/bootstrap.css">
    <script type="text/javascript" src="static/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7/js/bootstrap.min.js"></script>		
  </head>
	<style>
		.divt{
			margin: 20px 10%;
		}
		.divtable{
			margin:0 20%; 
		}
	</style>  
  <body>
  <c:if test="${empty userlist }">
<%
	CommentDao cDao=new CommentDao();
	List<Comment> userlist=cDao.selectAllList(1, 5);
	request.setAttribute("userlist", userlist);
	Integer pageCount = new Integer(cDao.getPageCount(5));
    request.setAttribute("pageCount",pageCount);
    request.setAttribute("pageNo",1);
 %>
</c:if>
  	<c:if test="${pageCount+1>0}">
	 <div class="divt">
   	   	<div class="alert alert-success" role="alert" style="font-size: 17px;">全部留言：</div>
   	  </div>
   	  <div class="divtable">
   	   <table class="table table-bordered success table-striped">
		  <thead>
		     <th>用户名</th>
		     <th>留言</th>
		     <th>时间</th>
		     <th>删除</th>
		  </thead>
		  <tbody>
	     	<c:forEach items="${userlist}" var="user" >
		      <tr>
		        <td>${user.user}</td>
		        <td>${user.content}</td>
		        <td>${user.date}</td>
		        <td><a href="deleteComment.action?comment.id=${user.id}"><button class="btn btn-danger">&nbsp;&nbsp;删&nbsp;&nbsp;除&nbsp;&nbsp;</button></a></td>
		      </tr>
		  	</c:forEach>		  
		  </tbody>	
	 </div>
	 <br>
</c:if>
共有${pageCount}页，这是第${pageNo}页。
  <c:if test="${pageNo>1}">
    <a href="page.action?pageNo=1">第一页</a>
    <a href="page.action?pageNo=${pageNo-1}">上一页</a>
  </c:if>  
  <c:if test="${pageNo!=pageCount}">
    <a href="page.action?pageNo=${pageNo+1}">下一页</a>
    <a href="page.action?pageNo=${pageCount}">最后一页</a>
  </c:if>
<c:if test="${pageCount==0}">
<p>目前没有记录</p>
</c:if>
  </body>
</html>
