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
		function checkForm(form) {
	if(form.name.value == "") {
	alert("营养物质不能为空!");
	form.name.focus();
	return false;
	}
	if(form.value.value == "") {
	alert("百分比含量不能为空!");
	form.value.focus();
	return false;
	}
	return true;
	}

	</script>
<style type="text/css">
#a{
	position:relative;
	top:-650px;
	left:800px;
	color:grey;
	font-weight:bold;
}
.a{
	position:relative;
	top:-640px;
	left:650px;
}
.input3{
	width:140px;
	height:20px;
	border-left:0;
	border-right:0;
	border-top:0;
	text-align:center;
	outline-color:grey;
}
.input2{
	width:50px;
	height:20px;
	border-left:0;
	border-right:0;
	border-top:0;
	text-align:center;
	outline-color:grey;
}
form {
  padding: 25px;

}
.btn{

	border:1px  green;
	border-radius:5px;
	height:30px;
	width:50px;
	color:white;
	background-color: grey;
}

        table.gridtable {
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
	<div id="pie" style="width:650px; height:600px; margin-top:20px"></div>
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
	添加各个营养物质及百分比含量:
</span>
<div class="a">
<form action="addHealthyinfo" method="post" onsubmit="return checkForm(this);">
<input type="hidden" name="type_id" value="${requestScope.type_id}"/>
	<table  width=45%" cellpadding="0" cellspacing="0" border="1" class="gridtable">
    	<tr align="center" height="30">
    		<th>营养物质</th>
    		<th>百分比</th>
    		<th>操作</th>
    	</tr>
    		<tr align="center" height="30">
    		<td><input type="text" name="name" class="input3"/></td>
    		<td><input type="text" name="value" class="input2"/></td>
    		<td> 
    			<input type="submit" value="添加" class="btn">
    			<input type="reset" value="取消" class="btn"> 
    		</td>
    	</tr>  	
    </table>
   
</form>
</div>
		<footer class="tm-footer text-center">
			<p>Copyright 2023 Dietary Nutrition</p>
		</footer>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/parallax.min.js"></script>
</body>
</html>