<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <link href="css/all.min.css" rel="stylesheet" />
	<link href="css/templatemo-style.css" rel="stylesheet" />
	<style type="text/css">
.img-fluid {
  max-width: 50%;
  height:350px;
  width:300px;
  object-fit:cover;
}
.tm-person-description {
  padding-left: 20px;
  padding-right: 20px;
}
.tm-person-name {
  font-size: 1.8rem;
  font-weight: 550;
  color: #09C;
  margin-bottom: 10px;
  margin-top: 10px;
  margin-left:15px;
}
.tm-person-title {
  color: #C39;
  margin-bottom: 20px;
  margin-left:15px;
  font-size: 1.2rem;
}
.tm-person-about {
  margin-bottom: 20px;
  margin-left:15px;
  text-decoration: none;
  font-size: 1.2rem;
}
.tm-social-link {
  color: #626364;
  display: inline-block;
  border-radius: 1px;
  background-color: transparent;
  font-size: 1.6rem;
  text-decoration: none;
  width: 50px;
  height: 50px;
  margin-right: 0;
  margin-bottom: 15px;
}
.tm-social-link:hover {
  color: white;
  background-color: #626364;
}

.tm-social-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
}
.a{
	text-decoration: none;
}
.a:hover {
	text-decoration: underline;
  	color: #C39;
}


	</style>
</head>
  
  <body>
    <div class="container">
	<!-- Top box -->
		<!-- Logo & Site Name -->
		<div class="placeholder">
			<div class="parallax-window" data-parallax="scroll" data-image-src="img/simple-house-01.jpg">
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
								<li class="tm-nav-li1"><a href="selectUserView2?id=${sessionScope.user.id }" class="tm-nav-link active">详细信息</a></li>
								<li class="tm-nav-li1"><a href="selectUpByUserId?id=${user.id}" class="tm-nav-link">点赞菜谱</a></li>
								<li class="tm-nav-li1"><a href="selectCollectByUserId?id=${user.id}" class="tm-nav-link">收藏菜谱</a></li>
								<li class="tm-nav-li1"><a href="selectChatByUserId?id=${user.id}" class="tm-nav-link">我的帖子</a></li>
								<li class="tm-nav-li1"><a href="selectUpChatByUserId?id=${user.id}" class="tm-nav-link">点赞帖子</a></li>
								<li class="tm-nav-li1"><a href="selectCollectChatByUserId?id=${user.id}" class="tm-nav-link">收藏帖子</a></li>
								<li class="tm-nav-li1"><a href="selectUserbackByUserId?id=${user.id}" class="tm-nav-link">我的反馈</a></li>
								<li class="tm-nav-li1"><a href="selectMenuByTypeId" class="tm-nav-link">返回首页</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>

		<main>
			<header class="row tm-welcome-section">
				<!-- <h2 class="col-12 text-center tm-section-title">个人中心</h2>
				<p class="col-12 text-center">欢迎进入个人中心，
				这里是你的个人信息，你的喜欢、收藏和评论的作品可在此处查到</p> -->
			</header>
		
		<div class="tm-container-inner tm-persons">
				<div class="row">
					<article class="">
						<figure class="tm-person">
							<img src="img/tx/${user.image_name  }" alt="img/tx/${user.username  }" class="img-fluid tm-person-img" />
							<figcaption class="tm-person-description">
								<h4 class="tm-person-name">${user.username}</h4>
								<p class="tm-person-title">性别：
									<c:if test="${user.sex==1}">男</c:if>
    								<c:if test="${user.sex==2}">女</c:if>
    								<br>
								年龄：${user.age}
								</p>
								<p class="tm-person-about">我的个性签名：${user.sign}</p>
								<p class="tm-person-about"><a href="updateUserView2?id=${user.id}" class="a">本人信息修改</a>
								</p>
								 <div>
									<a href="" class="tm-social-link"><i class="fab fa-facebook tm-social-icon"></i></a>
									<a href="" class="tm-social-link"><i class="fab fa-twitter tm-social-icon"></i></a>
									<a href="" class="tm-social-link"><i class="fab fa-instagram tm-social-icon"></i></a>
								</div>
							</figcaption>
						</figure>
					</article>
					
				</div>
			</div>
		
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		</main>

		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/parallax.min.js"></script>
  </body>
</html>
