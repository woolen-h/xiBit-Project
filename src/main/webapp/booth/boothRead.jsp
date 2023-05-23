<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">

	<h3>전시장 상세보기</h3>
	<p>
		<a href="boothForm.jsp">[글쓰기]</a> <a href="boothList.jsp">[글목록]</a>
	</p>

	<%
	String bcode = request.getParameter("bcode");
	dto = dao.read(bcode);

	if (dto == null) {
		out.println("전시장 정보 불러오기 실패");
	} else {
	%>
	
	<div>

		<br>
		<table>
			<tr>
				<th>전시장 이름</th>
				<td><%=dto.getBname()%></td>
			</tr>
			<tr>
				<th>운영 요일</th>
				<td><%=dto.getBdays()%></td>
			</tr>
			<tr>
			<tr>
				<th>운영 시간</th>
				<td><%=dto.getBhour()%></td>
			</tr>
			<tr>
			<tr>
				<th>휴관일</th>
				<td><%=dto.getBoffday()%></td>
			</tr>
			<tr>
			<tr>
				<th>전화번호</th>
				<td><%=dto.getBtel()%></td>
			</tr>

		</table>
	</div>
	<form method="post" action="boothDel.jsp?bcode=<%=bcode%>"
		onsubmit="return removeCheck()">
		<button type="button"
			onClick="location.href='boothUpdate.jsp?bcode=<%=bcode%>'">수정</button>
		<input type="submit" value="삭제">
	</form>
	<%
	} // if end
	%>
</div>

<%@ include file="../footer.jsp"%>