<%@page import="com.javalec.board.vo.BoardVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/styles.css" type="text/css" charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글정보</title>

	<%BoardVO vo =  (BoardVO)request.getAttribute("vo"); %>

<script>
function delch(){
	var del_con = confirm("삭제하시겠습니까?");
	if(del_con){
		location.href = "delete.do?seq="+<%=vo.getSeq()%>
	}
	
}
function modify(){
	var mod_con = confirm("게시글 변경하시겠습니까?");
	if(mod_con){
		location.href ="updateform.do?seq="+<%=vo.getSeq()%>;
	}
	
}
function list_do(){
		location.href ="list.do";
}
</script>
</head>
<body>
				<center>
					<h1>게시글 상세</h1>
					<hr>

						<table border="1" cellpadding="0" cellspacing="0" width=700px>
							<tr>
								<td  width=20%>제목</td>
								<td >&nbsp;&nbsp;<input name="title" type="text" value=<%=vo.getTitle() %>
									 disabled="disabled"/></td>
							</tr>
							<tr>
								<td >작성자</td>
								<td >&nbsp;&nbsp;<input name="writer" type="text" value=<%=vo.getWriter()%>
									disabled="disabled" /></td>
							</tr>
							<tr>
								<td >내용</td>
								<td >&nbsp;&nbsp;<textarea name="content" cols="70" rows="10" disabled="disabled"><%=vo.getContent()%></textarea>
								</td>
							</tr>
							<tr>
								<td >등록일</td>
								<td ><%=vo.getRegdate() %></td>
							</tr>
							<tr>
								<td >조회수</td>
								<td ><%=vo.getCnt() %></td>
							</tr>

						</table>
					<hr>
				</center>
				<div align="center"	width:100%	height:50px  margin:20px auto;>
				<%String role = (String)session.getAttribute("role"); 
				 if(session.getAttribute("id").equals(vo.getId())|| role.equals("admin") ){%>
					<input type="button" value="변경" class="btn rounded" onclick="modify()">
					<input type="button" value="삭제" class="btn rounded" onclick="delch()">
					<%} %>
					<input type="button" value ="목록" class="btn rounded" onclick="list_do()">
				</div>
</body>
</html>
