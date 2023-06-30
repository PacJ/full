<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if (session != null) {
	session.invalidate();
}
	System.out.println("안녕하신가");
	%> <script>
		alert("로그아웃 되었습니다.");
		setTimeout(() => {
			window.location.href = "Login.jsp";
		}, 200);
	</script>
	<%
%>
</body>
</html>