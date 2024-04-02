<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Simple House - About Page</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <link href="../../css/all.min.css" rel="stylesheet" />
	<link href="../../css/templatemo-style.css" rel="stylesheet" />
	<script type="text/javascript">
	function f1(num)
	{
		document.getElementById("pageNow").value=num;
		
		}
		</script>
<style type="text/css">
.mushow{
width:1000px;
margin-left:100px;
margin-top:25px;
}
span{
float:center;}

</style>
</head>
  
  <body>
    <div class="container">
	<!-- Top box -->
		<!-- Logo & Site Name -->
		<div class="placeholder">
			<div class="parallax-window" data-parallax="scroll" data-image-src="../../img/simple-house-01.jpg">
				<div class="wel">
				    <h3>
				     <c:if test="${sessionScope.user!=null}">
				      <marquee width=200px>欢迎${user.username }进入网站！</marquee>
				       <a href="quit">注销</a>
				     </c:if>
				     <c:if test="${sessionScope.user==null}">
				      请先登录！
				      <a href="login">登录</a>
				     </c:if>
				     
				    </h3>
				</div>
				
				<div class="tm-header">
					<div class="row tm-header-inner">
						<div class="col-md-9 col-12">
							<div class="tm-site-text-box">
								<h1 class="tm-site-title">个人中心</h1>
								<h6 class="tm-site-description"></h6>	
							</div>
						</div>
						<nav class="col-md-10 col-12 tm-nav">
							<ul class="tm-nav-ul">
								<li class="tm-nav-li1"><a href="../../selectUserView2?id=${sessionScope.user.id }" class="tm-nav-link">详细信息</a></li>
								<li class="tm-nav-li1"><a href="../../selectUpByUserId?id=${user.id}" class="tm-nav-link">点赞菜谱</a></li>
								<li class="tm-nav-li1"><a href="../../selectCollectByUserId?id=${user.id}" class="tm-nav-link active">收藏菜谱</a></li>
								<li class="tm-nav-li1"><a href="../../selectChatByUserId?id=${user.id}" class="tm-nav-link">我的帖子</a></li>
								<li class="tm-nav-li1"><a href="../../selectUpChatByUserId?id=${user.id}" class="tm-nav-link">点赞帖子</a></li>
								<li class="tm-nav-li1"><a href="../../selectCollectChatByUserId?id=${user.id}" class="tm-nav-link">收藏帖子</a></li>
								<li class="tm-nav-li1"><a href="../../selectUserbackByUserId?id=${user.id}" class="tm-nav-link">我的反馈</a></li>
								<li class="tm-nav-li1"><a href="../../selectMenuByTypeId" class="tm-nav-link">返回首页</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>
	
		<div class="mushow">
		<center><span>本菜谱点赞数为：${param.upSum}，收藏数为：${param.collectSum}</span></center>
  
		
		<jsp:include page="${param.htm_name}"/>
	</div>	
		
		
				
		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="../../js/jquery.min.js"></script>
	<script src="../../js/parallax.min.js"></script>

</body>
</html>