<%@ page contentType="text/html" pageEncoding="utf-8"%>

<html>
  <head>
  <title>后台管理</title>
   <link rel="stylesheet" href="../css/index.css">
   <script type="text/javascript" src="${pageContext.request.contextPath }/js/ckeditor/ckeditor.js"></script>
  </head>
  <body>
  	<div class="header">
  		<ul>
  			<li style="float: left;"><img src="../images/bg1.jpg" width="60px" height="60px"></li>
  			<li style="float: left;font-size: 27px;"><span>小明博客-后台管理</span></li>
  		</ul>
  	</div>
  	<div class=bodyer>
  		<div class="left">
  			<jsp:include page="left.jsp"></jsp:include>
  		</div>
		<iframe src="right.jsp" scrolling="auto" frameborder="0" name="content" noresize=”noresize” height="100%" width="89%">
  	</div>
  </body>

</html>
