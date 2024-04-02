<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Simple House Template</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
	<link href="css/templatemo-style.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <link href="css/all.min.css" rel="stylesheet" />
	<script type="text/javascript">
			function selectAll(){
				var flag=document.getElementById("all").checked;
				var objs=document.getElementsByName("ids");
				for(var i=0;i<objs.length;i++){
					objs[i].checked=flag;
				}
				
			}
			function f1(num){
				document.getElementById("pageNow").value=num;
				console.log("111");
				console.log(document.getElementById("form1"));
				document.getElementById("form1").submit();
				
				
			}
			function f2(){
				console.log(document.getElementById("button1").value)			
			}
		</script>
	<style type="text/css">
	.accordion:after {
  font-family: 'Font Awesome 5 Free';
  font-weight: 900;
  animation: changeIconBack 0.3s linear;
  content: '\f0d9';
  font-size: 2rem;
  color: #999;
  float: right;
  margin-left: 5px;
}

.accordion.active:after {
  animation: changeIcon 0.3s linear;
  content: '\f0d7';
}
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

.but{
	border:1px  green;
	border-radius:5px;
	height:20px;
	width:50px;
	color:white;
	background-color:#626364;
	float:center;
	Margin:0 auto;
	text-align:center;	
}
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
								<li class="tm-nav-li1"><a href="selectUserView2?id=${sessionScope.user.id }" class="tm-nav-link">详细信息</a></li>
								<li class="tm-nav-li1"><a href="selectUpByUserId?id=${user.id}" class="tm-nav-link">点赞菜谱</a></li>
								<li class="tm-nav-li1"><a href="selectCollectByUserId?id=${user.id}" class="tm-nav-link">收藏菜谱</a></li>
								<li class="tm-nav-li1"><a href="selectChatByUserId?id=${user.id}" class="tm-nav-link ">我的帖子</a></li>
								<li class="tm-nav-li1"><a href="selectUpChatByUserId?id=${user.id}" class="tm-nav-link">点赞帖子</a></li>
								<li class="tm-nav-li1"><a href="selectCollectChatByUserId?id=${user.id}" class="tm-nav-link">收藏帖子</a></li>
								<li class="tm-nav-li1"><a href="selectUserbackByUserId?id=${user.id}" class="tm-nav-link  active">我的反馈</a></li>
								<li class="tm-nav-li1"><a href="selectMenuByTypeId" class="tm-nav-link">返回首页</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>
				<main>
				
			<div class="tm-container-inner-2 tm-info-section">
				<div class="row">
					<!-- FAQ -->
					<div class="col-12 tm-faq">
						<h2 class="text-center tm-section-title">我的反馈</h2>
						<p class="text-center">可查看我的反馈,以及请点击查看回复</p>
						<div class="tm-accordion">
						<c:forEach items="${requestScope.userbackList }" var="userback">
							<button class="accordion">${userback.content }</button>
							<div class="panel">
							  <p>
							  	<c:if test="${userback.reply==null}">待受理</c:if>
							  	<c:if test="${userback.reply!=null}">${userback.reply }</c:if>
							  	<input type="button" 
							  	onclick="if (confirm('确定是否删除该反馈')) {  location.href = 'deleteUserbackById1?id=${userback.id }'} "
							  	class="but" value="删除"/>
							  </p>
							</div>
							
						</c:forEach>	
						</div>	
					</div>
				</div>
			</div>
			
			 
			
			
			
		</main>

		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script>
		$(document).ready(function(){
			var acc = document.getElementsByClassName("accordion");
			var i;
			
			for (i = 0; i < acc.length; i++) {
			  acc[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var panel = this.nextElementSibling;
			    if (panel.style.maxHeight) {
			      panel.style.maxHeight = null;
			    } else {
			      panel.style.maxHeight = panel.scrollHeight + "px";
			    }
			  });
			}	
		});
	</script>
</body>
</html>