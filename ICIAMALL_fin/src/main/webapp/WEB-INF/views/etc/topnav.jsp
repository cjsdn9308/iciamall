<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
#topnav_top{
	width: 100%;
	height: 136px;
	border-bottom: 1px solid rgba(236, 236, 236, 1);
	text-align: center;
	font-size: 12px;
	
}
#topnav_top a{
color: black;
text-decoration: none;
}
#topnav_top a:visited{
color: black;
}
#topnav_top a:hover{
color: black;
}
board_li{
	position: relative; 
}
#topnav_table{
width: 1240px;
height:136px;
margin: auto;
text-align: center;
}
#topnav_table_left li{
	display: inline;
}
#board_dropmenu {
	position:absolute;
	z-index: 99;
	border: 1px solid lightgray;
	border-top: 2px solid black;
	background-color:white;
	text-align: left;
	height: 60px;
	margin-left: 170px;
	margin-top: 13px;

}
#board_dropmenu li {
	display:block;
	margin-left:-30px;
	margin-right:35px;
	margin-top:9px;
	z-index: 100;
}
#board_dropmenu a:hover{
color: red;
}







#topnav_bottom{
	height: 82px;
text-align:center;
	border-bottom: 1px solid rgba(236, 236, 236, 1);
	font-size: 12px;
}
#topnav_bottom a{
color: black;
text-decoration: none;
}
#topnav_bottom a:visited{
color: black;
}
#topnav_bottom a:hover{
color: red;
}
#topnav_bottom_inner{
	height: 30px;
}
#topnav_bottom li{
display: inline;
margin: 0 10px;
}

</style>
</head>
<body>
	<div id="topnav_top">
		<table id="topnav_table">
			<tr>
				<td width="22%" id="topnav_table_left">
					<sec:authorize access="isAnonymous()">
						<li><a href="/www/user/login">로그인</a></li>&nbsp;&nbsp;&nbsp;
						<li><a href="/www/user/join">회원가입</a></li>&nbsp;&nbsp;&nbsp;
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<li><a id="logout" href="#none">로그아웃</a></li>&nbsp;&nbsp;&nbsp;
					<li><a href="/www/user/info">내정보</a></li>&nbsp;&nbsp;&nbsp;
				</sec:authorize>
					<li id="board_li"><a href="#none" id="board_a">게시판</a></li>
						<ul id="board_dropmenu" style="display: none">
							<li><a href="/www/board/notice">공지사항</a></li>
							<li><a href="/www/board/qna">Q&A</a></li>
						</ul>
				</td>

				<td width="56%"><a href="/www/"><img src="../img/logof.JPG"></a></td>
				
				

				<td width="22%"><i class="fas fa-shopping-basket fa-2x"></i>&nbsp;&nbsp;&nbsp;&nbsp;
					<i class="fas fa-search fa-2x"></i></td>
			</tr>
		</table>
	</div>


	<div id="topnav_bottom">
		<div id="topnav_bottom_inner"></div>
			<li><a href="#">전체상품</a></li>
			<li><a href="#">인기상품</a></li>
			<li><a href="#">특가상품</a></li>
			<li><a href="#">검색상위</a></li>
	</div>
</body>
<script>
$(function() {
	$("#logout").on("click", function() {
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
				console.log(menusts);
			}
		})
		passive: true
	}

	move_dropmenu()
</script>
</html>