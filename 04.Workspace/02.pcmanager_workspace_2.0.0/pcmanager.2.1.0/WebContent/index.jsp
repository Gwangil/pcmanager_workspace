<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리시스템</title>

<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">

<!-- internal js -->
<script type="text/javascript">
	mainSlideImages = new Array();
	mainSlideImages[0] = "img/main1.jpg";
	mainSlideImages[1] = "img/main2.jpg";
	mainSlideImages[2] = "img/main3.jpg";
	mainSlideImages[3] = "img/main4.jpg";
	mainSlideImages[4] = "img/main5.jpg";
	mainSlideImages[5] = "img/main6.jpg";
	mainSlideImages[6] = "img/main7.jpg";
	imgIndex = 0;
	
	function previousImg() {
		var  slideImgElement = document.getElementById("slideMainImg");
		
		if (imgIndex > 0) {
			--imgIndex;
		} else {
			imgIndex = 6;
		}
		slideImgElement.src = mainSlideImages[imgIndex];
	}
	
	function nextImg() {
		var  slideImgElement = document.getElementById("slideMainImg");
		if (imgIndex < (mainSlideImages.length-1)) {
			++imgIndex;
		} else {
			imgIndex = 0;
		}
		slideImgElement.src = mainSlideImages[imgIndex];
	}
</script>

</head>
<body>

<!-- header area -->
<!-- logo link -->
<a href="index.jsp">
<img src="img/logo.gif" title="홈페이지 이동">
</a>
<hr>

<!-- 로그인 전 메뉴 -->
<div class="menu_area" style="text-align:right;">
<a class="normal" href="member/login.jsp">로그인</a>
<a class="normal" href="member/join.jsp">회원가입</a>
<a class="normal" href="member/memberIdAndPw.jsp">아이디/비밀번호 찾기</a>
<a class="normal" href="product/order.jsp">상품주문</a>
</div>
<hr>


<!-- content area -->
<div class="slide_area" style="text-align:center;">
<span>
<img src="img/btn_previous.gif" name="btn_previous" onclick="previousImg()">
</span>
<span><img src="img/main1.jpg" name="slideMainImg" id="slideMainImg"></span>
<span>
<img src="img/btn_next.gif" name="btn_next" onclick="nextImg()">
</span>
</div>


<!-- footer area -->
<hr>
<div class="footer_area" style="text-align:center;">
COPYRIGHT 2017 WORK. ALL RIGHTS RESERVED
</div>

</body>
</html>











