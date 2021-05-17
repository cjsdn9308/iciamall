<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#title {
	text-align: center;
}

#login_all {
	width: 1240px;
	font-size: 12px;
	margin: 0 auto;
}

#login_username, #login_password {
	width: 402px;
	height: 41px;
	border: 1px solid rgba(147, 147, 147, 1);
	margin: 0 auto;
}

#login_username span, input, #login_password span, input {
	height: 39px;
	margin: auto 0;
}
#login_username input, #login_password input{
	padding-left:12px;
	border: none;
	width: 247px;
	margin: auto;
	height: 39px;
}
#login_username span, #login_password span{
	margin-top:30px;
	padding-left: 12px;
	font-size: 18px;
	color:rgba(147, 147, 147, 1)
}



#login_btn_div{
	margin: 0 auto;
	text-align: center;
}

#login_btn{
	margin:0 auto;
	width: 402px;
	height: 46px;
	background-color: black;
	text-align: center;
	color:white;
	border: none;
	cursor: pointer;
}

#login_btn:hover{
	background-color: lightgray;
}


#login_all input:focus{
	outline: none;
	background-color: white;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../etc/topnav.jsp" />
	</header>

	<div id="title">
		<h2>로그인</h2>
	</div>

	<div id="login_all">
		<form id="login_form" action="/www/user/login" method="post">
			<div id="login_username">
				<span>
					<i class="fa fa-user" aria-hidden="true">
					</i>&nbsp;&nbsp;&nbsp;ID
				</span>
				<input type="text" name="username">
			</div>


			<br>

			<div id="login_password">
				<span>
					<i class="fa fa-unlock-alt" aria-hidden="true">
					</i>&nbsp;&nbsp;&nbsp;PW
				</span>
				<input type="password" name="password">
			</div>

			<br> <br>
			<input type="hidden" name="_csrf" value="${_csrf.token }">
			<div id="login_btn_div">
			<button id="login_btn" type="submit">LOG-IN</button>
			</div>
		</form>
	</div>

</body>
</html>