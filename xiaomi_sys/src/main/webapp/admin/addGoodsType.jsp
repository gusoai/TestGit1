<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<title>添加商品种类</title>
<script>

</script>
</head>
<body>
<div style="width:98%;margin-left: 1%;">
	<div class="panel panel-default">
		<div class="panel-heading">
			添加商品种类
		</div>
		<div class="panel-body">
			<form action="#" method="post">
				<div class="row">
					<div class="form-group form-inline">
						<span>所属类型</span>
						<select name="goodsParent" id="gradeSelect">
							<option value="0">--请选择--</option>
							
							
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group form-inline">
						<span>种类名称</span>
						<input type="text" name="gradeName" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="btn-group">
						<button type="reset" class="btn btn-default">清空</button>
						<button type="submit" class="btn btn-default">添加</button>
					</div>
				</div>
			</form>
			<p style="color:red" id="tip">msg</p>
		</div>
	</div>
</div>

	<script type="text/javascript">
	
		$(function(){
			//加载一级类别信息
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/querygrade?grade=1",
				dataType:"json",
				success:function(data){
					var infos = data.msg;
					
					if (data.code == 1) {
						$(infos).each(function(){
							var html = "<option value'"+this.id +"'>"+this.gradeName +"</option>";
							$("#gradeSelect").append($(html));
						})
					}else{
						alert(data.msg);
					}
				}
			})
		})
	</script>
	
	<script type="text/javascript">
	
		$("form").submit(function(){
			var typeName = $("input[name='gradeName']").val();
			if ($.trim(typeName).length ==0) {
				$("#tip").html("必须输入类型名");
				return false;
			}
			
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/addGrade",
				data:$("form").serialize(),
				dataType:"json",
				success:function(data){
					if (data.code==1) {
						window.location.href="admin.jsp";
					}else{
						alert(data.msg)
					}	
				}
			})
		})
	</script>
</body>
</html>