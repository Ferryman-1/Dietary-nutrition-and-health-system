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
 


#img-icon{
	heigth:35px;
	width:35px;
}

#lc{
	float:left;
	margin-left:430px;
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
								<li class="tm-nav-li"><a href="selectMenuByTypeId" class="tm-nav-link">首页</a></li>
								<li class="tm-nav-li"><a href="selectMenu" class="tm-nav-link ">菜谱</a></li>
								<li class="tm-nav-li"><a href="selectSuggest?type_id=0" class="tm-nav-link">健康建议</a></li>
								<li class="tm-nav-li"><a href="selectChat" class="tm-nav-link  active">帖子</a></li>
								
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
				
			<div class="tm-paging-links">
				
					<form action="selectChat" class="forms" id="form1" method="post" >
					<input type="hidden" name="pageNow" id="pageNow"/>
					标题名：<input class="input1" type="text" name="title" value="${requestScope.chat.title}"> 
  						内容：<input class="input1" type="text" name="content" value="${requestScope.chat.content}"> 
						
											
						<input type="submit"  value="搜索" class="but"/>
						<input type="button" onclick="location.href = 'addChatView'" class="but1" value="写文章"/>
					</form>
				
			</div>
			
			 
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
									<div id="lc">
									<c:if test="<%=flas%>">
									<a onclick="location.href='deleteUpChatById?id=${uid}'">
									    <span>
									        <img src="img/icon/11.png" id="img-icon" class="img01">
									        
									    </span>
									    </a> 
										</c:if>
										
										<c:if test="<%=!flas%>">
										<c:if test="${sessionScope.user!=null }">
										 <a onclick="location.href='addUpChat?chat_id=${chat.id}'"  >
										   <span>
									        <img src="img/icon/1.png" id="img-icon" class="img01">
									    </span>
									    </a>
									    </c:if> 
									    	<c:if test="${sessionScope.user==null }">
									    	<a onclick="alert('请先登录')"  >
										   <span>
									        <img src="img/icon/1.png" id="img-icon" class="img01">
									    </span>
									    </a>
									    	</c:if>
										</c:if>
										<span>${chat.upSum} </span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
									
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
									<c:if test="<%=flag%>">
									<a onclick="location.href='deleteCollectChatById?id=${cid}'">
									    <span>
									        <img src="img/icon/22.png" id="img-icon" class="img01">
									    </span>
									    </a> 
										</c:if>
										
										<c:if test="<%=!flag%>">
										<c:if test="${sessionScope.user!=null }">
										 <a onclick="location.href='addCollectChat?chat_id=${chat.id}'"  >
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
											<span>${chat.collectSum}</span>
									
									</div>
							
							<a href="selectChatById?id=${chat.id }" class="tm-btn tm-btn-default tm-right">Read More</a>
					
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
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