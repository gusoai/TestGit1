<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米6立即购买-小米商城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
	</head>
	<body>
	<%@include file="header.jsp" %>
	<!--end header -->


	
	<!-- xiangqing -->
	<form action="post" method="">
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl" id="headname"></div>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
		<div class="left fl"><img id="imgPath" src=""></div>
		<div class="right fr">
		
			<!-- 通过hidden控件提供Id -->
			<input id="goodsId" type="hidden" name="goodsId">
			<div class="h3 ml20 mt20" id="nameInfo"></div>
			<div class="jianjie mr40 ml20 mt10" id="commentInfo"></div>
			<div class="jiage ml20 mt10" id="priceInfo"></div>

			<div class="xiadan ml20 mt20">
					<input id="buyBtn" class="jrgwc"  type="button" name="buy" value="立即选购" />
					<input id="cartBtn" class="jrgwc" type="button" name="cart" value="加入购物车" />
				
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</form>
	<!-- footer -->
	<footer class="mt20 center">
			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

		</footer>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/queryGoods?id=${param.id}",
				dataType:"json",
				success:function(data){
					if (data.code ==1) {
						var infos = data.msg;
						$("#goodsId").val(infos.id);
						$("#headname").html(infos.goodsName);
						$("#nameInfo").html(infos.goodsName);
						$("#commentInfo").html(infos.comment);
						$("#priceInfo").html(infos.price);
						$("#imgPath").attr("src","img/"+infos.imgPath);
					} else{
						alert(data.msg);
					}
				}
			})
		})
		//立即购买
		$("#buyBtn").click(function(){
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/addOrder",
				data:{goodsId:$("#goodsId").val(),num:1},
				dataType:"json",
				success:function(data){
					if (data.code == 1) {
						
					window.location.href="dingdanzhongxin.jsp"
					}else{
						alert(data.msg)
					}
				}
			})
		})
		
		$("#cartBtn").click(function(){
			type:"get",
			url:
		})
	
	</script>
	</body>
</html>