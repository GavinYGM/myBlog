<%@page import="dao.BlogEditorDao"%>
<%@page import="po.Blog"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>搜索</title>
	<link rel="stylesheet" href="css/blog.css">
  </head>
  
  <body>
	<%
		String blogName=request.getParameter("blogName");
		BlogEditorDao bDao=new BlogEditorDao();
  		List<Blog> blogs=bDao.searchBlog(blogName);
  		request.setAttribute("nums", blogs.size());
  		request.setAttribute("list",blogs);
	 %>
	 <div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="leabodyer">
		<div class="alert alert-danger" role="alert" style="font-size: 17px;">全部博客:&nbsp;&nbsp;${nums }</div>
    	<c:forEach items="${list}" var="li">
			<div class="blog"> 
	    		<a href="DisplayBlog.jsp?blogName=${li.blogName }">
	    			<center><ins><b>${li.date}</b></ins></center><br>
	    			<center style="font-size: 20px;color: red;"><span class="glyphicon glyphicon-star"></span>&nbsp;${li.blogName }</center>
	    		</a>
	    	</div>
		</c:forEach>
    </div>	
	<div class="leafooter">
		<center>© 2018 xiaoming's blog</center>
   		<center>Welcome to visit xiaoming blog</center>
    </div>
  </body>
</html>
