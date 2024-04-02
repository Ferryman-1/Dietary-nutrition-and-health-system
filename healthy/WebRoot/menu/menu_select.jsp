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



	.tm-nav-li {
  list-style: none;
  display: block;
  margin-bottom: 0;
  padding-right: 18px;
  padding-left: 18px;
}

@media (min-width: 768px) {
 
  .col-md-9 {
    -ms-flex: 0 0 30%;
    flex: 0 0 30%;
    max-width: 30%;
  }
}

@media (min-width: 768px) {
 
  .col-md-10 {
    -ms-flex: 0 0 70%;
    flex: 0 0 70%;
    max-width: 70%;
  }
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
							<img src="img/simple-house-logo.png" alt="Logo" class="tm-site-logo" /> 
							<div class="tm-site-text-box">
								<h1 class="tm-site-title">膳食营养</h1>
								<h6 class="tm-site-description">Dietary Nutrition</h6>	
							</div>
						</div>
						<nav class="col-md-10 col-12 tm-nav">
							<ul class="tm-nav-ul">
								
								<li class="tm-nav-li"><a href="selectMenu" class="tm-nav-link  active">菜谱管理</a></li>
								<li class="tm-nav-li"><a href="selectSuggest?type_id=0" class="tm-nav-link">健康建议管理</a></li>
								<li class="tm-nav-li"><a href="selectChat" class="tm-nav-link">帖子管理</a></li>
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
				<h2 class="col-12 text-center tm-section-title">欢迎进入膳食营养网管理系统</h2>
				<p class="col-12 text-center">饮食是人类维持生命的基本条件，常言谓：“养生之道，莫先于食”。本网站旨在针对特殊人群的菜谱选择推荐菜单，给出膳食营养方面的健康建议，为爱好健康饮食的人群提供一个大众交流平台</p>
			</header>
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
						<input type="submit"  value="搜索" class="but" />
					
						<input type="button" onclick="location.href = 'addMenuView'" class="but1" value="添加菜谱"/>
				
					</form>
					
				</nav>
			</div>
			
	
			<form action="deleteMenuByIds">
    		<table class="tables" align="center">
    		
					<thead>
						<tr>
							<th><input type="checkbox"  id="all" onclick="javascript:return selectAll();"/>
							<input type="submit"   value="删除" id="buttons"></th>
						
							<th>菜谱名</th>
							<th>人群类型</th>
							<th>图片</th>
							<th>介绍</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>
					
					<tbody align="center">
					
					<c:forEach items="${requestScope.menuList}" var="menu">
						
						
			
						<tr class="status_open" align="center">
							<td><center><input type="checkbox" name="ids" value="${menu.id }"></center></td>
							
							<td><a class="asty" href="menu/word/menu_detail1.jsp?htm_name=${menu.htm_name}&upSum=${menu.upSum}&collectSum=${menu.collectSum}">${menu.menu_name }</a></td>
							<td>
							<c:forEach items="${menu.menutype}" var="mt">
							
								<c:forEach items="${requestScope.typeList}" var="type">
								<c:if test="${mt.type_id==type.id}">${type.type_name }</c:if>
								</c:forEach>
							</c:forEach>
							</td>
							<td>
								<img src="menu/word/${menu.image_name }.files/image001.png" alt="${menu.menu_name }" class="img-fluid1" />
							</td>
							<td><div style="width:140px; overflow:hidden; white-space:nowrap; text-overflow:ellipsis" >${menu.show1 }</div></td>
							<td>
								<fmt:formatDate value="${menu.addTime }"  pattern="yyyy年MM月dd日"/>
							</td>
							<td>
								
									<input type="button" onclick="location.href = 'updateMenuView?id=${menu.id }'" id="buttons" value="修改"/>
								
								
									<input type="button" onclick="if (confirm('确定是否删除该菜谱')) {  location.href = 'deleteMenuById?id=${menu.id }'} " id="buttons" value="删除"/>				
								
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
							<a class="asty aaa" onclick="aaa(this)" id="${i }" href="javascript:f1(${i })">${i}</a>
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