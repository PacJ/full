<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if (session == null || session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) { %>
	<form action="loginProc.jsp" method="post">

		<div>
			<label for="id">아이디</label><br> 
			<input type="text" name="id" placeholder="아이디"></input><br>
			
			<label for="pw">비밀번호</label><br>
			<input type="password" name="pw" placeholder="비밀번호"></input>
			<input	type="submit" value="로그인"></input>

		</div>

	</form>
	<% } else { %>
	<h2>어서오세요 <%= session.getAttribute("name") %>님</h2>
	<form action="logout.jsp" method="post">
		<button type="submit">로그아웃</button>
	</form>
	<% } %>
</body>
</html>