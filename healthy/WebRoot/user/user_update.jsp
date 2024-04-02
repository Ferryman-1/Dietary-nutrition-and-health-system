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
	<style type="text/css">
	form {
  padding: 15px;
  font-size: 16px;
}
input {
  background-color: #fffefb;
  border: solid 1px green;
  height: 40px;
  line-height: 30px;
  padding-left: 0.5em;
  font-size: 15px;
  width: 200px;
  color:seagreen;
  border-radius: 4px
}
#ra{
	height: 20px;
	width: 30px;
}
.btn{
border:1px  green;
	border-radius:5px;
	height:40px;
	width:70px;
	color:white;
	background-color: #2F956D;
}
textarea {
  width: 40%;
  height: 120px;
  padding: 15px 20px;
  color:seagreen;
  border: 1px solid green;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 15px;
  resize: none;
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
								<li class="tm-nav-li"><a href="selectUserView" class="tm-nav-link active">详细信息</a></li>
								<li class="tm-nav-li"><a href="selectUser" class="tm-nav-link">返回上一页</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div><br/><br/>
<h2 align="center" style="color:#0f6a08">修改用户信息</h2>
<form action="updateUser" method="post">
    	<table width="140%">
    		<tr>
    			<td colspan="2"><input type="hidden" name="id" value="${requestScope.user.id}"/></td>
    		</tr>
    		<tr>
    			<td align="right">用户名：</td>
    			<td><input type="text" class="textbox" name="username" value="${requestScope.user.username}"/></td>
    		</tr>
    		<tr>
    			<td align="right">登录名：</td>
    			<td><input type="text" class="textbox" name="loginname" value="${requestScope.user.loginname}"/></td>
    		</tr>
    		
    		<tr>
    			<td align="right">年龄：</td>
    			<td><input type="text" name="age" value="${requestScope.user.age}"/></td>
    		</tr>
    		<tr>
    			<td align="right" >性别：</td>
    			<td>
    				<input id="ra" name="sex" type="radio" value="1" <c:if test="${requestScope.user.sex==1}">checked</c:if>>男
					<input id="ra" name="sex" type="radio" value="2" <c:if test="${requestScope.user.sex==2}">checked</c:if>>女
    			</td>
    		</tr>
    		<tr>
    			<td align="right">个性签名：</td>
    			<td><textarea name="sign">${requestScope.user.sign}</textarea></td>
    		</tr>
   
    		<tr>
    			<td align="right">
    				<input type="submit" value="修改" class="btn">
    			</td>
    			<td>
    				<input type="reset" value="取消" class="btn"> 
    			</td>
    		</tr>
    	</table>
    </form>


		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/parallax.min.js"></script>
</body>
</html>