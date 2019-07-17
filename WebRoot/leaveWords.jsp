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
	<title>留言</title>
	<link rel="stylesheet" href="css/leave.css">
  </head>
	<%
		String username=(String)session.getAttribute("userName");
		request.setAttribute("user", username);
	 %>
	 	<style>
		.divt{
			margin: 20px 10%;
		}
		.divtable{
			margin:0 20%;
		}
	</style>  
  <body>
  	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
    <div class="leabodyer">
    	<img alt="图片" src="images/liuyan.jpg"><br><br><br><br>
    	  	<form method="post" action="addComment.action">
		  		<input type="hidden" name="comment.user" value="${user }">
			  	<textarea class="form-control" rows="5" name="comment.content">说几句呗！！！</textarea><br><br>
			  	<button class="btn btn-warning btn1">&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;</button>		 
	  		</form>    	
    	<br><br><br><br>	
    	<div class="alert alert-danger" role="alert" style="font-size: 17px;">全部评论:&nbsp;&nbsp;${list.size() }</div>
    	<br><br><br>	
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
		共有${pageCount}页，这是第${pageNo}页。
	  <c:if test="${pageNo>1}">
	    <a href="page1.action?pageNo=1">第一页</a>
	    <a href="page1.action?pageNo=${pageNo-1}">上一页</a>
	  </c:if>  
	  <c:if test="${pageNo!=pageCount}">
	    <a href="page1.action?pageNo=${pageNo+1}">下一页</a>
	    <a href="page1.action?pageNo=${pageCount}">最后一页</a>
	  </c:if>
  	<c:if test="${pageCount+1>0}">
		    <c:forEach items="${userlist}" var="user">
				<div class="message"> 
	    		<span class="mesleft"><span class="glyphicon glyphicon-user">&nbsp;${user.user}</span></span>
	    		<span class="mesright">${user.date}</span><br><br>
	    		<span class="spanmes">${user.content}</span>
	    		</div>
			</c:forEach>
	 <br>
	</c:if>
	<c:if test="${pageCount==0}">
	<p>目前没有记录</p>
	</c:if>
    </div>
    <div class="leafooter">
		<center>© 2018 xiaoming's blog</center>
   		<center>Welcome to visit xiaoming blog</center>
    </div>
  </body>
</html>
