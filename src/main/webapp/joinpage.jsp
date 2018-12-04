<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/styles.css" type="text/css" charset="utf-8" />

<title>로그인페이지</title>
</head>
<body>
	<center>
		<h2>로그인</h2>
		<hr>
		<form action="join.do">
			<table border="1" cellpadding="0" cellspacing="0" width=700px>
				<tr>
					<td width=20%>아이디</td>
					<td>&nbsp;&nbsp;<input type="text" name="id" size="20" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>&nbsp;&nbsp;<input type="password" name="password" size="20" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" class="btn" value="로그인" /></td>
				</tr>
			</table>
			<%if(session.getAttribute("error")!=null){%>
			<%=session.getAttribute("error") %>
			<% }%></br>
			<a href="joinform.jsp" class="btn_a rounded">회원가입</a>
			<a href="findpassword.jsp" class="btn_a rounded">비밀번호찾기</a>
		</form>
		<hr>
	</center>
</body>
</html>