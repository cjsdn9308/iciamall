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
<sec:authorize access="isAuthenticated()">
	<!-- principal.username을 변수 username에 저장(EL은 읽기 전용. 태그 라이브러리를 이용해 값을 추가할 수 있다 -->
	<sec:authentication property="principal.username" var="username" />
	<c:set var="irum" property="홍길동" />
	<script>
		var isLogin = true;
		var isWriter = ${notice.writer==username};
	</script>
</sec:authorize>

<sec:authorize access="isAnonymous()">
	<script>
		var isLogin = false;
		var isWriter = false;
	</script>
</sec:authorize>


<script>
$(document).ready(function() {	
	$("#notice_delete_btn").on("click", function() {
			var $form = $("<form>").attr("action","/www/board/notice_delete").attr("method", "post").appendTo($("body"));
			$("<input>").attr("type","hidden").attr("name","_csrf").val("${_csrf.token}").appendTo($form);
			$("<input>").attr("type","hidden").attr("name","bno").attr("id","nbno").val(${notice.bno}).appendTo($form);
			$form.submit();
	});
 
	
	
	

	if(isLogin==true && isWriter==true) {
		// 로그인이 되어있고 글쓴이라면 

	}else if(isLogin==true && isWriter==false) {
		// 로그인이 되어있지만 글쓴이가 아니라면
		$("#notice_delete_div").css("display","none");
		

	}else if(isLogin==false){
		$("#notice_delete_div").css("display","none");
	}
	
});






</script>
<style>
#title {
	text-align: center;
}

#title p {
	font-size: 12px;
	color: rgba(147, 147, 147, 1);
}
#product_info_div {
	width: 1240px;
	height: 120px;
	margin: 0 auto;
	border: 1px solid rgba(216,216,216,1);
}
#noticeread_table_div{
	width:1240px;
	margin: 0 auto;
}
#noticeread_table{
	width: 1240px;
	border-collapse: collapse;
	font-size: 13px;
	font-weight: normal;
	
}

#noticeread_table th, #noticeread_table td{
	border-top: 1px solid rgba(216,216,216,1);
	height: 40px;
}
#noticeread_content{
	min-height: 120px;
	padding: 30px 20px; 
	
}
#noticeread_content_textarea{
	width: 1200px;
	min-height: 500px;
	resize:none;
	background-color: white;
}
#noticeread_content_textarea:focus{
	outline: none;
}



#notice_delete_btn{
	display:inline-block;
	width: 115px;
	height: 48px;
	background:white;
	border : 1px solid rgba(147, 147, 147, 0.3);
	text-align: center;
	text-decoration: none;
	color: black;
	float: right;
	line-height: 46px;
	font-size:13px;
	font-weight: 700;
	margin-right: 30px;
	cursor: pointer;
}
#notice_delete_div{
	width:1240px;
	margin: 0 auto;
}
input{
	border: none;
	background-color: white;
	color: black;
}
input:focus{
	outline: none;
}
textarea {
	background-color: white;
	color: black;
}

hr{
	width: 1240px;
}





</style>
</head>
<body>
	<header>
		<jsp:include page="../etc/topnav.jsp" />
	</header>
	
	<br>
	
	<div id="title">
		<h2>Q&A</h2>
		<p>Q&A문의 게시판입니다</p>
	</div>
	
	<br>
	
	<div id="product_info_div">
	
	</div>
	
	<br>
	<br>
	
	<div id="noticeread_table_div">
		<table id="noticeread_table">
			<tr>
				<th width="12%">제목</th> <td width="88%"><input type="text" id="title_input" disabled="disabled" value="${notice.title }"></td>
			</tr>
			<tr>
				<th width="12%">작성자</th><td width="88%">${notice.writer }</td>
			</tr>
			<tr>
				<th width="12%">조회수</th><td width="88%">${notice.readCnt }</td>
			</tr>
			<tr>
				<td colspan="2" id="noticeread_content">
					<textarea id="noticeread_content_textarea" disabled="disabled">${notice.content }</textarea>
				</td>
			</tr>
			
		</table>
		<sec:authorize access="isAuthenticated()">			
			<div id="notice_delete_div">
				<button id="notice_delete_btn">DELETE</button>
			</div>
		</sec:authorize>
	</div>
	
	<br>
	<br>
	<br>
	
	<hr>
	
	<br>
	<br>
	<br>
	<div>
		
		<br><br><br>
		
		


	</div>

	<br>
	

	<br>
	<br>
	<br>


	<footer>
			<jsp:include page="../include/other_footer.jsp" />
	</footer>

</body>
</html>