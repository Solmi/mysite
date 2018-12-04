<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.List"%>
<%@page import="com.javalec.board.vo.BoardVO"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/styles.css" type="text/css" charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>글 목록</title>
</head>
<body>

	<center>
	<table width=700px>
			<td align="right"><a href="logout.do" class="btn_a100_right rounded">logout</a></td>
	</table>
		<h2>게시판 목록</h2>
		
		

		<!-- 검색 시작 -->
		<form action="list.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width=700px>
				<tr>
					<td align="right">
					<select name="searchCondition">
							<option value="title">제목
							<option value="content">내용
					</select> 
					<input name="keyword" type="text" />
					<input type="submit" class="btn" value="검색" /></td>
				</tr>
			</table>
		</form>



		<!-- 검색 종료 -->
		<%List<BoardVO> list = (List) request.getAttribute("list"); %>
		<% for(BoardVO vo: list){ %>
		<table border="1" cellpadding="0" cellspacing="0" width=700px>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>

			<tr>
				<td width="50px" align="middle"  ><%=vo.getSeq() %></td>
				<td align="middle"><a href="searchone.do?seq=<%=vo.getSeq()%>"><%=vo.getTitle() %></a></td>
				<td width="100px"><%=vo.getWriter() %></td>
				<td width=180px><%=vo.getRegdate() %></td>
				<td width=50px align="middle"><%=vo.getCnt() %></td>
			</tr>

		</table>
		<br>
		<%} %>



		<br>
		<div align="center" width:100%	height:50px margin:20pxauto;>
			<a href="insertBoard.jsp" class="btn_a rounded">게시글 등록</a>&nbsp;&nbsp;&nbsp;
		</div>
	</center>

</body>
</html>