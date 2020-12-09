<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>멘토 점수 조회</h3>
<table border="1">
	<tr>
		<td>채점번호</td>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>생년월일</td>
		<td>점수</td>
		<td>평점</td>
		<td>멘토</td>
	</tr>
<%
    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        String query = "SELECT POINTS.SERIAL_NO, ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME, ARTIST.ARTIST_BIRTH, POINTS.POINT, MENTO.MENTO_NAME FROM TBL_ARTIST_201905 ARTIST, TBL_MENTO_201905 MENTO, TBL_POINT_201905 POINTS WHERE MENTO.MENTO_ID = POINTS.MENTO_ID AND ARTIST.ARTIST_ID = POINTS.ARTIST_ID ORDER BY POINTS.SERIAL_NO ASC";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
        	String rank = "";
        	int score = Integer.parseInt(rs.getString(5));
        	if(score >= 90) {
        		rank = "A";
        	}else if(score >= 80) {
        		rank = "B";
        	}else if(score >= 70) {
        		rank = "C";
        	}else if(score >= 60) {
        		rank = "D";
        	}else {
        		rank = "F";
        	}
        	String year = rs.getString(4).substring(0,4);
        	String month = rs.getString(4).substring(4,6);
        	String day = rs.getString(4).substring(6,8);
            %>
                <tr>
                    <td><% out.println(rs.getString(1));%></td>
                    <td><% out.println(rs.getString(2));%></td>
                    <td><% out.println(rs.getString(3));%></td>
                    <td><% out.println(String.format("%s년 %s월 %s일", year, month, day));%></td>
                    <td><% out.println(rs.getString(5));%></td>
                    <td><% out.println(rank);%></td>
                    <td><% out.println(rs.getString(6));%></td>
                </tr>
            <%

        }
        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>