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

.img-fluid {
  max-width: 50%;
  height:350px;
  width:300px;
  object-fit:cover;
}
form {
  padding: 25px;
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
  width: 200%;
  height: 130px;
  padding: 15px 20px;
  color:seagreen;
  border: 1px solid green;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 15px;
  resize: none;
}
span{
	position:absolute;
	top:310px;
	margin-left:-350px;
	color:green;
	font-size: 20px;
	font-weight: bold;
}
img:hover{
      box-shadow: 10px 10px 10px #888888;
    }
</style>
<script type="text/javascript">
function imageOnClick(){
	document.getElementById('my_photo').click();//my_photo隐藏的input[file]的id

}

</script>
</head>
  
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
								<li class="tm-nav-li"><a href="selectUserView2" class="tm-nav-link active">详细信息</a></li>
								<li class="tm-nav-li"><a href="selectUserView2?id=${user.id}" class="tm-nav-link">返回上一页</a></li>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>

		<main>
			<header class="row tm-welcome-section">
				<!-- <h2 class="col-12 text-center tm-section-title">个人中心</h2>
				<p class="col-12 text-center">欢迎进入个人中心，
				这里是你的个人信息，你的喜欢、收藏和评论的作品可在此处查到</p> -->
			</header>
	<form action="updateUser2" method="post" enctype="multipart/form-data">
		<div class="tm-container-inner tm-persons">
				<div class="row">
					<article class="">
						<figure class="tm-person">
							<img src="img/tx/${requestScope.user.image_name }" id="avatar_img" alt="Image" class="img-fluid tm-person-img" onclick="imageOnClick()"/>
							<span>*点击编辑头像</span>
							<input type="file" name="file" id="my_photo" style="display:none"/>
						
					<figcaption class="tm-person-description">
	
 	<table width="110%">
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
    			<td align="right">密码：</td>
    			<td><input type="text" name="password" value="${requestScope.user.password}"/></td>
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
    			<td align="right" >
    				个性签名：
    			</td>
    			<td>
    				<textarea name="sign">${requestScope.user.sign}</textarea>
    			</td>
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
	</from>
							</figcaption>
						</figure>
					</article>
				</div>
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
