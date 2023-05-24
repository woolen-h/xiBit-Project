<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

	<h3 class="booth_title">전시장 상세보기</h3>
	
	<div class="booth_btn_flex">	
	<%
	if (s_mlevel.equals("A1")) {
	%>
		<div class="exh_write">
			<input class="button" value="글쓰기" onclick="location.href='boothForm.jsp'"> 
		</div>
	<%
	}//if end
	%>
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
						<th>전시장 이미지</th>
						<td>
							<img src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dto.getBimg()%>">
						</td>
					</tr>
					<tr>
						<th>전시장 이름</th>
						<td>
							<%
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
							%>
						</td>
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
			
<%
			if (s_mlevel.equals("A1")) {
%>
			<form method="post" action="boothDel.jsp?bcode=<%=bcode%>" onsubmit="return removeCheck()">
				<div class="booth_read_btn_flex">
					<button type="button" onClick="location.href='boothUpdate.jsp?bcode=<%=bcode%>'" class="ord_submit">수정</button>
					&nbsp;&nbsp;
					<input type="submit" value="삭제" class="ord_submit">
				</div>
			</form>
			
	<%
			}//if end
		} // if end
	%>
</div>

<%@ include file="../footer.jsp" %>