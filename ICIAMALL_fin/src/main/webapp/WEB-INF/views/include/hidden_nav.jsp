<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#hidden_nav {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	position: sticky;
	top: 0;
	z-index: 100;
}

#hidden_top {
	width: 100%;
	height: 50px;
	background-color: rgba(253, 253, 253, 0.98);
	border-bottom: 1px solid rgba(236, 236, 236, 1);
	z-index: 100;
}

#hidden_top table {
	margin: 0 auto;
}

#hidden_bottom {
	width: 100%;
	height: 50px;
	background-color: rgba(253, 253, 253, 0.98);
	z-index: 100;
}

#hidden_bottom li {
	display: inline-block;
	text-decoration: none;
	text-align: center;
	margin: 0 10px;
	padding-top: 15px;
}

#hidden_bottom a {
	text-decoration: none;
	color: black;
}

#hidden_bottom a:hover {
	color: red;
}

#hidden_board_dropmenu {
	z-index: 99;
	background-color: white;
	margin: 0 auto;
	height: 50px;
	position: absolute;
	margin-left: 100px;
	margin-top: 10px;
	padding-top: 13px;
	display: none;
	width: 90px;
	line-height: 18px;
	text-align: left;
	border: 1px solid lightgray;
	border-top: 2px solid black;
}

#hidden_board_dropmenu a {
	color: black;
}

#hidden_board_dropmenu a:hover {
	color: red;
}

#hidden_board_dropmenu a:active {
	color: red;
}

#hidden_board_li {
	position: relative;
}

#hidden_board_dropmenu li {
	z-index: 100;
	display: inline-block;
	padding-left: 12px;
}
</style>
</head>




<body>

	<div id="hidden_top">
		<table id="header">
			<tr>
				<td width="20%">
					<sec:authorize access="isAnonymous()">
						<li><a href="/www/user/login">로그인</a></li>&nbsp;&nbsp;&nbsp;
						<li><a href="/www/user/join">회원가입</a></li>&nbsp;&nbsp;&nbsp;
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a id="hidden_nav_logout" href="#none">로그아웃</a>&nbsp;&nbsp;&nbsp;
						<li><a href="/www/user/info">내정보</a></li>&nbsp;&nbsp;&nbsp;
					</sec:authorize>
					<li><a href="#none" id="hidden_board_a">게시판</a></li>
					<ul id="hidden_board_dropmenu">
						<li><a href="/www/board/notice">공지사항</a></li>

						<li><a href="/www/board/qna" id="hidden_qna_a">Q&A</a></li>
					</ul></td>

				<td width="60%"><a href="/www/"><img src="img/logof.JPG"></a></td>

				<td width="20%"><i class="fas fa-shopping-basket fa-2x"></i>&nbsp;&nbsp;&nbsp;&nbsp;
					<i class="fas fa-search fa-2x"></i></td>
			</tr>
		</table>
	</div>


	<div id="hidden_bottom">
		<ul>
			<li><a href="#">전체상품</a></li>
			<li><a href="#">인기상품</a></li>
			<li><a href="#">특가상품</a></li>
			<li><a href="#">검색상위</a></li>
		</ul>
	</div>

	<script>
	$(function() {
		$("#hidden_nav_logout").on("click", function() {
			var $input = $("<input>").attr("type","hidden").attr("name","_csrf").val('${_csrf.token}');
			$("<form>").attr("action","/www/user/logout").attr("method","post").append($input).appendTo("body").submit();
		});
	})
		function hidden_move_dropmenu() {
			var hidden_menusts = $('#hidden_board_dropmenu').css('display');
			$("#hidden_board_a").click(function() {

				if (hidden_menusts == "none") {
					$('#hidden_board_dropmenu').css('display', 'block');
					hidden_menusts = "block";

				} else {
					$('#hidden_board_dropmenu').css('display', 'none');
					hidden_menusts = "none";
				}
			})
			passive: true
		}

		hidden_move_dropmenu()
	</script>


</body>
</html>