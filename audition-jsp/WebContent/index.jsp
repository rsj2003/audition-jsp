<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" href="css/style.css">
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : ""; 
%>
</head>
<body>
    <%@include file="static/header.jsp" %>
    <%@include file="static/nav.jsp" %>
    
    <%
    switch(section) {
    case "audition_insert":
        %><%@include file="page/audition_insert.jsp" %><%
        break;
    case "party_select":
        %><%@include file="page/party_select.jsp" %><%
        break;
    case "mento_score_select":
        %><%@include file="page/mento_score_select.jsp" %><%
        break;
    case "party_rank_select":
        %><%@include file="page/party_rank_select.jsp" %><%
        break;
    default:
        %><%@include file="static/index.jsp" %><%
    }
    %>
    
    <%@include file="static/footer.jsp" %>
</body>
</html>