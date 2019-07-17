<%@page import="po.Blog"%>
<%@page import="dao.BlogEditorDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>博客页面</title>
    <link rel="stylesheet" href="css/blog.css">
  </head>
  <body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<%
  		BlogEditorDao bDao=new BlogEditorDao();
  		List<Blog> blogs=bDao.getBlogs();
  		request.setAttribute("nums", blogs.size());
  		request.setAttribute("list",blogs);		
	 %>
	<div class="leabodyer">
		<div class="alert alert-danger" role="alert" style="font-size: 17px;">全部博客:&nbsp;&nbsp;${nums }</div>
		 <div class="input-group">
		 <form action="searchBlogs.jsp" method="post">
		      <input type="text" class="form-control" placeholder="Search for..." name="blogName" value="">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="submit">搜索</button>
		      </span>		 
		 </form>
	    </div>
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
