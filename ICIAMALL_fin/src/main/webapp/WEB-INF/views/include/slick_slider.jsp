<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="UTF-8" />

<title>slick test</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />

<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<style>
.slick-items img {
	width: 100%;
	height: 660px;
	outline: none;
	margin: 0 auto;
	text-align: center;
	border: none;
}

.slick-prev:before {
	content: url( "img/prev_btn.png" );
}

.slick-next:before {
	content: url( "img/next_btn.png" );
	width: 100px;
	height: 100px;
	z-index: 100;
}

.slick-prev {
	width: 50px;
	height: 50px;
	z-index: 100;
	margin-left: 150px;
}

.slick-next {
	z-index: 100;
	margin-right: 170px;
}
</style>
<script>
	
</script>

</head>

<body>

	<div class="slick-items">

		<div>
			<img src="img/slick_01.jpg">
		</div>

		<div>
			<img src="img/slick_02.jpg">
		</div>

		<div>
			<img src="img/slick_03.jpg">
		</div>

	</div>


</body>





<script type="text/javascript">
	$(document).ready(function() {

		//alert('123');

		$('.slick-items').slick({
			draggable : true, // 드래그 가능여부

			autoplay : true, // 자동재생

			arrows : true, // 화살표

			speed : 1000, // 이미지가 슬라이딩시 걸리는 시간

			infinite : true, // 무한루프

			autoplaySpeed : 3000, // 이미지가 다른 이미지로 넘어 갈때의 텀

			fade : true, // 페이드 효과

			pauseOnHover : false, // 마우스가 올라갈때 재생 멈춤

			slidesToShow : 1, //화면에 보여질 이미지 갯수

			slidesToScroll : 1, // 스크롤시 이동할 이미지 갯수

		});

	});
</script>

</html>