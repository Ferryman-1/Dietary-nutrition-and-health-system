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
	width: 300px;
	height: 40px;
	
	/*强制文字在一行文本框内*/
	white-space: nowrap;
	/*溢出部分文字隐藏*/
	overflow: hidden;
	/*溢出部分省略号处理*/
	text-overflow: ellipsis;}
	td{margin: 5px auto;}
 

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
								<li class="tm-nav-li"><a href="selectChat" class="tm-nav-link   active">帖子管理</a></li>
								<li class="tm-nav-li"><a href="info" class="tm-nav-link">个人信息管理</a></li>
								<li class="tm-nav-li"><a href="selectUserback" class="tm-nav-link">反馈信息管理</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>
				<main>
				<header class="row tm-welcome-section">
				
				
				<h2  class="col-12 text-center ">帖子信息管理</h2>
			</header>
			<div class="tm-paging-links">
				<nav>
					<form action="selectChat" class="forms" id="form1" method="post" >
					<input type="hidden" name="pageNow" id="pageNow"/>
					标题名：<input class="input1" type="text" name="title" value="${requestScope.chat.title}"> 
  						内容：<input class="input1" type="text" name="content" value="${requestScope.chat.content}"> 
						
						
						
						<input type="submit"  value="搜索" class="but"/>
						<input type="button" onclick="location.href = 'addChatView'" class="but1" value="写文章"/>
					</form>
				
				</nav>
			</div>
			
	
			<form action="deleteChatByIds">
    		<table class="tables" align="center">
    		
					<thead>
						<tr>
							<th><input type="checkbox"  id="all" onclick="javascript:return selectAll();"/>
							<input type="submit"   value="删除" id="buttons"></th>
						
							<th>标题</th>
							<th>创作者</th>
							<th>图片</th>
							<th>创建时间</th>
							<th>内容</th>
							<th>操作</th>
						</tr>
					</thead>
					
					<tbody align="center">
					
					<c:forEach items="${requestScope.chatList}" var="chat">
						
						
			
						<tr class="status_open" align="center">
							<td><center><input type="checkbox" name="ids" value="${chat.id }"></center></td>
							
							<td>${chat.title }</td>
							<td>
							<c:forEach items="${requestScope.userList}" var="user">
							
								
								<c:if test="${user.id==chat.user.id}">${user.username }</c:if>
								
							</c:forEach>
							</td>
							<td>
								<img src="img/lt/${chat.image_name }" alt="${chat.title }" class="img-fluid1" />
							</td>
							<td>
								<fmt:formatDate value="${chat.addTime }"  pattern="yyyy年MM月dd日"/>
							</td>
							<td  id="c">
								<div class="node">${chat.content }</div>
							</td>
							<td>
									<input type="button" onclick="location.href='selectChatById?id=${chat.id }'" id="buttons" value="浏览"/>	
									
								
									<input type="button" onclick="if (confirm('确定是否删除该文章')) {  location.href = 'deleteChatById?id=${chat.id }'} " id="buttons" value="删除"/>				
								
							</td>
						</tr>
					
					
					</c:forEach>
			
					
					</tbody>
				
				</table>
			</form>
			
			<table align="center" class="pages">
			
				<tr class="status_open">
					<c:if test="${requestScope.pm.hasFirst}"><td><a class="asty" href="javascript:f1(1)">首页</a></td></c:if>
					<c:if test="${requestScope.pm.hasPre}"><td><a class="asty" href="javascript:f1(${requestScope.pm.pageNow-1 })">上一页</a></td></c:if>
					<c:if test="${requestScope.pm.hasNext}"><td><a class="asty" href="javascript:f1(${requestScope.pm.pageNow+1 })">下一页</a></td></c:if>
					<c:if test="${requestScope.pm.hasLast}"><td><a class="asty" href="javascript:f1(${requestScope.pm.totalPage })">尾页</a></td></c:if>
					<td>
						<c:forEach begin="1" end="${requestScope.pm.totalPage}" var="i">
							<a class="asty" href="javascript:f1(${i })">${i}</a>
						</c:forEach>								
					</td>					 
				</tr>				
			</table>
			
		</main>

		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/parallax.min.js"></script>

</body>
</html>