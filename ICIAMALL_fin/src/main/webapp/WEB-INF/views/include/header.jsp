<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
#header a {
	text-decoration: none;
	color: black;
}

#header a:active {
	color: black;
}

#header a:visited {
	color: black;
}

#board_dropmenu {
	z-index: 99;
	background-color: white;
	margin: 0 auto;
	height: 50px;
	position: absolute;
	margin-left: 152px;
	margin-top: 10px;
	padding-top: 13px;
	display: none;
	width: 90px;
	line-height: 18px;
	text-align: left;
	border: 1px solid lightgray;
	border-top: 2px solid black;
}

#board_dropmenu a {
	color: black;
}

#board_dropmenu a:hover {
	color: red;
}

#board_dropmenu a:active {
	color: red;
}

#board_li {
	position: relative;
}

#board_dropmenu li {
	z-index: 100;
	display: inline-block;
	padding-left: 12px;
}
</style>

</head>
<body>
	<div id="header_all">
		<table id="header">
			<tr>
				<td width="20%" class="header_left_td">
				<sec:authorize access="isAnonymous()">
						<li><a href="/www/user/login">로그인</a></li>&nbsp;&nbsp;&nbsp;
						<li><a href="/www/user/join">회원가입</a></li>&nbsp;&nbsp;&nbsp;
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a id="header_logout" href="#none">로그아웃</a>&nbsp;&nbsp;&nbsp;
						<li><a href="/www/user/info">내정보</a></li>&nbsp;&nbsp;&nbsp;
					</sec:authorize>
				
					<li id="board_li"><a href="#none" id="board_a">게시판</a></li>
					<ul id="board_dropmenu">
						<li><a href="/www/board/notice">공지사항</a></li>

						<li><a href="/www/board/qna" id="qna_a">Q&A</a></li>
					</ul></td>

				<td width="60%"><a href="/www/"><img src="img/logof.JPG"></a></td>

				<td width="20%"><i class="fas fa-shopping-basket fa-2x"></i>&nbsp;&nbsp;&nbsp;&nbsp;
					<i class="fas fa-search fa-2x"></i></td>
			</tr>
		</table>
	</div>
</body>
<script>
$(function() {
	$("#header_logout").on("click", function() {
		var $input = $("<input>").attr("type","hidden").attr("name","_csrf").val('${_csrf.token}');
		$("<form>").attr("action","/www/user/logout").attr("method","post").append($input).appendTo("body").submit();
	});
})

function move_dropmenu() {
	var menusts = $('#board_dropmenu').css('display');
	$("#board_a").click(function() {
		if (menusts == "none") {
			$('#board_dropmenu').css('display', 'block');
			menusts = "block";
		} else {
			$('#board_dropmenu').css('display', 'none');
			menusts = "none";
		}
	})
	passive: true;
}

		move_dropmenu()
	</script>

</html>