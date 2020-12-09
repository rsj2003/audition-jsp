<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>참가자 등수 조회</h3>
<table border="1">
	<tr>
		<td>참가번호</td>
		<td>참가자명</td>
		<td>총점</td>
		<td>평균</td>
		<td>등수</td>
	</tr>
<%
	int rank = 1;
	
    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        String query = "SELECT ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME, SUM(POINTS.POINT), AVG(POINTS.POINT) AS POINTAVG FROM TBL_ARTIST_201905 ARTIST, TBL_POINT_201905 POINTS WHERE ARTIST.ARTIST_ID = POINTS.ARTIST_ID GROUP BY ARTIST.ARTIST_ID, ARTIST.ARTIST_NAME ORDER BY POINTAVG DESC";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
        	/* String scoreAvg = ("%.2f\n", rs.getInt(4)); */
            %>
                <tr>
                    <td><% out.println(rs.getString(1));%></td>
                    <td><% out.println(rs.getString(2));%></td>
                    <td><% out.println(rs.getInt(3));%></td>
                    <td><% out.println(String.format("%.2f",rs.getFloat(4)));%></td>
                    <%-- <td><% out.println(String.format("%,.2f", rs.getInt(4)));%></td> --%>
                    <td><% out.println(rank);%></td>
                </tr>
            <%
			rank++;
        }
        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>