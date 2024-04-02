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
	<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
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
			#img-icon{
				height:28px;
				width:28px;
			}
			
			.status{
				float:right;
			}
			
			.tm-contact-form{
				margin-left:100px;
				width:250px;
				height:200px;
			}
			
			.tm-contact-form textarea{
				resize:none;
				height:140px;
				width:260px;
			}
			
			.tm-address-box{
				margin-left:50px;
			}
			
			.tm-accordion {
			  padding-top: 20px;
			}
			
			.accordion {
			  font-size: 1.2rem;
			  font-family: 'Open Sans', Helevetica, Arial, sans-serif;
			  color: #999;
			  background-color: transparent;
			  border: 1px solid #d0d0d0;
			  margin-bottom: 8px;
			  margin-top: 8px;
			  cursor: pointer;
			  padding: 10px 20px 6px;
			  width: 100%;
			  text-align: left;
			  outline: none;
			  transition: 0.4s;
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
    							
								
								<li class="tm-nav-li"><a href="selectUserback" class="tm-nav-link active">联系我们</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>

		<main>
			<header class="row tm-welcome-section">
				<h2 class="col-12 text-center tm-section-title">联系我们</h2>
				<p class="col-12 text-center">本网站基于从特殊人群的角度出发，对该类人群的菜谱及健康建议提供饮食指南，但网站仍有许多缺陷和不足，欢迎各用户提出存在的问题或自己的想法和建议，共筑网站的长久发展。</p>
			</header>

			<div class="tm-container-inner-2 tm-contact-section">
				<div class="row">
					<div class="col-md-8">
						<form action="addUserback" name="form1" method="post" class="tm-contact-form">
					        
					        <div class="form-group">
					          <input type="email" name="email" class="form-control" placeholder="邮箱" />
					        </div>
				
					        <div class="form-group">
					          <textarea name="content" class="form-control" placeholder="建议"></textarea>
					        </div>
					
					        <div class="form-group tm-d-flex">
					          <button type="submit" class="tm-btn tm-btn-success tm-btn-right">
					            Send
					          </button>
					        </div>
						</form>
					</div>
					<div class="col-md-8">
						<div class="tm-address-box">
							<h4 class="tm-info-title tm-text-success">联系地址</h4>
							<address>
								湖南省长沙市雨花区井湾子街道中意一路160号湖南女子学院
							</address>
							<a href="tel:157******28" class="tm-contact-link">
								<img src="img/icon/phone.png" id="img-icon"/>157******28
							</a>
							<a href="mailto:1849754864@qq.com"  class="tm-contact-link">
								<img src="img/icon/email.png" id="img-icon"/>1849754864@qq.com
							</a>	
						</div>
					</div>
				</div>
			</div>
            

			<div class="tm-container-inner-2 tm-info-section">
				<div class="row">
					<div class="col-12 tm-faq">
						<h2 class="text-center tm-section-title">Q&A</h2>
						<p class="text-center">以下用来展示用户的反馈信息</p>
						<c:forEach items="${requestScope.userbackList}" var="ub">
						<div class="tm-accordion">
							<div class="accordion">${ub.content} 
								<c:if test="${ub.status==0}">
									<div class="status"><img src="img/icon/no.png" id="img-icon"/><span>待受理</span></div>
								</c:if>
								<c:if test="${ub.status==1}">
									<div class="status"><img src="img/icon/yes.png" id="img-icon"/><span>已解决</span></div>
								</c:if>				
							</div>
						</div>	
						</c:forEach>
					</div>
				</div>
			</div>
			<form action="selectUserback" method="post" id="form1">
			<input type="hidden" name="pageNow" id="pageNow"/>
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