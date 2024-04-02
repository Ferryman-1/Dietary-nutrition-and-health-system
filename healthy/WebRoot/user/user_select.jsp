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
	<script type="text/javascript">
		function aa(){
			var flag = confirm("确认删除该用户吗？");
			return flag;
		}
		var count = 1;
		var num=0;
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
		
	</script>
<style type="text/css">

.input1{
		color:seagreen;
	border:1px solid green;
	border-radius:5px;
	width:300px;
	height:40px;
	font-size:20px;
}
 h2 {
      color: #0f6a08;
 
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
							<div class="tm-site-text-box">
								<h1 class="tm-site-title">个人中心</h1>
							</div>
						</div>
						<nav class="col-md-8 col-12 tm-nav">
							<ul class="tm-nav-ul">
								<li class="tm-nav-li"><a href="selectUserView?id=${sessionScope.user.id }" class="tm-nav-link active">详细信息</a></li>
								<li class="tm-nav-li"><a href="selectMenu" class="tm-nav-link">返回首页</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>

		<main>
			<header class="row tm-welcome-section">
				
				
				<h2  class="col-12 text-center ">用户信息管理</h2>
			</header>
			 <div class="tm-paging-links">
				<nav>
					<form action="selectUser" class="forms" id="form1" method="post" >
					<input type="hidden" name="pageNow" id="pageNow"/>
						用户名:
    					<input type="text" name="username" value="${requestScope.user.username}" class="input1">
						<input type="submit"  value="搜索" class="but" />
					
						
				
					</form>
					
				</nav>
			</div>
	
			
    	<form action="deleteUsers" method="post" align="center">
    	
    
    	<table class="tables" align="center">
    		
		<thead>
		<tr>
			<th><input type="checkbox"  id="all" onclick="javascript:return selectAll();"/>
			<input type="submit"   value="删除" id="buttons"></th>
			<th>用户名</th>
    		<th>登录名</th>
    		
    		<th>性别</th>
    		<th>年龄</th>
    		<th>个性签名</th>
    		<th>操作</th>
						</tr>
					</thead>
					
					<tbody align="center">
					
					<c:forEach items="${requestScope.userList}" var="user">
						
						<tr class="status_open" align="center">
							<td><center><input type="checkbox" name="ids" value="${user.id }"></center></td>
							
							<td>${user.username }</td>
    						<td>${user.loginname }</td>
				    		
				    		
				    		<td>
				    			<c:if test="${user.sex==1}">男</c:if>
				    			<c:if test="${user.sex==2}">女</c:if>
							</td>
    						<td>${user.age }</td>
							<td><div style="width:140px; overflow:hidden; white-space:nowrap; text-overflow:ellipsis" >${user.sign }</div></td>
							<td>
								
									<input type="button" onclick="location.href = 'updateUserView?id=${user.id }'" id="buttons" value="修改"/>
								
								
									<input type="button" onclick="if (confirm('确定是否删除该用户')) {  location.href = 'deleteUser?id=${user.id }'} " id="buttons" value="删除"/>				
								
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