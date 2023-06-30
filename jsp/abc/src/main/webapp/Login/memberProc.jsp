<%@page import="abc.MemberMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String hobby = request.getParameter("hobby");
	String job = request.getParameter("job");
	
	MemberMgr mgr = new MemberMgr();
	mgr.getCon();
	mgr.idcheck(id);
	
	
	System.out.println("id: " + id);
	System.out.println("pw: " + pw);
	System.out.println("gender: " + gender);
	System.out.println("birth: " + birth);
	System.out.println("email: " + email);
	System.out.println("zipcode: " + zipcode);
	System.out.println("address: " + address);
	System.out.println("hobby: " + hobby);
	System.out.println("job: " + job);
%>
</body>
</html>