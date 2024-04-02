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
							<img src="img/simple-house-logo.png" alt="Logo" class="tm-site-logo" /> 
							<div class="tm-site-text-box">
								<h1 class="tm-site-title">膳食营养</h1>
								<h6 class="tm-site-description">Dietary Nutrition</h6>	
							</div>
						</div>
						<nav class="col-md-10 col-12 tm-nav">
							<ul class="tm-nav-ul">
								
								<li class="tm-nav-li"><a href="selectMenu" class="tm-nav-link">菜谱管理</a></li>
								<li class="tm-nav-li"><a href="selectSuggest?type_id=0" class="tm-nav-link">健康建议管理</a></li>
								<li class="tm-nav-li"><a href="selectChat" class="tm-nav-link">帖子管理</a></li>
								<li class="tm-nav-li"><a href="info" class="tm-nav-link">个人信息管理</a></li>
								<li class="tm-nav-li"><a href="selectUserback" class="tm-nav-link   active">反馈信息管理</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>
				<main>
				<header class="row tm-welcome-section">
				<h1 class="col-12 text-center tm-section-title">处理用户反馈页面</h1>
				
			</header>
			<div class="tm-section tm-container-inner" align="center">
			<c:forEach items="userback">
				<form action="updateUserback" method="post">
				<input type="hidden" name="id" value="${userback.id }"/>
			<table class="amtable">	
			<tr height="30">
		<td width="20%">用户：</td>
		<td>${userback.user.username }</td>
		</tr>
	<tr height="30">
		<td>邮箱：</td>
		<td>${userback.email}</td>
	</tr>
	<tr height="30">
		<td width="20%">建议：</td>
		<td>
			${userback.content}
		</td>
	</tr>
	<tr height="30">
		<td width="20%">状态：</td>
		<td>
			<input type="radio" name="status" value="0"<c:if test="${userback.status==0}">checked="checked"</c:if>>待受理</input>
			<input type="radio" name="status" value="1"<c:if test="${userback.status==1 }">checked="checked"</c:if>>已解决</input>
		</td>
	</tr>
	<tr height="30">
		<td width="20%">发送时间：</td>
		<td>
			<fmt:formatDate value="${userback.userback_time}"  pattern="yyyy年MM月dd日"/>
		</td>
	</tr>
	<br/>
	<tr height="30">
		<td width="20%">管理回复：</td>
		<td>
			<textarea rows="12" cols="6" name="reply">${userback.reply}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="reset" value="取消"/>
		</td> 
	</tr>
			
		</table>	
		</form>	
		</c:forEach>
		</div>
		</main>

		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/parallax.min.js"></script>

</body>
</html>