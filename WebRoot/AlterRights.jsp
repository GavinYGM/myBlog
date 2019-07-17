<%@page import="po.User"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>修改权限</title>
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
  	request.setCharacterEncoding("utf-8");
  	UserDAO uDao=new UserDAO();
  	List<User> list=uDao.listUser();
  	request.setAttribute("nums", list.size());
	request.setAttribute("list",list);
   %>
   	<div class="divt">
   	   	<div class="alert alert-success" role="alert" style="font-size: 17px;">全部用户:&nbsp;${nums }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击修改权限后，用户将不能评论和留言！！！</div>
   	  </div>
   	  <div class="divtable">
   	   <table class="table table-bordered success table-striped">
		  <thead>
		     <th>序号</th>
		     <th>用户名</th>
		     <th>用户权限</th>
		     <th>修改权限</th>
		  </thead>
		  <tbody>
			<c:forEach items="${list}" var="li" varStatus="st">
			    <tr>
			    	<td>${st.count}</td>
					<td><c:out value="${li.name }"/></td>
					<td><c:out value="${li.rights }"/></td>
			        <td><a href="AlterRights.action?user.name=${li.name}"><button class="btn btn-danger">修改权限</button></a></td>
			    </tr>
			</c:forEach>			  
		  </tbody>	
	 </div>
  </body>
</html>
