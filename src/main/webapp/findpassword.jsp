<%@page import="com.javalec.board.vo.UserVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/styles.css" type="text/css" charset="utf-8" />
<title>비밀번호찾기</title>

</head>
<body>

				<center>
					<h2>비밀번호 찾기</h2>
					<hr>
					<form action="findpassword.do" method="post" >
						<table border="1" cellpadding="0" cellspacing="0" width="700">
							<tr>
								<td width=30%>아이디</td>
								<td ><input type="text" name="id" size="20" /></td>
							</tr>
							<tr>
								<td >비밀번호</td>
								<td ><h2><font color="blue"><%if(request.getAttribute("password")!=null){ %>
								<%=request.getAttribute("password") %>
								<%} %>
								</font></h2></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit" class="btn100 rounded" value="비밀번호찾기" /></td>
							</tr>
						</table>
						<a href="joinpage.jsp" class="btn_a100 rounded">로그인페이지</a>
					</form>
					<hr>
				</center>

</body>
</html>