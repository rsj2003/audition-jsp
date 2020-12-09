<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String gender = request.getParameter("gender");
String talent = request.getParameter("talent");
String agency = request.getParameter("agency");


    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        String query = "INSERT INTO TBL_ARTIST_201905 VALUES('%s', '%s', '%s%s%s', '%s', '%s', '%s')";
        ResultSet rs = stmt.executeQuery(String.format(query, id, name, year, month, day, gender, talent, agency));
        conn.commit();
        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
    
response.sendRedirect("../index.jsp?section=party_select");
%>