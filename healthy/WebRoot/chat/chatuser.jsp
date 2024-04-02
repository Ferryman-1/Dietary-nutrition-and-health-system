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
.col-md-6{
height:80%;
}
.img-fluid {
    max-width: 80%;
    height: 150px;
    width: 300px;
    object-fit: cover;
}
.tm-btn-default {
    border: 1px solid #ccc;
    background-color: transparent;
    color: #626364;
        padding: 5px 15px;
}
  
			
        	      
			
.node{
	width: 700px;
	height: 40px;
	
	/*强制文字在一行文本框内*/
	white-space: nowrap;
	/*溢出部分文字隐藏*/
	overflow: hidden;
	/*溢出部分省略号处理*/
	text-overflow: ellipsis;}
	td{margin: 5px auto;}
 
.wel{
	float:left;
	margin-left:10px;
	height:1px;
}

#img-icon{
	heigth:35px;
	width:35px;
}

#lc{
	float:left;
	margin-left:430px;
}
.chatuser{
	margin-left:370px;
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
								<li class="tm-nav-li1"><a href="selectChatByUserId?id=${user.id}" class="tm-nav-link  active">我的帖子</a></li>
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
				<h2 class="col-12 text-center tm-section-title">我的帖子</h2>
				<p class="col-12 text-center">您所写的的帖子都收录于此</p>
				<br/>
			</header>
			
			
			 
			<c:forEach items="${requestScope.chatList}" var="chat">	
			<div class="tm-section tm-container-inner">
				<div class="row">
					<div class="col-md-6">
						<figure class="tm-description-figure">
							<img src="img/lt/${chat.image_name }" alt="${chat.image_name }" class="img-fluid" />
						</figure>
					</div>
					<div class="col-md-7">
						<div class="tm-description-box"> 
							<h4 class="tm-gallery-title">
							<a href="selectChatById?id=${chat.id }" class="asty">${chat.title } </a>&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="3px" color="gray">创作者:<c:forEach items="${requestScope.userList}" var="user">
								<c:if test="${chat.user.id==user.id}">${user.username }</c:if>
								</c:forEach></font>
							 
							</h4>
						<div class="node" >
							<p class="tm-mb-45" id="c">${chat.content }</p>
						</div>
							<%
							 Boolean flas=false;
							%>
									<c:forEach items="${chat.upChat}" var="upChat">
									   <c:if test="${upChat.user_id==sessionScope.user.id && chat.id == upChat.chat_id }"> 
									   	<%
									   flas=true;
									   %>
									   
									   <c:set var="uid" scope="session" value="${upChat.id}"/>
									   </c:if>  
										
									</c:forEach>
								<span>点赞数：${chat.upSum} 收藏数：${chat.collectSum} 评论数：${chat.commentSum}</span>
									
									
									<!-- 收藏 -->
									<%
									   Boolean flag=false;
									%>
									<c:forEach items="${chat.collectChat}" var="collectChat">
									   <c:if test="${collectChat.user_id==sessionScope.user.id && chat.id == collectChat.chat_id }"> 
									   	<%
									   flag=true;
									   %>
									   	<c:set var="cid" scope="session" value="${collectChat.id}"/>
									   </c:if>  
										
									</c:forEach>
									
									<div>		
									
							<a href="updateChatView?id=${chat.id }" class="tm-btn tm-btn-default tm-right chatuser">修改</a>
							<a href="deleteChatById?id=${chat.id }" class="tm-btn tm-btn-default tm-right">删除</a>	
							<a href="selectChatById3?id=${chat.id }" class="tm-btn tm-btn-default tm-right">Read More</a>
							</div>
					
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
			
			
		</main>

		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script>
		$(document).ready(function(){
			// Handle click on paging links
			$('.tm-paging-link').click(function(e){
				e.preventDefault();
				
				var page = $(this).text().toLowerCase();
				$('.tm-gallery-page').addClass('hidden');
				$('#tm-gallery-page-' + page).removeClass('hidden');
				$('.tm-paging-link').removeClass('active');
				$(this).addClass("active");
			});
		});
	</script>
</body>
</html>