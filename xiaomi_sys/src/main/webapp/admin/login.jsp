
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<script type="text/javascript" src="../js/jquery.min.js" ></script>
		<script type="text/javascript" src="../js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="../js/jquery.validate.min.js" ></script>
		
	</head>
	<body>
		<script type="text/javascript">
		$(function(){
			$("#eye").click(function(){
				if($("#password").attr("type")=="password"){
					$("#password").attr("type","text");
					$("#eye").attr("class","glyphicon glyphicon-eye-close");
				}else{
					$("#password").attr("type","password");
					$("#eye").attr("class","glyphicon glyphicon-eye-open");
				}
			})
		})
	</script>
	<style type="text/css">
		#main{
			/*position: absolute;*/
			width: 400px;
			height: 300px;
			/*left:50%;
			top:40%;
			margin-left: -200px;
			margin-top: -100px;*/
			margin: 100px auto;
		}
	</style>
		<div id="main" class="panel panel-primary">
		
	
			<div class="panel-heading">
				<div class="panel-title">
					后台登录
				</div>
			</div>
			<div class="panel-body">
				<div style="text-align: center;">
					<img src="../image/mistore_logo.png" alt="logo" width="30%" height="30%" />
				</div>
		
				<div>
					<form id="myform" action="" method="post" onsubmit="return false;">
					<div class="form-group">
						<label>用户名:</label>
						<input type="text" name="username" id="" class="form-control" placeholder="请输入用户名"/>
					</div>
					<div class="form-group">
						<label>密&nbsp;&nbsp;&nbsp;码:</label>
						<div class="input-group">
							<input type="password" name="password" id="password" class="form-control"  placeholder="请输入密码"/>
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-eye-open" id="eye"></span>
							</span>
						</div>
					</div>
					<div id="tip"></div>
					<div class="form-group" style="text-align: center;">
						<input type="submit" value="登录" class="btn btn-primary">
						<input type="reset" value="重置" class="btn btn-default">
					</div>
				</form>
					
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		
			$(function(){
				//jqury 中的方法  validate  用来提供验证
				$("#myform").validate({
					//点击提交按钮时，如果验证通过，执行相关的逻辑
					submitHandler:function(){
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/adminuser",
							data:$("#myform").serialize(),
							dataType:"json",
							success:function(data){
								if (data.code == 1) {
									window.location.href = "admin.jsp";
								} else {
									$("#tip").html(data.msg);
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
					},
					//提示信息
					messages:{
						username:"必须输入用户名",
						password:"必须输入密码",
					}
					
				})
			})
		
		</script>
	</body>
</html>
