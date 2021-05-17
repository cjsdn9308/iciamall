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

<style>
	#title {
	text-align: center;
}

#title p {
	font-size: 12px;
	color: rgba(147, 147, 147, 1);
}
#qna_write_table_div{
	width: 1240px;
	margin: 0 auto;
}
#qna_title_table {
	
}
#qna_title_table th{
	width:130px;
	height:48px;
}
#qna_title_table select {
	width: 390px;
	height: 28px;
}


#qna_content_table textarea{
	width: 1240px;
	height: 400px;
	resize:none;
}
#qna_content_table textarea:focus{
	outline: none;
}
#notice_btn{
	width: 1240px;
	margin: 0 auto;
}
#qna_btn button {
	float: right;
}
#qna_btn #regist{
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
#qna_btn #cancel{
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
	cursor: pointer;
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
	
	<form id="qna_write_form" action="/www/board/notice_write" method="post" enctype="form-data">
		<div id="qna_write_table_div">
			<table id="qna_title_table">
			<tr>
				<th>제목</th>
					<td>
						<input id="notice_title" name="title">
					</td>
				</tr>
			</table>
			<table id="qna_content_table">
				<tr>
					<td>
						<textarea id="qna_content" name="content"></textarea>
					</td>
				</tr>
			</table>
		
		<br>
		<input type="hidden" name="_csrf" value="${_csrf.token}">
		</div>
		<div id="notice_btn">
			<button type="button" id="cancel">취소</button>
			<button type="submit" id="regist">등록</button>
		</div>
	</form>
	<br>
	
	<br>
	
	<br>
	
	<footer>
			<jsp:include page="../include/other_footer.jsp" />
	</footer>
</body>
<script>
$(document).ready(function() {

	
	$("#regist").on("click", function() {
		var $title = $("#qna_title option:selected").val();
		if($title == "none"){
			alert("제목을 선택해주세요");
		}else{
			

		}
	});
	
	$("#cancel").on("click", function() {
		location.href = "/www/board/qna";
	});
});

</script>
</html>