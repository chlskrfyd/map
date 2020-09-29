<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function formcheck(){
	var playeridDoc = document.getElementById("playerid");
	var playerpwdDoc = document.getElementById("playerpwd");
	

	if(playeridDoc.value ==""){
	 	alert("ID를 입력해주세요"); 	
		return false;
		}
	if(playerpwdDoc.value==""){
		alert("암호를 입력해주세요");
		return false;
		}


	
}
</script>
</head>
<body>
	<form action="<c:url value='/player/login'/>" method="post" onsubmit="return formcheck()">
	<table>
		<tr>
			<th>ID</th>
				<td>
					<input type="text" id="playerid" name="playerid">
				</td>
		</tr>
		<tr>
			<th>암호</th>
				<td>
					<input type="password" id="playerpwd" name="playerpwd">
				</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="submit" value="로그인">
			</th>	
		</tr>
	</table>		
	</form>
	
</body>
</html>