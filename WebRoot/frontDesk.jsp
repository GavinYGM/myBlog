<%@page import="po.Comment"%>
<%@page import="dao.CommentDao"%>
<%@page import="po.Blog"%>
<%@page import="dao.BlogEditorDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>前台主页</title>
  </head>
  <body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="bodyer">
		<div class="bdleft">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2500">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
			  </ol>
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img src="images/lb1.jpg">
			    </div>
			    <div class="item">
			      <img src="images/lb2.jpg" >
			    </div>
			    <div class="item">
			        <img src="images/lb3.jpg" >
			    </div>
			    <div class="item">
			        <img src="images/lb4.jpg" >
			    </div>
			  </div>
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			  </a>
			</div>
		</div><!-- bdleft -->
		<div class="bdright">
			<div class="logo">
				<img alt="logo" src="images/logo.png" width="90%">
			</div>
			<div class="recentblog">
					<%
						request.setCharacterEncoding("utf-8");
				  		BlogEditorDao bDao=new BlogEditorDao();
				  		Blog blog=bDao.getLatestBlog();
				  		request.setAttribute("blog", blog);
					 %>
				<a href="DisplayBlog.jsp?blogName=${blog.blogName }">
					<center>最新博客</center>
					<center style="color: #352ce2;font-size: 25px;margin: 10px 0;"><span class="glyphicon glyphicon-star"></span>&nbsp;${blog.blogName }</center>
				</a>
			</div>
			<div class="recentliuyan">
				<%
				  		CommentDao cDao=new CommentDao();
				  		Comment com=cDao.getLatestComment();
				  		request.setAttribute("com", com);
					 %>
				<a href="leaveWords.jsp">
					<center>最新留言</center>
					<center style="color: #352ce2;font-size: 25px;margin: 10px 0;"><span class="glyphicon glyphicon-user">&nbsp;${com.user}</span></center>
				</a>
			</div>

		</div><!-- bdright -->
	</div><!-- bodyer -->
	<div class="footer">
		<div class="ftleft">
			<span style="font-size: 25px;color: white;">反馈</span><br><br>
			<span style="font-size: 15px;color: white;">如果您有什么建议或发现了什么bug，可以通过我的邮箱反馈给我</span><br><br>
			<span class="glyphicon glyphicon-envelope" style="font-size: 18px;color: white;">&nbsp;304753882@qq.com</span>
		</div>
		<div class="ftright">
			
		</div>
	</div>
  </body>
</html>
