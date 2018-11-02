<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米商城-个人中心</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
	</head>
	<body>
	<!-- start header -->
	<%@include file="header.jsp" %>
<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./self_info.html">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div id="orderInfo" class="ddzxbt" >交易订单</div>
<!-- 			<div class="ddxq"> -->
<!-- 				<div class="ddspt fl"><img src="./image/gwc_xiaomi6.jpg" alt=""></div> -->
<!-- 				<div class="ddbh fl">订单号:1705205643098724</div> -->
<!-- 				<div class="ztxx fr"> -->
<!-- 					<ul> -->
<!-- 						<li>已发货</li> -->
<!-- 						<li>￥2499.00</li> -->
<!-- 						<li>2017/05/20 13:30</li> -->
<!-- 						<li><a href="">订单详情></a></li> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				<div class="clear"></div> -->
<!-- 			</div> -->
			
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
		
		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
		
		<script type="text/javascript">
			$(function(){
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/queryOrder",
					dataType:"json",
					success:function(data) {
						if (data.code==1) {
							var infos = data.msg;
							$(infos).each(function(){
								var html = "<div class='ddxq'>";
								html +="<div class='ddspt fl'><img src='./image/gwc_xiaomi6.jpg' alt=''></div>";
								html +="<div class='ddbh fl'>订单号:"+this.orderCode +"</div>";
								html +="<div class='ztxx fr'>";
								html +="<ul>";
								switch (this.status) {
								case 1:
									html +="<li>未付款<button>付款</button></li>";
									break;
								case 2:
									html +="<li>未发货<button>取消订单</button></li>";
									break;
								case 3:
									html +="<li>未收货<button>确认发货</button></li>";
									break;
								case 4:
									html +="<li>已发货<button>评价</button></li>";
									break;
								case 4:
									html +="<li>订单完成</li>";
									break;
								}
								
								html +="<li>￥"+ this.money +"</li>";
								html +="<li>"+ this.createDate +"</li>";
								html +="<li><a href=''>订单详情></a></li>";
								html +="<div class='clear'></div>";
								html +="</ul>";
								html +="</div>";
								
								$("#orderInfo").append($(html));
							})
						}
					}
				})
				
			})
		</script>
	</body>
	
</html>