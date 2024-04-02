<%@ page language="java" import="java.util.*,com.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
				document.getElementById("form1").submit();
				
				
			}
			function f2(){
				console.log(document.getElementById("button1").value)			
			}
		</script>
		<style type="text/css">

@media (min-width: 768px) {
 
  .col-md-8 {
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%;
  }
}
#img-icon1{
				heigth:35px;
				width:35px;
				margin-left:118px;
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
						<div class="col-md-8 col-12">
							<img src="img/simple-house-logo.png" alt="Logo" class="tm-site-logo" /> 
							<div class="tm-site-text-box">
								<h1 class="tm-site-title">膳食营养</h1>
								<h6 class="tm-site-description">Dietary Nutrition</h6>	
							</div>
						</div>
						<nav class="col-md-8 col-12 tm-nav">
							<ul class="tm-nav-ul">
								<li class="tm-nav-li"><a href="selectMenuByTypeId" class="tm-nav-link active">首页</a></li>
								<li class="tm-nav-li"><a href="selectMenu" class="tm-nav-link">菜谱</a></li>
								<li class="tm-nav-li"><a href="selectSuggest?type_id=0" class="tm-nav-link">健康建议</a></li>
								<li class="tm-nav-li"><a href="selectChat" class="tm-nav-link">帖子</a></li>
								
								<c:if test="${sessionScope.user!=null}">
									<c:if test="${sessionScope.user.role==1}">
									<li class="tm-nav-li"><a href="selectUserView?id=${sessionScope.user.id }" class="tm-nav-link">信息管理</a></li>
									</c:if>
									<c:if test="${sessionScope.user.role==2}">
    								<li class="tm-nav-li"><a href="selectUserView2?id=${sessionScope.user.id }" class="tm-nav-link">个人信息</a></li>
    								</c:if>
								</c:if>
								
								<c:if test="${sessionScope.user==null}">
								<li class="tm-nav-li"><a href="login?id=${sessionScope.user.id }" class="tm-nav-link">个人信息</a></li>
								</c:if>
    							
								
								<li class="tm-nav-li"><a href="selectUserback" class="tm-nav-link">联系我们</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>

		<main>
			<header class="row tm-welcome-section">
				<h2 class="col-12 text-center tm-section-title">欢迎来到膳食营养网</h2>
				<p class="col-12 text-center">饮食是人类维持生命的基本条件，常言谓：“养生之道，莫先于食”。本网站旨在针对特殊人群的菜谱选择推荐菜单，给出膳食营养方面的健康建议，为爱好健康饮食的人群提供一个大众交流平台</p>
			</header>
			<div class="tm-paging-links">
				<nav>
					<ul>
						<li class="tm-paging-item"><a href="selectMenuByTypeId1?id=1" class="tm-paging-link <c:if test="${requestScope.id==1}">active</c:if>">糖尿病</a></li>
						<li class="tm-paging-item"><a href="selectMenuByTypeId1?id=2" id="2" class="tm-paging-link <c:if test="${requestScope.id==2}">active</c:if>">孕妇</a></li>
						<li class="tm-paging-item"><a href="selectMenuByTypeId1?id=3" id="3" class="tm-paging-link <c:if test="${requestScope.id==3}">active</c:if>">减肥健身</a></li>
						<li class="tm-paging-item2"><a href="selectMenu" class="tm-paging-link2">更多>></a></li>
					</ul>
				</nav>
			</div>

			<!-- Gallery -->
			<div class="row tm-gallery">
			
				<!-- gallery page 1 -->
				<div id="tm-gallery-page-pizza" class="tm-gallery-page">
					<c:forEach items="${requestScope.menuList2}" var="menu2" varStatus="status">					
					<article class="col-lg-3 col-md-4 col-sm-6 col-12 tm-gallery-item">
						<figure>
							<img src="menu/word/${menu2.image_name }.files/image001.png" alt="Image" class="img-fluid tm-gallery-img" />
							<figcaption>
								<h4 class="tm-gallery-title"><a href="menu/word/menu_detail.jsp?htm_name=${menu2.htm_name}&upSum=${menu2.upSum}&collectSum=${menu2.collectSum}" class="tm-gallery-a">${menu2.menu_name }</a></h4>
									<%
									   Boolean flas=false;
									%>
									<c:forEach items="${menu2.up}" var="up">
									   <c:if test="${up.user_id==sessionScope.user.id && menu2.id == up.menu_id }"> 
									   	<%
									   flas=true;
									   %>
									   	<c:set var="uid" scope="session" value="${up.id}"/>
									   </c:if>  
										
									</c:forEach>
									<c:if test="<%=flas%>">
									<a onclick="location.href='deleteUpById1?id=${uid}'">
									    <span>
									        <img src="img/icon/11.png" id="img-icon1" class="img01">
									    </span>
									    </a> 
										</c:if>
										
										<c:if test="<%=!flas%>">
										<c:if test="${sessionScope.user!=null }">
										 <a onclick="location.href='addUp?menu_id=${menu2.id}'"  >
										   <span>
									        <img src="img/icon/1.png" id="img-icon1" class="img01">
									    </span>
									    </a>
									    </c:if> 
									    	<c:if test="${sessionScope.user==null }">
									    	<a onclick="alert('请先登录')"  >
										   <span>
									        <img src="img/icon/1.png" id="img-icon1" class="img01">
									    </span>
									    </a>
									    	</c:if>
										</c:if>
										<span>${menu2.upSum}</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
									
									<!-- 收藏 -->
									<%
									   Boolean flag=false;
									%>
									<c:forEach items="${menu2.collect}" var="collect">
									   <c:if test="${collect.user_id==sessionScope.user.id && menu2.id == collect.menu_id }"> 
									   	<%
									   flag=true;
									   %>
									   	<c:set var="cid" scope="session" value="${collect.id}"/>
									   </c:if>  
										
									</c:forEach>
									<c:if test="<%=flag%>">
									<a onclick="location.href='deleteCollectById1?id=${cid}'">
									    <span>
									        <img src="img/icon/22.png" id="img-icon" class="img01">
									    </span>
									    </a> 
										</c:if>
										
										<c:if test="<%=!flag%>">
										<c:if test="${sessionScope.user!=null }">
										 <a onclick="location.href='addCollect?menu_id=${menu2.id}'"  >
										   <span>
									        <img src="img/icon/2.png" id="img-icon" class="img01">
									    </span>
									    </a>
									    </c:if> 
									    	<c:if test="${sessionScope.user==null }">
									    	<a onclick="alert('请先登录')"  >
										   <span>
									        <img src="img/icon/2.png" id="img-icon" class="img01">
									    </span>
									    </a>
									    	</c:if>
										</c:if>
											<span>${menu2.collectSum}</span>
									
							</figcaption>
						</figure>
					</article>
					</c:forEach>
				</div>					
				<!-- gallery page 1 -->
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
			
			$(".img01").click(function(){
					if(flag == 0){
							$(this).attr("src","img/icon/11.png")
							flag = 1;
						}else{
							$(this).attr("src","img/icon/1.png")
							flag = 0;
						}					
				})
			
			
			$(".img02").click(function(){        //收藏
					if(flag == 0){
						$(this).attr("src","img/icon/22.png")
						flag = 1;
					}else{
						$(this).attr("src","img/icon/2.png")
						flag = 0;
					}
					
				})
				
			
		});
		
		
		
		
	</script>
</body>
</html>