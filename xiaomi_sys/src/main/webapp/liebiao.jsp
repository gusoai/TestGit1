<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米手机列表</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
	</head>
	<body>
、	<!-- 如果用的多的可以放在一个单独的jsp然后包含他 -->
	<%@ include file= "header.jsp"%>
	<!-- start banner_y -->
	<!-- end banner -->

	<!-- start danpin -->
		<div class="danpin center">
			
			<div class="biaoti center" id="gradeInfo"></div>
			<div class="main center" id="goodsInfo">
				
				<div class="clear"></div>
			</div>
		</div>
		

		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>

		</footer>

	<!-- end danpin -->
		<script type="text/javascript">
			$(function(){
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/queryGradeGoods?grade=2&gradeId=${param.id}",
					dataType:"json",
					success:function(data){
						if (data.code ==1) {
							$("#gradeInfo").html(data.msg[0].gradeName);
							var infos = data.msg[0].goodsList;
							$(infos).each(function(){
								var html = "<div class='mingxing fl mb20' style='border:2px solid #fff;width:230px;cursor:pointer;' onmouseout='this.style.border=\"2px solid #fff\"' onmousemove='this.style.border=\"2px solid red\"'>";
								html +=	"<div class='sub_mingxing'><a href='./xiangqing.jsp?id=" + this.id + "' target='_blank'><img src='img/" + this.imgPath + "' alt=''></a></div>";
								html +=	"	<div class='pinpai'><a href='./xiangqing.jsp?id=" + this.id + "' target='_blank'>" + this.goodsName + "</a></div>";
								html +=	"	<div class='youhui'>5.16早10点开售</div>";
								html +=	"	<div class='jiage'>" + this.price + "元</div>";
								html +=	"</div>";
								
								$("#goodsInfo").append($(html));
							})
						}
					}
				})
			})
		
			
		</script>

	</body>
</html>