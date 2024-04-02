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
			.chat-content{
				
			}
			.cont{
				width:1080px;
				margin-left:60px;
				
			}
			.wel{
				float:right;
				margin-left:10px;
				height:1px;
			}
			
			#img-icon1{
				heigth:35px;
				width:35px;
				margin-left:870px;
			}
			
			#img-icon{
				heigth:35px;
				width:35px;
			}
			
			#lc{
				float:left;
				marging-left:800px;
				width:1200px;
				positive:absolute;
				margin-top:15px;
			}
	
			/*评论*/
			.comment{
				width:1200px;
				height: 450px;
				float:right;
				padding-left:0px;
			}
			.span{
				float: left;
				margin-top:20px;
				margin-bottom:20px;
				margin-left: 500px;
				font-weight: bold;
				font-size:30px;
				color: #2fab87;
			}
			.comment textarea{
				color: #2fab87;
			    font-size: 24px;
				font-family: "宋体";
				outline: none;
				resize: none;
				height:300px;
				width:900px;
				border: 8px solid transparent;
				border-radius: 20px;
				background: linear-gradient(white,white) padding-box,repeating-linear-gradient(-45deg, pink 0, pink 12.5%, transparent 0, transparent 25%, #2fab87 0, #2fab87 37.5%, transparent 0, transparent 50%) 0/5em 5em;
			}
			
			textarea::placeholder {
			    color: #9b9b9b;
			    font-size: 24px;
				font-family: "宋体";
			}
			
			.comment input{
				width: 90px;
				height: 40px;
				font-size:19px;
				font-weight:bold;
				border: none;//设置高亮边框正常情况下不显示
				list-style: none;
				float:right;
				margin-right: 160px;
				color: #ffffff;
				background-color: #2fab87;
				
			}
			
			.comment input:hover{
				color: #ffffff;
				background-color: pink;
			}
			
			/*评论列表*/
			h2{
		     color:#787878;
		     float:left;
		     
			}
			 .viewComment {
		      width: 950px;
		      margin-bottom: 15px;
		      margin-left:100px;
		    }
		    .viewComment1 {
		    margin-bottom: 15px;
		      width: 950px;
		      display: flex;
		    }
		
		    .photo {
		      height: 60px;
		      width: 60px;
		      background-color: #c3c3c3;
		      border-radius: 50px;
		      margin-right: 20px;
			  overflow: hidden;
			  background-position: 50%;
		    }
		    
			.photo img{
				width: 60px;
				height:60px;
			}
			
		    .text {
		      flex: 1;
		      padding: 20px;
		      background-color: #dbf5e2;
		      border-radius: 15px;
		      width: 950px;
		    }
		
		    .title {
		      display: flex;
		      justify-content: space-between;
		      margin-bottom: 10px;
		      font-size: 18px;
			  color:#787878;
		    }
		    
		    .del{
		    	float: right;
		    }
		
		    .content {
		      text-indent: 2em;
		    }
			/*chat */
			/*#chatcc{
			  height:500px;
			  positive:absolute;
			}*/
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
		
		<header class="row tm-welcome-section">
		<h2 class="col-12 text-center ">标题：${chat.title }</h2>
			<p class="col-12 text-center " align="right">发布人：${chat.user.username } &nbsp;&nbsp;&nbsp;&nbsp;
			发布时间：<fmt:formatDate value="${chat.addTime }"  pattern="yyyy年MM月dd日  HH:mm"/></p>
		</header>
		
		<div class="chatcc">
			<div>
				<figure style="float:left;margin-left:60px;margin-right:30px" class="tm-description-figure">
					<img src="img/lt/${chat.image_name }" alt="${chat.image_name }" class="img-fluid" style="width:400px;height:350px" />
				</figure>
			</div>
				
			<div class="cont">
				内容:<p>${chat.content }</p>
	  		</div>
  		</div>
			<%
							 Boolean flas=false;
							%>
									<c:forEach items="${chat.upChat}" var="upChat">
									   <c:if test="${upChat.user_id==sessionScope.user.id && chat.id == upChat.chat_id }"> 
									   	<%
									   flas=true;
									   %>
									   	<c:set var="ucid" scope="session" value="${upChat.id}"/>
									   </c:if>  
										
									</c:forEach>
						<div id="lc">
									<c:if test="<%=flas%>">
									<a onclick="location.href='deleteUpChatById1?id=${ucid}&chat_id=${chat.id}'">
									    <span>
									        <img src="img/icon/11.png" id="img-icon1" class="img01">
									    </span>
									    </a> 
										</c:if>
										
										<c:if test="<%=!flas%>">
										<c:if test="${sessionScope.user!=null }">
										 <a onclick="location.href='addUpChat1?chat_id=${chat.id}'"  >
										   <span>
									        <img src="img/icon/1.png" id="img-icon1" class="img01">
									    </span>
									    </a>
									    </c:if> 
									    	<c:if test="${sessionScope.user==null }">
									    	<a onclick="alert('请先登录')"  >
										   <span>
									        <img src="img/icon/1.png" id="img-icon1" class="img01">
									    </span>
									    </a>
									    	</c:if>
										</c:if>
										<span>${chat.upSum}</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
									
									<!-- 收藏 -->
									<%
									   Boolean flag=false;
									%>
									<c:forEach items="${chat.collectChat}" var="collectChat">
									   <c:if test="${collectChat.user_id==sessionScope.user.id && chat.id == collectChat.chat_id }"> 
									   	<%
									   flag=true;
									   %>
									   	<c:set var="ccid" scope="session" value="${collectChat.id}"/>
									   </c:if>  
										
									</c:forEach>
									<c:if test="<%=flag%>">
									<a onclick="location.href='deleteCollectChatById1?id=${ccid}&chat_id=${chat.id }'">
									    <span>
									        <img src="img/icon/22.png" id="img-icon" class="img01">
									    </span>
									    </a> 
										</c:if>
										
										<c:if test="<%=!flag%>">
										<c:if test="${sessionScope.user!=null }">
										 <a onclick="location.href='addCollectChat1?chat_id1=${chat.id}'"  >
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
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="#comment">
								<span>
									<img src="img/icon/3.png" id="img-icon" class="img01">
								</span></a>
								<span>${chat.commentSum}</span>
						</div>
				<br/><br/>
			
			<!--显示评论-->
			<span class="span">⌨️评论列表</span>
			<br/><br/><br/>
			<div class="viewComment">
			<c:if test="${requestScope.commentList==null||requestScope.commentList=='[]'}">
			<div class="viewComment1">
			<h2>当前文章暂无评论</h2>
			</div>
			</c:if>
			<c:if test="${requestScope.commentList!=null}">
			<c:forEach items="${requestScope.commentList}" var="cm">	
				<div class="viewComment1">
					<div class="photo"><img src="img/tx/${cm.user.image_name}" alt="Image" /></div>
					<div class="text">
				        <div class="title">
				        	<div>用户：${cm.user.username}</div>
				          	<div>评论时间：<fmt:formatDate value="${cm.comment_time }"  pattern="yyyy年MM月dd日  HH:mm"/></div>
				        
								
				        </div>
				        	
				    	<div class="content">
				    	${cm.content }
				    	<c:if test="${sessionScope.user.id==cm.user.id}">
				    	<a href="deleteComment2ById?id=${cm.id} "><img src="img/icon/4.png" id="img-icon" class="img01 del"></a>
				    	</c:if>
				    	</div>	
				    	
				    </div>
				</div>
			</c:forEach>
			</c:if>
			</div>
			
			
			
			<!--评论框 发表评论-->
			<center>
			<div class="comment" id="comment">
				<span class="span">⌨️评论</span><br/><br/><br/>
				
				<form action="addComment2?chat_id=${chat.id}" method="post">
					<textarea placeholder="请发表你的评论……" name="content"></textarea><br><br>
				
				<c:if test="${sessionScope.user==null}">
					<input type="reset" value="发表评论" onclick="alert('请先登录')">
				</c:if>	
				
				<c:if test="${sessionScope.user!=null}">
					<input type="submit" value="发表评论">
				</c:if>	
				</form>
			
			</div>
			</center>
			
		</main>
	
		</br></br></br>
		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/parallax.min.js"></script>

</body>
</html>