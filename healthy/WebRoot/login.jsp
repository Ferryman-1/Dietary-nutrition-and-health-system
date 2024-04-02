<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
<style type="text/css">
	 body{
	            /* 设置背景渐变 */
	        background-image: linear-gradient(to left,
	          #09a78d,#0c3a2d);
	            display: flex;
	            justify-content: center;
	        }
	        .a{
	            position:relative;
	            top: 100px;
	            width: 1100px;
	            height: 550px;
	            box-shadow: 0 5px 15px rgba(0,0,0,.8);
	            display: flex;
	        }
	        .b{
	            width: 700px;
	            height: 550px;
	            background-image: url("img/main3.jpg");
	            /* 让图片适应大小 */
	            background-size: cover;
	        }
	        .c{
	            width: 400px;
	            height: 550px;
	            background-color: white;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	        }
	        .d{
	            width: 300px;
	            height: 500px;
	        }
	        .d h1{
	            font: 900 35px '';
	        }
			.radio{
			   width: 300px;
			   height: 40px;
			   appearance: none;
			   position: relative;
			   color:#4a4a4a;
			   font-size: 20px;
			}
	        .e{
	            width: 230px;
	            margin: 20px 0;
	            outline: none;
	            border: 0;
	            padding: 10px;
	            border-bottom: 2px solid rgb(175, 175, 175);
	            font-size:20px;
	            color: #288652;
	        }
			
	        .f{
	            float: right;
	            margin-top:30px;
				margin-right:30px;
				text-decoration: none;
				color: #1fc580;
	        }
	        
	         .dl{
	            float: left;
	            font-size:25px;
	            font-weight:bold;
	            margin-top:20px;
				text-decoration: none;
				color: #ff94a8;
	        }
			
			a:hover{
				box-shadow: inset 160px 0 0 0 #319966;
				color: #ffffff;
			}
			
	        .btn-list {
	            display: grid;
	            grid-template-columns: repeat(3,200px);
				margin-top:100px;
	        }
	        
	        .btn {
	            width: 100px;
	            height: 50px;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            font-size:  20px;
	            cursor: pointer;
	            user-select: none;
	            letter-spacing: 1rem;
	            text-indent: 1rem;
	            border-radius:30px;
	            box-sizing: border-box;
	        }
	        .boom {
	            background-color: #319966;
	            color: #fff;
	            position: relative;
	            z-index: 1;
	        }
	        
	        .boom::before {
	            content: "";
	            position: absolute;
	            z-index: -1;
	            top: 0;
	            left: 0;
	            bottom: 0;
	            right: 0;
	            border: 2px solid #319966;
	            border-radius: 30px;
	            transform-origin: center;
	        }
	        
	        .boom:hover::before {
	            transform: scale(1.25);
	            transition: all ease-out .5s;
	            border: 1px solid #96f3e0;
	            opacity: 0;
	        }
	
	</style>
	  </head>
	  
	  <body bgcolor="#b7d5ac">
	    <div class="a">
	        <div class="b"></div>
	        <div class="c">
	        	<form action="login" method="post">
				<div align="center"> </div>
					<div class="d">
						<div align="center"> </div>
						<h1 align="center" style="color:#319966">膳食营养健康系统</h1>
						<input type="text" class="e"  name="loginname"  placeholder="请输入用户名">
						<input type="password" class="e"  name="password" placeholder="请输入密码">
						<br>
						<br>
				<div class="radio">
	                <input type="radio" name="role" value="1">管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <input type="radio" name="role" value="2" checked>普通用户
				</div>
				<div class="dl">${msg }</div>
	            <a href="register" class="f">没有登录过?点击注册</a>
				<div class="btn-list">
					<input type="submit" class="btn boom" value="登录" border="none"/>
					<div class="btn boom" onclick="location.href='selectMenuByTypeId'">
						游客
					</div>
					</div>
				</div>
				</form>
	        </div>
	        </div>
	 
	  </body>
</html>
