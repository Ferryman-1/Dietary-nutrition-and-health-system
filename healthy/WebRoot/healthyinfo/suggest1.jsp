<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Simple House Template</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
	<link href="css/templatemo-style.css" rel="stylesheet" />
	
</head>

<body> 
<div class="container">
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
								<li class="tm-nav-li"><a href="selectMenu" class="tm-nav-link">菜谱</a></li>
								<li class="tm-nav-li"><a href="selectSuggest?type_id=0" class="tm-nav-link  active">健康建议</a></li>
								<li class="tm-nav-li"><a href="selectChat" class="tm-nav-link">帖子</a></li>
								
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
				<div class="tm-paging-links">
				<nav>
				
					<form action="selectSuggest" class="forms" id="form1" method="post" >
						<select name="type_id">
						<c:forEach items="${requestScope.typeList}" var="type">
							<option value="${type.id}"
							<c:if test="${requestScope.type_id==type.id}">selected</c:if>
							>${type.type_name }</option>
						</c:forEach>
						
						</select>
						<input type="submit"  value="搜索" class="but"/>
					</form>
				</nav>
			</div>
	<div id="pie" style="width:1150px; height:600px;margin-top:25px;"></div>
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
      radius: [50, 250],
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
<main>
	<div class="tm-container-inner tm-featured-image">
				<div class="row">
					<div class="col-12">
						<div class="placeholder-2">
							<div class="parallax-window-2" data-parallax="scroll" data-image-src="img/jy/ssbt.jpg"></div>		
						</div>
					</div>
				</div>
			</div>
			<div class="tm-container-inner tm-history">
				<div class="row">
					<div class="col-12">
						<div class="tm-history-inner">
							<img src="img/jy/sbz.jpg" alt="Image" class="img-fluid tm-history-img" />
							<div class="tm-history-text"> 
								<h4 class="tm-history-title">上班族女人早餐吃什么好</h4>
								<p class="tm-mb-p">1.一定要吃早餐
													2.要吃脂肪少的早餐
													3.谷类早餐应受青睐
													4.注意摄取维生素、叶酸和铁
													5.不要过多摄入脂肪</p>
								<p>失眠、肤色暗淡的女性：虫草老龟汤、土茯苓老龟汤<br>
									工作太忙、压力太大的女性：西洋参甲鱼汤<br>
									秋冬干燥、肺热、咳嗽多痰的女性：虫草煲水鸭汤<br>
									月经不调，皮肤粗糙的女性：红枣乌鸡汤<br>
									压力性头痛的女性：天麻乳鸽汤</p>
							</div>
						</div>	
					</div>
				</div>
			</div>
			
			<div class="tm-container-inner tm-history">
				<div class="row">
					<div class="col-12">
						<div class="tm-history-inner">
							<div class="tm-history-text">
								<h4 class="tm-history-title">哪些食物是不能和生姜搭配食用</h4>
								<p class="tm-mb-p">生姜不可和这6种食物同吃：</p>
								<p>1、不可与马肉一起吃<br>
								2、不可与兔肉一起吃<br>
								3、不可与生鱼一起吃<br>
								4、不可与酒一起吃<br>
								5、不可与韭菜一起吃<br>
								6、不可与芹菜一起吃</p>
							</div>
							<img src="img/jy/sj.png" alt="Image" class="img-fluid tm-history-img" />
						</div>	
					</div>
				</div>
			</div>
			
			<div class="tm-container-inner tm-history">
				<div class="row">
					<div class="col-12">
						<div class="tm-history-inner">
							<img src="img/jy/yqbx.jpg" alt="Image" class="img-fluid tm-history-img" />
							<div class="tm-history-text"> 
								<h4 class="tm-history-title">秋冬手脚冰冷，5款益气补血汤补一补！</h4>
								<p class="tm-mb-p">
									1、补血鸡肉汤：鸡肉中含有丰富的蛋白质、10多种氨基酸，其组成结构接近人体所需的比例，适合身体虚弱、气血不足、营养不良的人食用。<br>
									2、鱼胶滋补汤：鱼胶具有补气血、养容颜之功效，可用于气血不足、神疲体倦、肌肤不泽、面部皱纹者;鱼胶对外科手术病人的伤口恢复也有一定帮助，产后妈妈特别适合食用。<br>
									3、茶树菇炖排骨汤：排骨被中医认为是能够补中益气、调理气血的好食材。<br>
									4、田七乌鸡汤：乌鸡能滋补肝肾，这道汤具有补血调经、除烦退热之功。对于气血不足、肝肾阴虚而见潮热盗汗者疗效更显著，但不适宜孕期妇女饮用。<br>
									5、金针猪肝汤：猪肝能明目、补血益气，这道汤有补充体力的功效。</p>
							</div>
						</div>	
					</div>
				</div>
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