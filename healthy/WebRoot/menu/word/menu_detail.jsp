<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Simple House Template</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
	<link href="../../css/templatemo-style.css" rel="stylesheet" />
	<script type="text/javascript">
			
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
<!--

Simple House

https://templatemo.com/tm-539-simple-house

-->




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
						<div class="col-md-8 col-12">
							<img src="../../img/simple-house-logo.png" alt="Logo" class="tm-site-logo" /> 
							<div class="tm-site-text-box">
								<h1 class="tm-site-title">膳食营养</h1>
								<h6 class="tm-site-description">Dietary Nutrition</h6>	
							</div>
						</div>
						<nav class="col-md-8 col-12 tm-nav">
							<ul class="tm-nav-ul">
								<li class="tm-nav-li"><a href="../../selectMenuByTypeId" class="tm-nav-link">首页</a></li>
								<li class="tm-nav-li"><a href="../../selectMenu" class="tm-nav-link   active">菜谱</a></li>
								<li class="tm-nav-li"><a href="../../selectSuggest?type_id=0" class="tm-nav-link">健康建议</a></li>
								<li class="tm-nav-li"><a href="../../selectChat" class="tm-nav-link">帖子</a></li>
								
								<c:if test="${sessionScope.user!=null}">
									<c:if test="${sessionScope.user.role==1}">
									<li class="tm-nav-li"><a href="../../selectUserView?id=${sessionScope.user.id }" class="tm-nav-link">信息管理</a></li>
									</c:if>
									<c:if test="${sessionScope.user.role==2}">
    								<li class="tm-nav-li"><a href="../../selectUserView2?id=${sessionScope.user.id }" class="tm-nav-link">个人信息</a></li>
    								</c:if>
								</c:if>
								
								<c:if test="${sessionScope.user==null}">
								<li class="tm-nav-li"><a href="../../login?id=${sessionScope.user.id }" class="tm-nav-link">个人信息</a></li>
								</c:if>
								
								<li class="tm-nav-li"><a href="../../selectUserback" class="tm-nav-link">联系我们</a></li>
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