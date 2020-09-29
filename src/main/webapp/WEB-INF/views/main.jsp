<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	<c:if test="${requestScope.vo.playerid == null}"> 
	<a href="<c:url value='/player/signup' />">회원가입 </a><br>
	<a href="<c:url value='/player/loginForm' />">로그인</a>
	<a href="<c:url value='/player/map3' />">지도</a>
	<a href="<c:url value='/player/map4' />">길찾기</a>
	<a href="<c:url value='/player/map5' />">주변장소띄우기</a>
	<a href="<c:url value='/player/map6' />">아따</a>
	</c:if>
	

	<c:if test="${sessionScope.playerid != null}"> 
	<h1>${sessionScope.playerid}님 반갑습니다!</h1>
	<h2><a href="<c:url value='/book/bookList'/>">방명록</a></h2>
	<h1><a href="<c:url value='/player/logout' />">로그아웃</a></h1>
	</c:if>
	${sessionScope.playerid}
</body>
</html>