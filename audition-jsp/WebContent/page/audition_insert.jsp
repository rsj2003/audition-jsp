<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>오디션 등록</h3>
<%
    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        %>
<form action="action/insert_artist.jsp" method="post" name="action_form">
<table border="1">
	<tr>
		<td>참가번호</td>
		<td><input type="text" name="id">*참가번호는 (A000)4나리입니다</td>
	</tr>
	<tr>
		<td>참가자명</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><input type="text" name="year">년<input type="text" name="month">월<input type="text" name="day">일</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<input type="radio" name="gender" value="M"><a>남성</a>
			<input type="radio" name="gender" value="F"><a>여성</a>
		</td>
	</tr>
	<tr>
		<td>특기</td>
		<td>
			<select name="talent">
				<option value="0">특기선택</option>
				<option value="1">보컬</option>
				<option value="2">댄스</option>
				<option value="3">랩</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>소속사</td>
		<td><input type="text" name="agency"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="등록하기" onclick="submit_form()">
			<input type="button" value="다시쓰기" onclick="reset_form()">
		</td>
	</tr>
</table>
</form>

<script>
function reset_form() {
	document.action_form.reset();
}

function submit_form() {
	if(document.action_form.id.value === "") {
		alert("참가번호가 입력되지 않았습니다!");
		document.action_form.id.focus();
		return;
	}
	if(document.action_form.name.value === "") {
		alert("참가자명이 입력되지 않았습니다!");
		document.action_form.name.focus();
		return;
	}
	if(document.action_form.year.value === "" || document.action_form.month.value === "" || document.action_form.day.value === "") {
		alert("생년월일이 입력되지 않았습니다!");
		document.action_form.year.focus();
		return;
	}
	if(document.action_form.gender.value === "") {
		alert("성별이 선택되지 않았습니다!");
		return;
	}
	if(document.action_form.talent.selectedIndex === 0) {
		alert("특기가 선택되지 않았습니다!");
		document.action_form.talent.focus();
		return;
	}
	if(document.action_form.agency.value === "") {
		alert("소속사 입력되지 않았습니다!");
		document.action_form.agency.focus();
		return;
	}
	
	alert("참가신청이 정상적으로 등록되었습니다!");
	document.action_form.submit();
}
</script>

        
<%        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>