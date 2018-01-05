<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="work.model.dto.*" %>
<%@ page import="java.util.ArrayList" %>
<!-- jstl cofing -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리</title>
<!-- external css : css/common.css -->
<link type="text/css" rel="stylesheet" href="css/common.css">

</head>
<body>
<!-- header area -->
<!-- logo link -->
<a href="/pcm/index.jsp">
<img src="/pcm/img/logo.gif" title="홈페이지 이동">
</a>
<hr>

<!-- 메세지 출력  -->
<c:if test="${not empty requestScope.message}">
	<h3>Message : ${requestScope.message}</h3>
	<hr>
</c:if>

<!-- 로그인 후 메뉴 -->
<div class="menu_area" style="text-align:right;">
	<c:choose>
	<c:when test="${not empty sessionScope.memberId and 
		not empty sessionScope.grade}">
		${sessionScope.memberId}님[${sessionScope.grade}]&nbsp;
		<a href="/pcm/controller?action=logout">로그아웃</a>&nbsp;|&nbsp;
		<a href="/pcm/controller?action=myInfo">내정보조회</a>&nbsp;|&nbsp;
		<a href="changePassword.jsp">암호변경</a>&nbsp;|&nbsp;
		<a href="/pcm/controller?action=myInfoUpdate">내정보변경</a>&nbsp;|&nbsp;
		
		<!-- 관리자 메뉴 -->
		<c:if test="${sessionScope.grade == 'A'}">
			[관리자]
			<a href="/pcm/controller?action=getMemberAll">전체회원조회</a>
			<a href="/pcm/controller?action=noticeInput">공지관리</a>
		</c:if>
	</c:when>
	
	<c:when test="${empty sessionScope.memberId or 
		empty sessionScope.grade}">
		<c:set var="message" value="로그인/회원가입 후 사용하시기 바랍니다." />
		<jsp:forward page="/pcm/error.jsp" />
	</c:when>
	</c:choose>
</div>
<hr>

<!-- content area -->
<h3>매출 조회</h3>
<a href="/pcm/pcontroller?action=getSale">전체매출조회</a>&nbsp;&nbsp;&nbsp;
<form action="/pcm/pcontroller?action=getSaleDaily" method="post">
	<input type="date" name="day" min="1990-01-01" max="2100-12-31">&nbsp;
	<input type="submit" value="일별매출조회" >
</form>

<table>
	<tr>
		<td>
			<table border="1">
				<!-- 제목행 -->
				<tr>
					<th>사용시간</th>
					<th>이용요금</th>
				</tr>
				
				<!-- 회원정보 출력행 : 회원숫자만큼 반복 -->
				<c:forEach var="dto" items="${requestScope.list2}" >
					<tr>
						<td>${dto.useTime}</td>
						<td>${dto.cost}</td>
					</tr>
					
				</c:forEach>
				<%	
					int sumTime = 0;
					int sumCost = 0;
					ArrayList<UseList> list2 = (ArrayList<UseList>)request.getAttribute("list2");
					for (int index = 0 ; index < list2.size(); index++) {
						sumTime += list2.get(index).getUseTime();
						sumCost += list2.get(index).getCost();
					}
				%>
				<tr>
						<td>총 좌석서비스시간<br><%=sumTime%></td>
						<td>총 좌석매출금액<br><%=sumCost%></td>
				</tr>
			</table>
		</td>
		
		<td>
			<table border="1">
				<!-- 제목행 -->
				<tr>
					<th>판매상품</th>
					<th>판매수량</th>
					<th>판매금액</th>
				</tr>
				
				<!-- 회원정보 출력행 : 회원숫자만큼 반복 -->
				
				<c:forEach var="dto" items="${requestScope.list1}" >
					<tr>
						<td>${dto.productName}</td>
						<td>${dto.productCount}</td>
						<td>${dto.price}</td>
					</tr>
				</c:forEach>
				<%	
					int sumPrice = 0;
					ArrayList<OrderSummary> list1 = (ArrayList<OrderSummary>)request.getAttribute("list1");
					for (int index = 0 ; index < list1.size(); index++) {
						sumPrice += list1.get(index).getPrice();
					}
				%>
				<tr>
						<td colspan="2">총 상품판매금액</td>
						<td><%=sumPrice%></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<!-- footer area -->
<hr>
<div class="footer_area" style="text-align:center;">
COPYRIGHT 2017 WORK. ALL RIGHTS RESERVED
</div>

</body>
</html>