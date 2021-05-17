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
#qna_btn{
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
	
	<form id="qna_write_form" action="/www/board/qna_write" method="post" enctype="form-data">
		<div id="qna_write_table_div">
			<table id="qna_title_table">
			<tr>
				<th>제목</th>
					<td>
						<select id="qna_title" name="title">
							<option value="none" disabled="disabled" selected="selected">문의내용을 선택해주세요</option>
							<option value="출고일 문의">출고일 문의</option>
							<option value="배송지 변경">배송지 변경</option>
							<option value="환불문의">환불문의</option>
							<option value="기타문의">기타문의</option>
						</select>
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
		<div id="qna_btn">
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
		
		$("#qna_title").change(function(){
		var $title = $("#qna_title option:selected").val();
			if($title=="출고일 문의"){
				console.log($title);
				$("#qna_content").val("* 출고일은 각 제품별 공지사항 또는 제품 상세페이지를 참고해주세요\n\n성명 : \n주문번호 : \n\n내용 : ");
			}
			if($title=="배송지 변경"){
				$("#qna_content").val("＊ 주소지 변경은 가능하지만 출고준비중으로 넘어갔을 경우에는 어려운점 양해부탁드립니다.\n\n주문번호 : \n변경하고자 하시는 주소지 : ");
			}
			if($title=="환불문의"){
				console.log($title);
				$("#qna_content").val("* 취소문의/교환문의는 공지사항을 참고해주세요\n* 휴대폰결제는 전체환불만 가능합니다.\n\n주문번호 : \n환불 또는 교환하시고자 하시는 제품 : ");
			}
			if($title=="기타문의"){
				console.log($title);
				$("#qna_content").val("성명 : \n주문번호 : \n\n내용 : ");
			}
		});

	
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