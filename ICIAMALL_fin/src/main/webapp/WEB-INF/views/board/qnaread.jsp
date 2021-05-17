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
		var isWriter = ${board.writer==username};
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
	$("#qna_delete_btn").on("click", function() {
			var $form = $("<form>").attr("action","/www/board/qna_delete").attr("method", "post").appendTo($("body"));
			$("<input>").attr("type","hidden").attr("name","_csrf").val("${_csrf.token}").appendTo($form);
			$("<input>").attr("type","hidden").attr("name","bno").attr("id","bbno").val(${board.bno}).appendTo($form);
			$form.submit();
	});

	$("#qna_change_btn").on("click", function() {
		var $form = $("<form>").attr("action","/www/board/qna_update").attr("method", "post").appendTo($("body"));
		$("<input>").attr("type","hidden").attr("name", "bno").val('${board.bno}').appendTo($form);
		$("<input>").attr("type","hidden").attr("name", "content").val($("#qnaread_content_textarea").val()).appendTo($form);
		$("<input>").attr("type","hidden").attr("name", "_csrf").val('${_csrf.token}').appendTo($form);
		$form.appendTo($("body")).submit();
	});

	$("#qna_comment_write_btn").on("click", function() {
		var params = { bno : '${board.bno}', readCnt : '${board.readCnt}', content : $("#comment_textarea").val(), _csrf: '${_csrf.token}' };
		$.ajax({ url: "/www/comments", method: "post", data: params }).done((map)=>{
			$("#comment_textarea").val("")
			// 출력된 댓글들을 삭제
			$("#comments").empty();
			// 서버에서 보내온 최신 댓글 10개를 출력
			printComments(map);
			$("#comments").load(window.location.href + "/www/board/qnaread.jsp");
			//$('#comments').load("/www/board/qnaread.jsp");
			document.location.reload(true);

		});

		
	});
	
	
	

	if(isLogin==true && isWriter==true) {
		// 로그인이 되어있고 글쓴이라면 
		$("#qnaread_content_textarea").attr("disabled",false);
		$("#comment_textarea").attr("placeholder", "글 작성자는 댓글을 입력할 수 없습니다");
		$("#qna_comment_write_btn").css("display", "none");
		
	}else if(isLogin==true && isWriter==false) {
		// 로그인이 되어있지만 글쓴이가 아니라면
		$("#qna_change_div").css("display","none");
		$("#qna_delete_div").css("display","none");
		
		$("#comment_textarea").attr("placeholder", "욕설이나 모욕적인 댓글은 삭제될 수 있습니다").attr("disabled",false);
			if(${board.commentCnt }==10){
				$("#comment_textarea").attr("placeholder", "댓글은 최대 10개까지 입니다").attr("disabled",true);
				$("#qna_comment_write_btn").css("display", "none");
			}
	}else if(isLogin==false){
		$("#qna_comment_write_btn").css("display", "none");
	}
	
});

function printComments(dto) {
	// #comments : 댓글 출력 영역, #next : 다음으로 버튼 출력 영역  
	var $comments = $("#comments");

	// 기존 다음으로 버튼 삭제. remove()는 자기자신을 삭제(자식이 있으면 자식까지 모두), empty()는 자신의 자식들만 삭제
	$("#nextCommentPage").remove();

	$.each(dto.comments, function(idx, comment) {
		var $outer_div = $("<div>").appendTo($comments);
		var $upper_div = $("<div>").appendTo($outer_div);
		$("<span>").css("color","blue").text(comment.writer).appendTo($upper_div);
		$("<span>").text(" [" + comment.writeTime+"]").appendTo($upper_div);
		$("<br>").appendTo($outer_div);
		var $lower_div = $("<div>").css("overflow", "hidden").appendTo($outer_div);
		$("<span>").text(comment.content).appendTo($lower_div);

		// 로그인 했고 댓글 작성자와 로그인한 사용자의 아이디가 같다면
		// ${username}는 스프링 시큐리티 태그 라이브러리로 21라인에서 EL에 추가한 값
		$("<hr>").appendTo($comments);
	});


}




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
#qnaread_table_div{
	width:1240px;
	margin: 0 auto;
}
#qnaread_table{
	width: 1240px;
	border-collapse: collapse;
	font-size: 13px;
	font-weight: normal;
	
}

#qnaread_table th, #qnaread_table td{
	border-top: 1px solid rgba(216,216,216,1);
	height: 40px;
}
#qnaread_content{
	min-height: 120px;
	padding: 30px 20px; 
	
}
#qnaread_content_textarea{
	width: 1200px;
	min-height: 500px;
	resize:none;
	background-color: white;
}
#qnaread_content_textarea:focus{
	outline: none;
}



#qna_change_div{
	width:1240px;
	margin: 0 auto;
}

#qna_change_btn{
	display:inline-block;
	width: 113px;
	height: 46px;
	background:white;
	border : 1px solid rgba(147, 147, 147, 0.3);
	text-align: center;
	text-decoration: none;
	color: black;
	float: right;
	font-size:13px;
	font-weight: 700;
	cursor: pointer;
}
#qna_delete_btn{
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
#qna_delete_div{
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
#comment{
	width: 1240px;
	margin: 0 auto;
}
hr{
	width: 1240px;
}
#comment_textarea{
	width: 1240px;
	height: 90px;
	resize:none;
}
#comment_write_btn{
	width: 1240px;
	margin: 0 auto;
}
#qna_comment_write_btn{
	display:inline-block;
	width: 115px;
	height: 48px;
	background:white;
	border : 1px solid rgba(147, 147, 147, 0.3);
	text-align: center;
	text-decoration: none;
	color: black;
	line-height: 46px;
	font-size:13px;
	font-weight: 700;
	margin-right: 30px;
	cursor: pointer;
	float: right;
}
#comments{
	width: 1240px;
	margin: 0 auto;
	display: block;
}
#comment_content{
	width: 1200px;
	height : 100px;
	margin: 0 auto;
	resize: none;
	border: none;
}
#comment_content:focus {
	outline: none;
}
#next{
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}
#nextCommentPage{
	width: 115px;
	height: 48px;
	background-color: white;
	border : 1px solid rgba(147, 147, 147, 0.3);
	cursor: pointer;
	font-size:13px;
	font-weight: 700;
	
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
	
	<div id="qnaread_table_div">
		<table id="qnaread_table">
			<tr>
				<th width="12%">제목</th> <td width="88%"><input type="text" id="title_input" disabled="disabled" value="${board.title }"></td>
			</tr>
			<tr>
				<th width="12%">작성자</th><td width="88%">${board.writer }</td>
			</tr>
			<tr>
				<th width="12%">조회수</th><td width="88%">${board.readCnt }</td>
			</tr>
			<tr>
				<td colspan="2" id="qnaread_content">
					<textarea id="qnaread_content_textarea" disabled="disabled">${board.content }</textarea>
				</td>
			</tr>
			
		</table>
		<sec:authorize access="isAuthenticated()">
			<div id="qna_change_div">
				<button id="qna_change_btn">CHANGE</button>
			</div>
			
			<div id="qna_delete_div">
				<button id="qna_delete_btn">DELETE</button>
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
		<div id="comment">
			댓글을 입력하세요<br>
			<textarea rows="5" id="comment_textarea" disabled="disabled"
	      			placeholder="댓글을 작성하려면 로그인 해주세요"></textarea>
	      	
		</div>
		<br>
		
		<sec:authorize access="isAuthenticated()">
			<div id="comment_write_btn">
				<button id="qna_comment_write_btn">댓글등록</button>
			</div>
		</sec:authorize>
		
		<br><br><br>
		
		
		<div id="comments">
			<c:forEach items="${board.comments }" var="comment">
				<div>
					<div><span style="color:blue;">${comment.writer }</span> [${comment.writeTimeString }]</div>
					<div style="overflow:hidden;">
					<br>
						<span>${comment.content }</span>
						<c:if test="${comment.isWriter==true }">
						</c:if>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
		<div id="next">

		</div>
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