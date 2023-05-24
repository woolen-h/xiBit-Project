<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

	<h3>전시장 수정</h3>
	
	<%
		String bcode = request.getParameter("bcode");
		dto = dao.read(bcode);
		
		if (dto == null) { 
			out.println("수정 실패");
		}
			else {
	%>
	
	<p>
		<a href="boothForm.jsp">[전시장 관련 글쓰기]</a>
		<a href="boothList.jsp">[전시장 목록]</a>
	</p>
	
	<div class="container">
		<form name="boothfrm" id="boothfrm" method="post" action="boothUpdateProc.jsp" onsubmit="return boothCheck()">
			<input type="hidden" name="bcode" value="<%=bcode%>">
			<table>
				<tr>
					<th>전시장 이름</th>
					<td>
						 <input type="text" name="bname" id="bname"
						 		value="<%
											String bname = dto.getBname();
											if (bname.equals("Seo")) {
												out.print("[서울]국립현대미술관");
											} else if (bname.equals("Gwa")) {
												out.print("[과천]국립현대미술관");
											} else if (bname.equals("Deok")) {
												out.print("[덕수궁]국립현대미술관");
											} else if (bname.equals("Cheong")) {
												out.print("[청주]국립현대미술관");
											} else if (bname.equals("Kid")) {
												out.print("어린이미술관");
											}// if end
										%>"
								maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>운영요일</th>
					<td>
						<input type="text" name="bdays" id="bdays" value="<%=dto.getBdays()%>" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>운영시간</th>
					<td>
						<input type="text" name="bhour" id="bhour" maxlength="50" value="<%=dto.getBhour()%>" required>
					</td>
				</tr>
				<tr>
					<th>휴관일</th>
					<td>
						<input type="text" name="boffday" id="boffday" value="<%=dto.getBoffday()%>" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td style="text-align: left">
					<% String btel = dto.getBtel(); %>	<!-- 경기도 지역일 경우 substring 값 달라지는거 확인해보기 -->
						
						<input type="text" name="btel1" id="tel1" size="3" value="<%=dto.getBtel().substring(0, 2) %>" maxlength="3">	
						-
						<input type="text" name="btel2" id="tel2" size="4" value="<%=dto.getBtel().substring(3, 7) %>" maxlength="4">
						-
						<input type="text" name="btel3" id="tel3" size="4" value="<%=dto.getBtel().substring(8, 12) %>" maxlength="4">
					</td>
				</tr> 
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정"> 
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	<%
		} // if end
	%>		
	</div>
</div>

<%@ include file="../footer.jsp" %>