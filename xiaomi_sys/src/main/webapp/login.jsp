
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>会员登录</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
	</head>
	<body>
		<!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="./index.html" target="_blank"><img src="./image/mistore_logo.png" alt=""></a>
			</div>
		</div>
		<form  method="post" class="form center" onsubmit="return false">
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="register.jsp" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">用户名:&nbsp;<input class="shurukuang" type="text" name="username" placeholder="请输入你的用户名"/></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码"/></div>
					<div class="username">
						<div class="left fl">验证码:&nbsp;<input class="yanzhengma" type="text" name="validate" placeholder="请输入验证码"/></div>
						<div class="right fl"><img id="codeImg" src="createCode"></div><!-- src获取验证码的servlet资源的url -->
						<div class="clear"></div>
					</div>
				</div>
				<div class="login_submit">
					<input class="submit" type="submit" name="submit" value="立即登录" >
				</div>
				
			</div>
		</div>
		</form>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="./image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>

		</footer>
		
		<script type="text/javascript">
		//点击验证码图片获取新的验证码图片
			$("#codeImg").click(function(){
				$(this).attr("src","createCode?r="+Math.random());
			})
			
			$("form").submit(function(){
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/userLogin",
					data:$("form").serialize(),
					dataType:"json",
					success:function(data){
						if(data.code == 1) {
							window.location.href="index.jsp";
						} else{
							alert(data.msg);
						}
					}
				})
			})
			
		</script>
	</body>
</html>