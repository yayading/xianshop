<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>注册页-澳猫团</title>
	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/base1.css">
	<link rel="stylesheet" href="css/login.css">
	<!-- 视图窗口，移动端特属的标签。 -->
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no" />
	<link media="screen and (min-width: 992px) and (max-width:1200px)" rel="stylesheet" href="css/base1-small.css">
	<link media="screen and (min-width: 992px) and (max-width:1200px)" rel="stylesheet" href="css/login-small.css">
	<link media="screen and (min-width: 768px) and (max-width:991px)" rel="stylesheet" href="css/base1-pad.css">
	<link media="screen and (min-width: 768px) and (max-width:991px)" rel="stylesheet" href="css/login-pad.css">
</head>
<body>
	<!-- 顶部 -->
	<header>
		<!-- 搜索和logo -->
		<div class="logoAndSearch textWarp w1190 clearfix">
			<div class="logo">
				<a href="list.jsp">澳猫网</a>
			</div>
			<div class="LAStxt">
				欢迎登录
			</div>
			 <!--<div class="search">
				<div class="txt">
					<input type="text" placeholder="Swisse/澳洲">
					<em></em>
				</div>
				<a href="#" class="btn">
					搜索
				</a>
				  <ul>
					<li><a target="_blank" href="#">胶原蛋白</a></li>
					<li><a target="_blank" href="#">叶绿素</a></li>
					<li><a target="_blank" href="#">睡眠片</a></li>
					<li><a target="_blank" href="#">儿童维生素</a></li>
					<li><a target="_blank" href="#">鱼肝油</a></li>
					<li><a target="_blank" href="#">保健品</a></li>
					<li><a target="_blank" href="#">美容</a></li>
					<li class="BN"><a target="_blank" href="#">运动保健</a></li>
				</ul> -->
				
			</div>
		</div>
	</header>
	<!-- 中间内容 -->
	<div class="mainArea">
		<div class="mainAreaW textWarp w1190">
			<div class="mainContent boxS">
				<div class="MCup clearfix">
					<div class="MCright W310">
					<form method="post" action="user/register">
						<h3 class="clearfix">
							<span>注册澳猫团</span>
							<!--  <a target="_blank" href="register.jsp">免费注册</a> -->
						</h3>
						<p class="userName">
							<em></em>
							
							<input class="W310" name="username" placeholder="请输入您的用户名称" type="text">
						</p>
						<p class="passWord">
							<em></em>
							<input class="W310"  name="password" placeholder="请输入密码" type="password">
						</p>
						<p class="userName">
							<em></em>
							<input class="W310" name="nicheng" placeholder="请输入您的用户昵称" type="text">
						</p>
						<p class="clearfix yzm">
							<input type="text" placeholder="验证码">
							<span class="Ypic">
								<span class="YP"></span>
								<a href="#">换一张</a>
							</span>
						</p>
						<!--  <p class="clearfix Jzmm">
							<span class="checkbox checked"></span>
							<span>记住密码</span>
							<a target="_blank" href="#">忘记密码？</a>
						</p> --><br><br>
					
						<input class="loGin W310" type="submit" value="注册" />
					</div>
					</form>
					<div class="MCleft W115">
						<img src="images/xian.png"  style="width: 100px;height: 100px" alt="用户图像">
						<div class="pL">
						
						<div class="pL">
							<span>欢迎您</span>
							
						</div>
					</div>
				</div>
				<div class="MCdown">
					<p>使用其他账户注册</p>
					<ul>
						<li class="clearfix">
							<em></em>
							<a href="#">QQ注册</a>
						</li>
						<li class="clearfix">
							<em></em>
							<a href="#">微博注册</a>
						</li>
						<li class="clearfix">
							<em></em>
							<a href="#">腾讯注册</a>
						</li>
						<li class="clearfix">
							<em></em>
							<a href="#">微信注册</a>
						</li>
						<li class="clearfix BN">
							<em></em>
							<a href="#">百度注册</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部 -->
	
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/jquery.lazyload.min.js"></script>
	<script src="js/login.js"></script>
</body>
</html>