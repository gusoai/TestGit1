<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户注册</title>
		
		<style type="text/css">
			.error{
				color:red;
			}
		</style>
		
		<link rel="stylesheet" type="text/css" href="./css/login.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
		
		
	</head>
	<body>
		<form  method="post" action="./regist.php">
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="./index.html" target="_self">小米商城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="username" placeholder="请输入你的用户名"/></div>
					<div class="username">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;&nbsp;<input class="shurukuang" type="text" name="sex" placeholder="请输入你的性别"/></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" id="password" name="password" placeholder="请输入你的密码"/></div>
					
					<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="repassword" placeholder="请确认你的密码"/></div>
					<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="phone" placeholder="请填写正确的手机号"/></div>
					<div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="yanzhengma" placeholder="请输入验证码"/></div>
						<div class="right fl"><img src="./image/yanzhengma.jpg"></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="regist_submit">
					<input class="submit" type="submit" name="submit" value="立即注册" >
				</div>
				
			</div>
		</div>
		</form>
		
		<script type="text/javascript">
			
			 $(function(){
				 //用来判断传来的电话号数据是否符合
				 jQuery.validator.addMethod("isMobile", function(value, element) {
				        var length = value.length;
				        var mobile = /^1[34578]\d{9}$/;/*/^1(3|4|5|7|8)\d{9}$/*/
				        return this.optional(element) || (length == 11 && mobile.test(value));
				    }, "请正确填写您的手机号码");
				//jqury 中的方法  validate  用来提供验证
					$("form").validate({
						//点击提交按钮时，如果验证通过，执行相关的逻辑
						submitHandler:function(){
							$.ajax({
								type:"post",
								url:"${pageContext.request.contextPath}/userRegister",
								data:$("form").serialize(),
								dataType:"json",
								success:function(data){
									if (data.code == 1) {
										window.location.href = "login.jsp";
									} else {
										alert(data.msg);
									}
									
								},
								error:function(){//ajax请求出问题了
									$("#tip").html("ajax请求异常");
								}
							})
						},
						
						
						//定义验证规则
						rules:{
							username:"required",
							password:"required", 
							repassword:{
								required:true,
								equalTo:"#password" //根据控件的ID属性获取值
							},
						
							phone:{
								required:true,
								isMobile:true
							}
						},
						//提示信息
						messages:{
							username:"必须输入用户名",
							password:"必须输入密码",
							repassword:{
								required:"必须输入二次确认密码",
								equalTo:"两次输入的密码要保持一致" 
							},
							phone:{
								required:"必须输入电话信息",
								isMobile:"电话格式不对"
							}
						}
						
					})
			 })
		</script>
	</body>
</html>