<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원전용 서비스 메인</title>
<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">

</head>
<body>
<!-- header area -->
<!-- logo link -->
<a href="index.jsp">
<img src="img/logo.gif" title="홈페이지 이동">
</a>
<hr>

<!-- 메세지 출력  -->
<c:if test="${not empty requestScope.message}">
	<div class="txt_error">
	Message : <p>${requestScope.message}
	</div>
	<hr>
</c:if>

<!-- 로그인 후 메뉴 -->
<div class="menu_area" style="text-align:right;">
	<c:choose>
	<c:when test="${not empty sessionScope.memberId and 
		not empty sessionScope.grade}">
		${sessionScope.memberId}님[${sessionScope.grade}]&nbsp;
		<a href="controller?action=logout">로그아웃</a>&nbsp;|&nbsp;
		<a href="controller?action=myInfo">내정보조회</a>&nbsp;|&nbsp;
		<a href="member/changePassword.jsp">암호변경</a>&nbsp;|&nbsp;
		<a href="controller?action=myInfoUpdate">내정보변경</a>&nbsp;|&nbsp;
		<a href="/pcm/product/order.jsp">상품주문</a>&nbsp;|&nbsp;
		
		<!-- 관리자 메뉴 -->
		<c:if test="${sessionScope.grade == 'A'}">
			[관리자]
			<a href="controller?action=getMemberAll">전체회원조회</a>
			<a href="controller?action=noticeInput">공지관리</a>
		</c:if>
	</c:when>
	
	<c:when test="${empty sessionScope.memberId or 
		empty sessionScope.grade}">
		<c:set var="message" value="로그인/회원가입 후 사용하시기 바랍니다." />
		<jsp:forward page="/error.jsp" />
	</c:when>
	</c:choose>
</div>
<hr>

<!-- content area -->
<div class="content_area" 
	style="text-align:center;height:450px;">
<h3>회원관리시스템(MMS) : 회원전용 서비스 시작 페이지</h3>
</div>


<!-- footer area -->
<hr>
<div class="footer_area" style="text-align:center;">
COPYRIGHT 2017 WORK. ALL RIGHTS RESERVED
</div>

</body>
</html>