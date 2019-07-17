<%@page import="po.Message"%>
<%@page import="dao.MessageDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="po.Blog"%>
<%@page import="dao.BlogEditorDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>显示博客</title>
	<link rel="stylesheet" href="css/blog.css">
  </head>
  <body>
 	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		String blogName=request.getParameter("blogName");	
		if(blogName==null){
			blogName=(String)session.getAttribute("blogName");
		}
		System.out.println("博客名 ："+blogName);
	%>
		
	<%
  		BlogEditorDao bDao=new BlogEditorDao();
  		Blog blog=bDao.getBlog(blogName);
  		request.setAttribute("blog", blog);
  		MessageDao mDao=new MessageDao();
  		List<Message> list=mDao.getMessagesByBlog(blogName);
  		request.setAttribute("list", list);
	 %>
	<div class="leabodyer">
		<div class="disp">
			<div class="panel panel-danger">
			  <div class="panel-heading"><center style="font-size: 30px;"><span class="glyphicon glyphicon-star"></span>&nbsp;${blog.blogName }</center></div>
			  <div class="panel-body">
			    ${blog.text }
			  </div>
			</div>
		</div><br><br>
		<div class="alert alert-info" role="alert" style="font-size: 17px;">对这篇文章您有什么看法呢？</div>
		<form action="addMessage.action">
			<input type="hidden" name="message.blogName" value="${blog.blogName }">
			<textarea  class="form-control" rows="5" name="message.text">说两句呗！！！</textarea><br>
    		<button class="btn btn-warning btn1">&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;</button>
		</form>
    	<br><br><br>	<div class="alert alert-danger" role="alert" style="font-size: 17px;">全部评论:&nbsp;&nbsp;${list.size() }</div>
    	<br>
    	<c:forEach items="${list}" var="li">
			<div class="message"> 
	    		<span class="mesleft"><span class="glyphicon glyphicon-user">&nbsp;${li.userName }</span></span>
	    		<span class="mesright">${li.date}</span><br><br>
	    		<span class="spanmes">${li.text }</span>
	    	</div>
		</c:forEach>
    </div>	
    
	<div class="leafooter">
		<center>© 2018 xiaoming's blog</center>
   		<center>Welcome to visit xiaoming blog</center>
    </div>
	
  </body>
</html>
