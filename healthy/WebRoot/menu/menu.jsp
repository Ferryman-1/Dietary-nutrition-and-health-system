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
								<li class="tm-nav-li"><a href="selectMenu" class="tm-nav-link   active">菜谱</a></li>
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
			
			<div class="tm-paging-links">
				<nav>
					<form action="selectMenu" class="forms" id="form1" method="post" >
					<input type="hidden" name="pageNow" id="pageNow"/>
						<select name="type_id">
							<option value="">请选择人群类型</option>
						<c:forEach items="${requestScope.typeList}" var="type">
							<option value="${type.id}"<c:if test="${requestScope.menuType.type_id==type.id}">selected</c:if>>${type.type_name }</option>
						</c:forEach>
						
						</select>
						<input type="submit"  value="搜索" class="but"/>
					</form>
				</nav>
			</div>
			
			 
			<c:forEach items="${requestScope.menuList}" var="menu">	
			<div class="tm-section tm-container-inner">
				<div class="row">
					<div class="col-md-6">
						<figure class="tm-description-figure">
							<img src="menu/word/${menu.image_name }.files/image001.png" alt="${menu.menu_name }.files/image001.png" class="img-fluid" />
						</figure>
					</div>
					<div class="col-md-7">
						<div class="tm-description-box"> 
							<h4 class="tm-gallery-title">
							<a href="menu/word/menu_detail.jsp?htm_name=${menu.htm_name}&upSum=${menu.upSum}&collectSum=${menu.collectSum}" class="asty1">${menu.menu_name }</a>
							
							&nbsp;&nbsp;&nbsp;&nbsp; <font size="3px" color="gray">[适用:
							
							<c:forEach items="${menu.menutype}" var="mt">
							
								<c:forEach items="${requestScope.typeList}" var="type">
								<c:if test="${mt.type_id==type.id}">${type.type_name }</c:if>
								</c:forEach>
							</c:forEach>
							]</font> 
							</h4>
							
							<p class="tm-mb-45">${menu.show1 }  </p>
							
							
							<%
							 Boolean flas=false;
							%>
									<c:forEach items="${menu.up}" var="up">
									   <c:if test="${up.user_id==sessionScope.user.id && menu.id == up.menu_id }"> 
									   	<%
									   flas=true;
									   %>
									   	<c:set var="uid" scope="session" value="${up.id}"/>
									   </c:if>  
										
									</c:forEach>
									<div id="lc">
									<c:if test="<%=flas%>">
									<a onclick="location.href='deleteUpById?id=${uid}'">
									    <span>
									        <img src="img/icon/11.png" id="img-icon" class="img01">
									    </span>
									    </a> 
										</c:if>
										
										<c:if test="<%=!flas%>">
										<c:if test="${sessionScope.user!=null }">
										 <a onclick="location.href='addUp1?menu_id=${menu.id}'"  >
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
										<span>${menu.upSum}</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
									
									<!-- 收藏 -->
									<%
									   Boolean flag=false;
									%>
									<c:forEach items="${menu.collect}" var="collect">
									   <c:if test="${collect.user_id==sessionScope.user.id && menu.id == collect.menu_id }"> 
									   	<%
									   flag=true;
									   %>
									   	<c:set var="cid" scope="session" value="${collect.id}"/>
									   </c:if>  
										
									</c:forEach>
									<c:if test="<%=flag%>">
									<a onclick="location.href='deleteCollectById?id=${cid}'">
									    <span>
									        <img src="img/icon/22.png" id="img-icon" class="img01">
									    </span>
									    </a> 
										</c:if>
										
										<c:if test="<%=!flag%>">
										<c:if test="${sessionScope.user!=null }">
										 <a onclick="location.href='addCollect1?menu_id=${menu.id}'"  >
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
											<span>${menu.collectSum}</span>
									
									</div>
							
							
							
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