<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script>
function usernameCheck() {
	var $username = $("#username").val();
	var pattern = /^[a-z0-9]{4,16}$/;
	if($username=="") {
		$("#username_msg").text("필수입력입니다");
		return false;
	}else{
		if(pattern.test($username)==false){
			$("#username_msg").text("아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요");
			return false;
		}else{
			var usernameUrl = "/www/users/user/username?username=";
			$.ajax(usernameUrl+$("#username").val())
				.done(()=>{$("#username_msg").text("좋은 아이디네요")})
				.fail(()=>{$("#username_msg").text("사용중인 아이디입니다")});
		}
		
	}
}

function emailCheck() {
	var $email = $("#email").val();
	var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if($email=="") {
		$("#email_msg").text("필수입력입니다");
		return false;
	}else{
		if(pattern.test($email)==false){
			$("#email_msg").text("유효한 이메일을 입력해 주세요");
			return false;
		}else{
			$.ajax({
				url: "/www/users/user/email?email=" + $("#email").val()
			}).done(()=>{$("#email_msg").text("사용가능한 이메일입니다")})
			.fail(()=>{$("#email_msg").text("사용중인 이메일입니다")});
		}
	}
}
function passwordCheck_01() {
	var $password_01 = $("#password_01").val();
	var pattern = /^[0-9]{4,16}$/;
	if($password_01=="") {
		$("#password_01_msg").text("패스워드는 필수입력입니다");
		return false;
	}else{
		if(pattern.test($password_01)==false){
			$("#password_01_msg").text("패스워드는 숫자 4~16자로 입력해 주세요");
		}else{
			$("#password_01_msg").text("");
		}
	}
}
function passwordCheck_02() {
	var $password_01 = $("#password_01").val();
	var $password_02 = $("#password_02").val();
	if($password_02=="") {
		$("#password_02_msg").text("필수 입력 사항입니다");
		return false;
	}else{
		if($password_01!=$password_02){
			$("#password_02_msg").text("패스워드가 일치하지 않습니다.");
			return false;
		}else{
			$("#password_02_msg").text("");
		}
	}
}
function irumCheck() {
	var $irum = $("#irum").val();
	if($irum=="") {
		$("#irum_msg").text("이름은 필수입력입니다");
		return false;
	}else{
		$("#irum_msg").text("");
	}
}
function joinDone(){
	window.location.href='/www/user/login';
}


$(document).ready(function() {
	$("#username").on("blur", function() {
		usernameCheck();
	})
	$("#email").on("blur", function() {
		emailCheck();
	})
	$("#password_01").on("blur", function() {
		passwordCheck_01();
	})
	$("#password_02").on("blur", function() {
		passwordCheck_02();
	})
	$("#irum").on("blur", function() {
		irumCheck();
	})
	$("#join_btn").on("click", function() {
		// multipart/form-data를 처리하는 자바스크립트 내장 객체 FormData 생성
		//var formData = new FormData($("#join_form")[0]);
		var r1 = usernameCheck();
		var r2 = emailCheck();
		var r3 = passwordCheck_01();
		var r4 = passwordCheck_02();
		var r5 = irumCheck();
		if((r1&&r2&&r3&r4&&r5)==false){
			return false;
		}
		var formData = new FormData($("#join_form")[0]);
		$.ajax({
			url: "/www/users/new",
			method: "post",
			data: formData,
			processData: false,
			contentType: false
		}).done(()=>joinDone())
		.fail(()=>alert('가입신청 실패'));
		
		
	});
});
</script>
<style>
#title {
	text-align: center;
}

#join_all {
	width: 1240px;
	margin: 0 auto;
	font-size: 12px;
}

#join_all input {
	border: 1px solid rgba(213, 213, 213, 1);
}

#basic_info input {
	width: 145px;
	height: 28px;
	margin-left: 10px;
}

#join_all table {
	width: 1240px;
	border: 1px solid rgba(225, 225, 224, 1);
	border-collapse: collapse;
}

#join_all tr {
	height: 52px;
}

#join_all table th {
	text-align: left;
	width: 20%;
	padding-left: 10px;
	border: 1px solid rgba(147, 147, 147, 1);
}

#join_all table td {
	width: 80%;
	border: 1px solid rgba(147, 147, 147, 1);
}

#user_type_table label {
	margin: auto;
}

h5 {
	font-size: 16px;
}

#join_btn_div {
	margin: 0 auto;
	text-align: center;
}

#join_btn input::-webkit-outer-spin-button,input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
#join_btn {
	width: 177px;
	height: 56px;
	background-color: black;
	color: white;
	border: none;
	cursor: pointer;
}
#join_btn:hover {
	background-color: lightgray;
}


</style>


</head>





<body>
	<header>
		<jsp:include page="../etc/topnav.jsp" />
	</header>

	<br>

	<div id="title">
		<h2>회원가입</h2>
	</div>


	<div id="join_all">
		<form id="join_form">
			<div>
				<table id="user_type_table">
					<tr>
						<th>회원구분</th>
						<td><input type="radio" checked="checked" >개인회원</td>
					</tr>
				</table>
			</div>

			<br>
			<div>
				<h5>기본정보</h5>
				<table id="basic_info">
					<tr>
						<th>아이디</th>
						<td><input type="text" id="username" name="username">&nbsp;&nbsp;&nbsp;(영소문자/숫자,4~16)&nbsp;&nbsp;
							<span id="username_msg"></span></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="password_01" name="password">&nbsp;&nbsp;&nbsp;(숫자,4~16)&nbsp;&nbsp;
						<span id="password_01_msg"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
							<td><input type="password" id="password_02">&nbsp;&nbsp;&nbsp;
							<span id="password_02_msg"></span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="irum" id="irum">&nbsp;&nbsp;&nbsp;
						<span id="irum_msg"></span></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" id="email" name="email">&nbsp;&nbsp;&nbsp;
							<span id="email_msg"></span></td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td>
							<input type="number" id="phone" name="phone">&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>

			</div>
			<br> <br>
			<input type="hidden" name="_csrf" value="${_csrf.token }">					<!-- security ver.4 부터는 csrf첨부해야 함 -->
			<div id="join_btn_div">
				<button type="button" id="join_btn">회원가입</button>
			</div>

		</form>
	</div>

</body>


</html>