<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

	<h3 class="booth_title">전시장 상세보기</h3>
	<div class="booth_btn_flex">
		<div class="booth_write_btn">
			<a href="boothForm.jsp">글쓰기</a>
		</div>
		&nbsp;&nbsp;
		<div class="booth_write_btn">
			<a href="boothList.jsp">글목록</a>
		</div>
	</div>
	
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
						<th>전시장 지역</th>
						<td><%=dto.getBaddr()%></td>
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
			<form method="post" action="boothDel.jsp?bcode=<%=bcode%>" onsubmit="return removeCheck()">
				<div class="booth_read_btn_flex">
					<button type="button" onClick="location.href='boothUpdate.jsp?bcode=<%=bcode%>'" class="ord_submit">수정</button>
					&nbsp;&nbsp;
					<input type="submit" value="삭제" class="ord_submit">
				</div>
			</form>
	<%
		} // if end
	%>
</div>

<%@ include file="../footer.jsp" %>