<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">
	<h3 class="booth_title">공지사항</h3>
	<div class="info_content">
	
		<div class="info_tb_container">
		
			<div class="info_tb_search">
				<form action="noticeList.jsp" onsubmit="return searchCheck()">
					<div style="display: flex;">
						<select name="col" class="location_9_113" style="margin-right: 5px;">
							<option value="subject_content">제목+내용</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select> 
						<input type="text" name="word" id="word" style="margin-right: 5px;"> 
						<input type="submit" value="검색" class="search">
					</div>
				</form>
			</div> <!-- info_tb_search end -->
			
			<table>
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
				<%
				int recordPerPage = 10;

				ArrayList<NoticeDTO> list = dao.list3(col, word, nowPage, recordPerPage);

				if (list == null) {
					out.print("<tr>");
					out.print("<td colspan='3'>글 없음</td>");
					out.print("</tr>");
					out.print("</table>");
				} else {
					// 오늘 날짜를 문자열 "2023-04-14" 만들기
					String today = Utility.getDate();

					for (int i = 0; i < list.size(); i++) {
						dto = list.get(i);
				%>
				<tr>
					<td style="text-align: center;">
						<%
						String categoty = dto.getCategory();
						if (categoty.equals("N")) {
							out.print("공지사항");
						} else if (categoty.equals("E")) {
							out.print("이벤트");
						} else if (categoty.equals("P")) {
							out.print("프로그램");
						} else if (categoty.equals("A")) {
							out.print("기사");
						} // if end
						%>
					</td>
					<td style="text-align: left">
						<a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" style="color: inherit;"><%=dto.getSubject()%></a> 
						<%
							// 오늘 작성한 글 제목 뒤에 new이미지 출력
							// 작성일(regdt)에서 "년월일" 자르기
							String regdt = dto.getRegdate().substring(0, 10);
							if (regdt.equals(today)) { // 작성일이 오늘 날짜와 같다면
								out.println("<img src='../images/new.gif'>");
							} // if end
						%>
					</td>
					<td style="text-align: center;"><%=dto.getRegdate().substring(0, 10)%></td>
				</tr>
				<%
				} // for end

				// 글 개수
				int totalRecord = dao.count2(col, word);
				out.println("<tr>");
				out.println("<td colspan='3' style='text-align:center;'>");
				out.println("글 개수: <strong>" + totalRecord + "</strong>");
				out.println("</td>");
				out.println("</tr>");

				// 페이지 리스트
				out.println("<tr>");
				out.println("<td colspan='3' style='text-align: center; height: 50px;'>");

				String paging = new Paging().paging2(totalRecord, nowPage, recordPerPage, col, word, "noticeList.jsp");
				out.println(paging);

				out.println("</td>");
				out.println("</tr>");
				} // if end
				%>
			</table>
			
			<%
			if (s_mlevel.equals("A1")) {
			%>
			<p>
				<button class="search" onclick="location.href='noticeForm.jsp'" style="margin: auto; margin-top: 10px;">글쓰기</button>
			</p>
			<%
			} // if end
			%>
			
		</div> <!-- info_tb_container end -->
	</div> <!-- info_content end -->
</div> <!-- in_content end -->

<%@ include file="../footer.jsp"%>