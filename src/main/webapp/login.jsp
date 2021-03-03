<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script>
		$(function () {
			if (${not empty alert}){
				alert("${alert}");
			}
		})
	</script>
</head>
<body>
<div class="page">
	<div class="loginwarrp">
		<div class="logo">图书管理系统</div>
        <div class="login_form">
			<form id="Login" name="Login" method="post" onsubmit="" action="${pageContext.request.contextPath}/user/login" target="_top">
				<li class="login-item">
					<span>用户名：</span>
					<input type="text" name="username" class="login_input">
				</li>
				<li class="login-item">
					<span>密　码：</span>
					<input type="password" name="password" class="login_input">
				</li>
				<div class="clearfix"></div>
				<li class="login-sub">
					<input type="submit" name="Submit" value="登录" />
				</li>                      
           </form>
		</div>
	</div>
</div>
</body>
</html>