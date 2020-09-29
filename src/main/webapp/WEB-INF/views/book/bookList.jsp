<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<script>
	function writeConfirm(){
		return confirm("등록 하시겠습니까?");
		
	}
	function deleteConfirm(){
		return confirm("삭제 하시겠습니까?");
		}
</script>
<c:choose>
	<c:when test="${requestScope.writeResult==1}">
	<script>alert("등록성공");</script>
	 </c:when>
	 <c:when test="${requestScope.writeResult==0}">
	<script>alert("등록실패");</script>
	 </c:when>
</c:choose>
<c:choose>
	<c:when test="${requestScope.deleteResult==1}">
	<script>alert("삭제성공");</script>
	 </c:when>
	 <c:when test="${requestScope.deleteResult==0}">
	<script>alert("삭제실패");</script>
	 </c:when>
</c:choose>
</head>
<body>

	<h1>[방명록]</h1>
	
<form action="<c:url value='/book/bookList'/>" method="get">
	<select name="searchItem">
		<option value="userid">작성자</option>
		<option value="content">내용</option>		
	</select>
	<input type="text" name="searchKeyword">
	<input type="submit" value="검색"><br>
</form>	
	

<form action="<c:url value='/guestbook/write'/>" method="post" onsubmit="return writeConfirm()" enctype="multipart/form-data">
	<fieldset>
		<legend>
			<input type="submit" value="글쓰기">
		</legend>
		<p>작성자<input type="text"  value="${sessionScope.userid}" readonly="readonly"></p>
		첨부파일<input type="file" name="uploadFile"><br>
		내용<textarea rows="3" name="content"></textarea><br>
	</fieldset>
</form>
<br>

<!-- 방명록 리스트 출력 -->
<c:forEach items="${requestScope.list}" var="guestbook">
	<fieldset>
		<legend>#${guestbook.seq}</legend>
		<p>작성자 : ${guestbook.userid}</p>
		<p>작성일 : ${guestbook.regdate}</p>
		<p>
			<a href="<c:url value='/guestbook/download?seq=${guestbook.seq}'/>">
				${guestbook.originalfilename} 
			</a>
		</p>
		<pre>${guestbook.content}</pre>
		<c:if test="${sessionScope.userid == guestbook.userid}">
			<a href="<c:url value='/guestbook/delete?seq=${guestbook.seq}'/>">
			<input type="button" value="글삭제" onclick="return deleteConfirm()">	
			</a>	
		</c:if>
		<br><br>
	</fieldset>
</c:forEach>

</body>
</html>