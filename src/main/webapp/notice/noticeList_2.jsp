<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

	<h3>공지사항 목록</h3>
<% 		
	if(s_mlevel.equals("A1")) {
%>
	<p><a href="noticeForm.jsp">[글쓰기]</a></p>
<%
	}
%>
	<div>
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
				<td>
				<%
					String categoty = dto.getCategory();
					if(categoty.equals("N")) {
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
					<a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=dto.getSubject()%></a>
					<%
					// 오늘 작성한 글 제목 뒤에 new이미지 출력
					// 작성일(regdt)에서 "년월일" 자르기
					String regdt = dto.getRegdate().substring(0, 10);
					if (regdt.equals(today)) { // 작성일이 오늘 날짜와 같다면
						out.println("<img src='../images/new.gif'>");
					} // if end
					%></td>
				<td><%=dto.getRegdate().substring(0, 10)%></td>
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
			<!-- 검색 시작 -->
			<tr>
				<td colspan="3" style="text-align: center; height: 50px;">
					<div>
						<form action="noticeList.jsp" onsubmit="return searchCheck()">
							<div>
								<select name="col">
									<option value="subject_content">제목+내용</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
								</select>
							</div>
							<div>
								<input type="text" name="word" id="word">
							</div>
							<div>
								<input type="submit" value="검색">
							</div>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>

<%@ include file="../footer.jsp" %>