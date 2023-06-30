<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page import="abc.MemberDTO" %>
<%@ page import="abc.DBConnectionMgr" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    DBConnectionMgr dbc = new DBConnectionMgr();
    MemberDTO member = dbc.fetchData(id);
    System.out.println("ID: " + id);
    System.out.println("PW: " + pw);
    System.out.println("Member: " + member);

    if (member != null && member.getPw().equals(pw)) {
%>
        <script>
            alert("로그인에 성공했다");
            setTimeout(function() {
            	window.location.href = "Login.jsp";
            }, 200);
        </script>
        <%
        HttpSession s = request.getSession();
        s.setAttribute("loggedIn", true);
        s.setAttribute("id", id);
        s.setAttribute("name", member.getName());
        
        boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        System.out.println(loggedIn);
    } else {
        %>
        <script>
            alert("로그인에 실패했다");
            setTimeout(function() {
            	window.location.href = "Login.jsp";
            }, 200);
        </script>
        <%
    }
%>
</body>
</html>
