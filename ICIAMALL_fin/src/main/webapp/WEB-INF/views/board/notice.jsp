<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

#title {
	text-align: center;
}

#title p {
	font-size: 12px;
	color: rgba(147, 147, 147, 1);
}

#qna_table_div {
	width:1240px;
	margin: 0 auto;
	text-align: center;
}

#qna_table_div table {
	margin: 0 auto;
	text-align: center;
	width: 1240px;
	font-size: 11px;
	border-collapse: collapse;
}

#qna_table_thtr {
height:38px;
	border-bottom: 1px solid rgba(147, 147, 147, 0.3);
	border-top: 1px solid rgba(147, 147, 147, 0.3);
}
#qna_write_div{
	width:1240px;
	margin: 0 auto;
}

#qna_write_btn {
	display:block;
	width: 113px;
	height: 46px;
	background:white;
	border : 1px solid rgba(147, 147, 147, 0.3);
	text-align: center;
	text-decoration: none;
	color: black;
	float: right;
	line-height: 46px;
	font-size:13px;
	font-weight: 700;
}
#list td{
	height: 97px;
	color : black;
	border-top: 1px solid rgba(216,216,216,1);
	border-bottom: 1px solid rgba(216,216,216,1);
}
#list td:hover, td:active{
	color : black;
}
#qna_title_td, #qna_bno_td{
	font-size: 14px;
	
}
#qna_title_td{
	text-align: left;
	padding-left: 130px;
}
#qna_writer_td{
	font-size: 15px;
}
#qna_title_td a, #qna_title_td a:active{
	text-decoration: none;
	color: black;
}
#pagination li{
	width:33px;
	height:32px;
	line-height:32px;	
	display: inline-block;
	border: 1px solid lightgray;
}
#pagination a{
	text-decoration: none;
	color: lightgray;
}


#pagination #page_active a{
	color:black;
}
#pagination #page_active{
	border-bottom: 2px solid black;
}

</style>
</head>
<body>
	<div id="qna_all">
		<header>
			<jsp:include page="../etc/topnav.jsp" />
		</header>
	
		<br>
	
		<div id="title">
			<h2>공지사항</h2>
			<p>공지사항 게시판입니다</p>
		</div>
		<br>
		
		<div id="qna_table_div">
			<table id="qna_table">
				<thead>
					<tr id="qna_table_thtr">
						<th width="5%">NO</th>
						<th width="77%">TITLE</th>
						<th width="6%">POSTED BY</th>
						<th width="7%">DATE</th>
						<th width="5%">VIEW</th>
					</tr>
				</thead>
				
				<tbody id="list">
					<c:forEach items="${page.list }" var="n">
						<tr>
							<td width="5%" id="qna_bno_td">${n.bno }</td>
							<td width="77%" id="qna_title_td"><a href="/www/board/noticeread?bno=${n.bno }">${n.title }</a></td>	
							<td width="6%" id="qna_writer_td">${n.writer }</td>
							<td width="7%">${n.writeTimeString }</td>
							<td width="5%">${n.readCnt }</td>
						</tr>
					</c:forEach>
				</tbody>
				
	
			</table>
		</div>
		
		<br>
		
		<sec:authorize access="isAuthenticated()">
		<div id="qna_write_div">
			<a href="/www/board/notice_write" id="qna_write_btn">WRITE</a>
		</div>
		</sec:authorize>
		
		<br>
		<br>
		
		<div id="pagination" style="text-align: center;">
			<ul class="pagination">
				<c:if test="${page.prev>0 }">
					<li id="prev_btn"><a href="/www/board/notice?pageno=${page.prev }">이전으로</a></li>
				</c:if>
				
				<c:forEach begin="${page.start }" end="${page.end }" var="i">		<!-- c:forEach 반복문으로 시작번호부터 끝번호까지 출력 -->
					<c:if test="${page.pageno==i}">
						<li id="page_active"><a href="/www/board/notice?pageno=${i }">${i}</a></li>
					</c:if>
					<c:if test="${page.pageno != i }">
						<li id="page_nonactive"><a href="/www/board/notice?pageno=${i }">${i}</a></li>
					</c:if>
				</c:forEach>
				
				<c:if test="${page.next>0 }">
					<li><a href="/www/board/notice?pageno=${page.next }">다음으로</a></li>
				</c:if>
			</ul>
		</div>
		
		
	
	</div>
	<br><br><br>
	
	<footer>
			<jsp:include page="../include/other_footer.jsp" />
	</footer>
</body>
</html>