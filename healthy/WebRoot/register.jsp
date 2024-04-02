<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'register.jsp' starting page</title>
   <style>
	   body{
	        /* 设置背景渐变 */
	        background-image: linear-gradient(to right,
	        #7dc387,#dbe9ea);
	        display: flex;
	        justify-content: center;
	    }
	   .d{
	       width: 600px;
	       height: 100px;
		   color: #00aa7f;
		   font-size: 50px;
		   font-weight:bold;
	   }
	   
	   #submit{
	    width: 600px;
	    height: 700px;
	    margin: 0 auto;
	    background-color: #f4ffef;
	    box-shadow: #adec98 10px 10px 25px 7px;
	    border-radius: 20px;
	    display: flex;
	}
	table{
	    width: 600px;
	    height:600px;
	    font-family: 微软雅黑;
		font-weight: 600;
		font-size: 24px;
		margin-left: 15px;
		color: #757575;
	}
	.textbox{
	   width: 230px;
	   background-color:#f4ffef ;
	   outline: none;
	   border: 0;
	   border-bottom: 2px solid rgb(175, 175, 175);
	   font-size:20px;
	   color: #288652;
	}
	textarea{
	   width: 230px;
	   background-color:#f4ffef ;
	   outline: none;
	   
	   border-bottom: 2px solid rgb(175, 175, 175);
	   font-size:20px;
	   color: #288652;
	}
	.btn-list {
	    display: grid;
	    grid-template-columns: repeat(3,200px);
		
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
		margin-left: 70px;
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
	<script type="text/javascript">
			
			function f3 (){
				var t=document.getElementById("username").value;
				var f=document.getElementById("password").value;
				var c=document.getElementById("loginname").value;
				var a=document.getElementById("file").value;
				var b=document.getElementById("age").value;
				var d=document.getElementById("sign").value;
				if(t=="" || f=="" || c=="" || a==""|| b==""|| d==""){
					alert("用户名、密码、登录名、头像、年龄和个性签名不能为空');				
				}else{			
						document.getElementById("form2").submit();	
					
				}
			}
		</script>
	<script type="text/javascript">
	
	function upFile(event) {
		const [ file ] = event.target.files || event.dataTransfer.files || this.file.files;
		
		console.dir(file); // 文件对象
		console.log(file.name); // 文件名称  
		console.log(file.type); // 文件类型
	    console.log(file.size); // 文件大小
		
		// 对文件类型做简单限制：如：只允许上传 jpg  png gif 这3种格式
		if(!file.type && /\.(?:jpg|png|gif)$/.test(file.name)) ){ 
		    alert('对不起：上传的图片格式只能是：jpg, png, gif 格式！'); 
	    	return false; 
	    } 
	}
	
	
	</script>
		 
	  </head>
	  
	  <body bgcolor="#dbead5">
	  
	   
	    	 <div align="center">
	 				<br/>
	    			<div class="d">请填写以下注册信息</div>
	    			<br/>
	    		 <div id="submit">
	       		 <div style="margin: 70px 50px 80px 50px ">
	    			<form action="addUser" method="post"  enctype="multipart/form-data">
	    			<input type="hidden" name="role" value="2"/>
	    				<table>
	    				<tr>
	    					<td width="30%" align="right">用户名：</td>
	    					<td><input type="text" name="username" class="textbox" id="username" placeholder="请输入用户名"/></td>
	    				</tr>
	    				<tr>
	    					<td width="30%" align="right">登录名：</td>
	    					<td><input type="text" name="loginname" class="textbox" id="loginname" placeholder="请输入用户名"/></td>
	    				</tr>
	    				<tr>
	    					<td width="30%" align="right">用户密码：</td>
	    					<td><input type="password" name="password" class="textbox" id="password" placeholder="请输入密码"/></td>
	    				</tr>
	    				<tr>
	    					<td width="30%" align="right">用户性别：</td>
	    					<td><input type="radio" name="sex" value="1" checked>男
	                            <input type="radio" name="sex" value="2">女
	                        </td>
	    				</tr>
	    				<tr>
	    					<td width="30%" align="right">用户年龄：</td>
	    					<td><input type="text" name="age" class="textbox" id="age" placeholder="请输入年龄"/></td>
	    				</tr>
	    				<tr>
	    					<td width="30%" align="right">上传头像：</td>
	    					<td><input type="file" name="file" id="file" onclick="upFile"/></td>
	    				</tr>
						<tr>
	    					<td width="30%" align="right">个性签名：</td>
	    					<td><textarea name="sign" id="sign"></textarea></td>
	    				</tr>
						<tr>
							<div class="btn-list">
							<td width="30%"><input type="submit"  class="btn boom" value="注册" border="none"/></td>
							<td><input type="reset" class="btn boom" value="重置" border="none"/></td>
						</div>
						</tr>
						
							</table>
						 
	    			</form>
	    			</div>
	    			</div>
	    			</div>
	    		
	  </body>
</html>
