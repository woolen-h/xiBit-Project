<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">
	<h3>전시장 안내</h3>
	<p>
		<a href="boothForm.jsp">[글쓰기]</a>
	</p>
	<div>
		<table>
			<tr>
				<th>전시장 이름</th>

				<th>운영 요일</th>

				<th>운영 시간</th>

				<th>휴관일</th>

				<th>전화번호</th>

			</tr>

			<%
			String bdays = request.getParameter("bdays");
			String bhour = request.getParameter("bhour");
			String boffday = request.getParameter("boffday");
			String btel = request.getParameter("btel");

			//list 가져오기
			ArrayList<BoothDTO> list = dao.list();

			if (list == null) {
				out.print("<tr>");
				out.print("<td colspan='3'>글 없음</td>");
				out.print("</tr>");
				out.print("</table>");
			} else {

				for (int i = 0; i < list.size(); i++) {
					dto = list.get(i);
			%>
			<tr>
				<td style="text-align: center;">
					<a href="boothRead.jsp?bcode=<%=dto.getBcode()%>">
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
					</a>
				</td>				
				<td><%=dto.getBdays()%></td>
				<td><%=dto.getBhour()%></td>
				<td><%=dto.getBoffday()%></td>
				<td><%=dto.getBtel()%></td>
			</tr>

			<%
				} //for end
			} //if end
			%>

		</table>
	</div>
</div>

<%@ include file="../footer.jsp"%>