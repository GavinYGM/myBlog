<%@page import="po.Blog"%>
<%@page import="dao.BlogEditorDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>博客管理</title>
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
  	<%
  		BlogEditorDao bDao=new BlogEditorDao();
  		List<Blog> blogs=bDao.getBlogs();
  		request.setAttribute("nums", blogs.size());
  		request.setAttribute("list",blogs);
  		
  	 %>
	 <div class="divt">
   	   	<div class="alert alert-success" role="alert" style="font-size: 17px;">全部博客:${nums }</div>
   	  </div>
   	  <div class="divtable">
   	   <table class="table table-bordered success table-striped">
		  <thead>
		     <th>序号</th>
		     <th>博客标题</th>
		     <th>时间</th>
		     <th>删除</th>
		  </thead>
		  <tbody>
			<c:forEach items="${list}" var="li" varStatus="st">

			    <tr>
			    	<td>${st.count}</td>
					<td><c:out value="${li.blogName }"/></td>
			        <td><c:out value="${li.date}" /></td>
			        <td><a href="updateBlog.action?blog.blogName=${li.blogName }">
			        <button class="btn btn-success">&nbsp;&nbsp;修&nbsp;&nbsp;改&nbsp;&nbsp;</button></a>
			        <a href="deleteBlog.action?blog.blogName=${li.blogName }">
			        <button class="btn btn-danger">&nbsp;&nbsp;删&nbsp;&nbsp;除&nbsp;&nbsp;</button></a>
			        </td>
			    </tr>
			</c:forEach>			  
		  </tbody>	
	 </div>
  </body>
</html>
