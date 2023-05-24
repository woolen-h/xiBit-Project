<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">
	<h3>전시장 안내</h3>

	<%
	if (s_mlevel.equals("A1")) {
	%>
	<div class="exh_write">
		<input class="button" value="글쓰기" onclick="location.href='boothForm.jsp'">
	</div>
	<%
	} //if end
	%>

	<div>

		<%
		//list 가져오기
		ArrayList<BoothDTO> list = dao.list();

		if (list == null) {
			out.print("<tr>");
			out.print("<td colspan='3'>글 없음</td>");
			out.print("</tr>");
			out.print("</table>");
		} else {
		%>

		<div class="scroll_9_139">
			<div class="component_8_121_36">
				<%
				for (int i = 0; i < list.size(); i++) {
					dto = list.get(i);
					if (i % 5 == 0 && i != 0) {
				%>
			</div>
			<!-- component_8_121_36 end -->
			
			<div class="component_8_121_36">
				<%
				}//if end
				%>

				<div class="component_1_121_35"
					onclick="location.href='boothRead.jsp?bcode=<%=dto.getBcode()%>'">

					<img class="img"
						src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dto.getBimg()%>">

					<div class="frame_8_i121_35_9_93">
						<span class="______________________i121_35_9_100"> <%
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
							 } // if end
							 %>
						</span><!-- ______________________i121_35_9_100 end -->
					</div><!-- frame_8_i121_35_9_93 end -->
				</div><!-- component_1_121_35 end -->

				<%
				} //for end
				} //if end
				%>
			</div>
			<!-- component_8_121_36 end -->
		</div>
		<!-- scroll_9_139 end -->
	</div>
	<!-- 21행 end -->
</div>
<!-- content end -->

<%@ include file="../footer.jsp"%>