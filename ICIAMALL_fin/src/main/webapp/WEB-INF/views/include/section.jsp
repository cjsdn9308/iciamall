<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#section_all .center_inner01:hover {
	border: 1px solid black;
	color: black;
}

#section_all .center_inner02:hover {
	border: 1px solid black;
	color: black;
}
</style>
</head>
<body>
	<div id="section_all">
		<table class="section_table">
			<tr>
				<td class="left_top"><img src="img/prod01.JPG">
					<div class="inner">상품A</div></td>
				<td rowspan="2" class="center_td"><img src="img/prod03.png">
					<div class="center_inner01">새로운 상품A</div>
					<div class="center_inner02">새로운 상품B</div></td>
				<td class="right_top"><img src="img/prod01.JPG">
					<div class="inner">상품B</div></td>
			</tr>
			<tr>
				<td class="left_bottom"><img src="img/prod02.JPG">
					<div class="inner">상품C</div></td>
				<td class="right_bottom"><img src="img/prod02.JPG">
					<div class="inner">상품D</div></td>
			</tr>

		</table>
	</div>
</body>
</html>