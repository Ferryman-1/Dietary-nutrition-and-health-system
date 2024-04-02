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
			function f3 (){
				var t=document.getElementById("title").value;
				var c=document.getElementById("content").value;
				if(t=="" || c==""){
					alert('标题和内容不能为空');				
				}else{			
						document.getElementById("form2").submit();	
					
				}
			}
		</script>
		<style type="text/css">
	#form2{
	font-size:15px;
	}
	
	.amtable1{
	float:center;
	Margin:0 auto;
	margin-left:300px;
	
	}



input {
  background-color: #fffefb;
  border: solid 1px green;
  height: 40px;
  line-height: 30px;
  padding-left: 0.5em;
  font-size: 15px;
  width: 300px;
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
	margin-left:10px;
	background-color: #2F956D;
}
textarea {
  width: 80%;
  height: 200px;
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
						<div class="col-md-9 col-12">
							<div class="tm-site-text-box">
								<h1 class="tm-site-title">个人中心</h1>
								
							</div>
						</div>
						<nav class="col-md-10 col-12 tm-nav">
							<ul class="tm-nav-ul">
								<li class="tm-nav-li1"><a href="selectUserView2?id=${sessionScope.user.id }" class="tm-nav-link">详细信息</a></li>
								<li class="tm-nav-li1"><a href="selectUpByUserId?id=${user.id}" class="tm-nav-link ">点赞菜谱</a></li>
								<li class="tm-nav-li1"><a href="selectCollectByUserId?id=${user.id}" class="tm-nav-link">收藏菜谱</a></li>
								<li class="tm-nav-li1"><a href="selectChatByUserId?id=${user.id}" class="tm-nav-link  active">我的帖子</a></li>
								<li class="tm-nav-li1"><a href="selectUpChatByUserId?id=${user.id}" class="tm-nav-link  ">点赞帖子</a></li>
								<li class="tm-nav-li1"><a href="selectCollectChatByUserId?id=${user.id}" class="tm-nav-link">收藏帖子</a></li>
								<li class="tm-nav-li1"><a href="selectUserbackByUserId?id=${user.id}" class="tm-nav-link">我的反馈</a></li>
								<li class="tm-nav-li1"><a href="selectMenuByTypeId" class="tm-nav-link">返回首页</a></li>
							</ul>
						</nav>		
					</div>
				</div>
			</div>
		</div>
				<main>
				<header class="row tm-welcome-section">
				<h1 class="col-12 text-center tm-section-title">文章修改页面</h1>
				
			</header>
			<div class="tm-section tm-container-inner" align="center">
			<c:forEach items="chat">
				<form action="updateChat" enctype="multipart/form-data" method="post" id="form2">
				<input type="hidden" name="id" value="${chat.id }"/>
			<table class="amtable1">	
			<tr height="30">
		<td align="right" width="20%">标题：</td>
		<td><input type="text" name="title" value="${chat.title }" id="title"></td>
		</tr>
	<tr height="30">
		<td align="right">请选择图片文件：</td>
		<td><input type="file" name="file" id="file"></td>
	</tr>
	<tr height="30">
		<td align="right" width="20%">内容：</td>
		<td>
			<textarea name="content" id="content">${chat.content }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <input type="button" value="修改" onclick="f3();" class="btn"/>&nbsp;&nbsp;&nbsp;
		    <input type="reset" value="取消" class="btn"/>
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