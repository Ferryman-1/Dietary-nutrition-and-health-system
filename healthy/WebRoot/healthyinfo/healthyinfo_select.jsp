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
			allCheckbox=document.getElementsByName("ids");
			checkall=document.getElementById("checkAll");
			if(checkall.checked){
				for(var i = 0;i<allCheckbox.length;i++){
					allCheckbox[i].checked = true;
					num = count;
				}
			}else{
				 for(var i = 0;i<allCheckbox.length;i++){
				 	allCheckbox[i].checked = false;
				 	num = 0;
				 }
			}
		}
		
	</script>
<style type="text/css">
#a{
	position:absolute;
	top:350px;
	margin-left:745px;
	color:grey;
	font-weight:bold;
		
}
.a{
	position:absolute;
	top:400px;
	margin-left:670px;	
}
form {
  padding: 25px;
  margin-left:10px;	
}
.form{
	position: relative;
	top:150px;
	left:610px;
}
.btn{
	border:1px  green;
	border-radius:5px;
	height:40px;
	width:90px;
	color:white;
	background-color: grey;
}
.btn1{

	border:1px  green;
	border-radius:5px;
	height:30px;
	width:50px;
	color:white;
	background-color: grey;
}
        table.gridtable {
        position: relative;
        
            font-family: verdana,arial,sans-serif;
            font-size:16px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
 
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
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
								
								<li class="tm-nav-li"><a href="selectMenu" class="tm-nav-link">菜谱管理</a></li>
								<li class="tm-nav-li"><a href="selectSuggest?type_id=0" class="tm-nav-link   active">健康建议管理</a></li>
								<li class="tm-nav-li"><a href="selectChat" class="tm-nav-link ">帖子管理</a></li>
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
				
				
				<h2  class="col-12 text-center ">
					<form action="selectSuggest" class="forms" id="form1" method="post">
						<select name="type_id">
						<c:forEach items="${requestScope.typeList}" var="type">
							<option value="${type.id}"
							<c:if test="${requestScope.type_id==type.id}">selected</c:if>
							>${type.type_name }</option>
						</c:forEach>
						
						</select>
						<input type="submit"  value="搜索" class="but"/>
					</form>
				</h2>
			</header>
							<div class="tm-paging-links">
				<nav>
			
					
				
				</nav>
			</div>
	<div id="pie" style="width:650px; height:600px; margin-top:5px"></div>
	<script src="js/echarts.min.js"></script>
	<script type="text/javascript">
		const option = {
		 title: {
    text: '健康建议营养成分饼状图',
    subtext: '请点击查看喔',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    top: 'bottom'
  },
  toolbox: {
    show: true,
    feature: {
      mark: { show: true },
      dataView: { show: true, readOnly: false },
      restore: { show: true },
      saveAsImage: { show: true }
    }
  },
  series: [
    {
      name: 'Nightingale Chart',
      type: 'pie',
      radius: [50, 230],
      center: ['50%', '50%'],
      roseType: 'area',
      itemStyle: {
        borderRadius: 8
      },
       data: ${requestScope.healthyInfoListJson}
    }
  ]
};

var chartDom = document.getElementById('pie');
var myChart = echarts.init(chartDom);
myChart.setOption(option);
	</script>
<span id="a">
	查询各个营养物质及百分比含量:&nbsp;&nbsp;<input type="button" onclick="location.href = 'addHealthyInfoView?type_id=${healthyInfo.type_id}'" class="btn" value="添加营养物质"/>
</span>
<div class="a">
	<table  width=120%" cellpadding="0" cellspacing="0" border="1" class="gridtable">
    	<tr align="center" height="30">
    		<th><input type="checkbox" id="checkAll" onclick="selectAll()">全选</th>
    		<th>营养物质</th>
    		<th>百分比</th>
    		<th>操作</th>
    	</tr>
    	<c:forEach items="${requestScope.healthyInfoList}" var="healthyInfo">
    		<tr align="center" height="30">
    		<td><input type="checkbox" name="ids" value="${healthyInfo.id}"></td>
    		<td>${healthyInfo.name }</td>
    		<td>${healthyInfo.value }</td>
    		<td>
    			<input type="button" onclick="location.href = 'updateHealthyInfoView?id=${healthyInfo.id}&type_id=${healthyInfo.type_id}'"  class="btn1" value="修改"/>
    			<input type="button" onclick="if (confirm('确定是否删除该营养物质')) {  location.href = 'deleteHealthyinfo?id=${healthyInfo.id}&type_id=${healthyInfo.type_id}'} " class="btn1" value="删除"/>
    		</td>
    	</tr>
    	</c:forEach>
    </table>
</div>
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