<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICIA MALL에 어서오세요</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/www/css/page.css">
<script>

	function navigo() {
		document.addEventListener('scroll', onScroll, {
			passive : true					//스크롤 이벤트(상시)
		});								

		function onScroll() {
			const scrollposition = pageYOffset;//스크롤 위치
			if (800 <= scrollposition) {		// (800  <=  스크롤 위치) 스크롤 위치가 800보다 더 내려갔을때   
				$('#hidden_nav').css('display', 'block');

			} else {							//  (그 외의 경우) 스크롤 위치가 800보다 위에 있을 때	
				$('#hidden_nav').css('display', 'none');
			}
		}

	}
	navigo()
	

	
</script>
<style>
</style>
</head>
<body>					<!-- style="display:none" -->
	<div style="display:none" id="hidden_nav">
		<jsp:include page="include/hidden_nav.jsp" />
	</div>
	<div id="all">
		<header>
			<jsp:include page="include/header.jsp" />
		</header>
  
		<div id="slick">
			<jsp:include page="include/slick_slider.jsp" />
		</div>

		<nav>
			<jsp:include page="include/nav.jsp" />
		</nav>

		<div id="mid">
			<jsp:include page="include/mid_board.jsp" />
		</div>

		<section>
			<jsp:include page="include/section.jsp" />
		</section>

		<footer>
			<jsp:include page="include/page_footer.jsp" />
		</footer>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
	</div>
</body>

</html>