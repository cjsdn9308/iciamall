<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#msg {
	padding: 35px;
	text-align: left;
	font-size: 11px;
}
.kakao a{
	color: black;
}
.kakao a:visited{
	color: black;
}
.kakao a:active{
	color: black;
}

strong {
	font-size: 30px;
}

</style>
</head>
<body>
	<div id="mid_board">
		<div class="inner"></div>

		<div class=content>
			<div class="left_notice">
				<div class="notice"><a href="/www/board/notice">&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a></div>

				<c:forEach items="${page.list }" end="3" var="n">
						<br>
						<div id=mininotice_title>
							<a href="/www/board/noticeread?bno=${n.bno }">O ${n.title }</a>
						</div>
					</c:forEach>
				<!--  
				<table>
					<c:forEach items="${page.list }" end="3" var="n">
						<tr height="38px">
							<td><a href="/www/board/noticeread?bno=${n.bno }">O ${n.title }</a></td>
						</tr>
					</c:forEach>
				</table>
				-->
			</div>

			<div class="kakao">
				<a href="https://pf.kakao.com/_RPxcZK"><img src="img/kakao.jpg"></a>
				<a href="https://pf.kakao.com/_RPxcZK">
					<div class="kakao_msg">
						<div id="msg">
							<strong>카카오톡</strong><br> @ICIAMALL 카카오톡 바로가기<br>
							<br>
							<hr width="15px" color="black" size="1px">
							<br>
							<br> ICIAMALL 카카오톡 친구 추가하시고<br> 새로운 소식들을 받아보세요!
						</div>
					</div> </a>
			</div>
		</div>
	</div>
</body>
</html>