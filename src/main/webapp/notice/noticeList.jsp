<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">
	<div class="info_content">
	
		<div class="info_tb_list">
			<ul>
				<li class="fa_qna"><a>공지사항</a></li>
			</ul>
			<!-- 이 부분 수정 어떻게 하면 좋을까 -->
			<ul>
				<li class="info_qna_h">전시 문의</li>
				<li class="info_qna_d"><a href="#">전체</a></li>
				<li class="info_qna_d"><a>전시 1</a></li>
				<li class="info_qna_d"><a>전시 2</a></li>
			</ul>
			<ul>
				<li class="info_qna_h">예약 문의</li>
				<li class="info_qna_d"><a>전체</a></li>
				<li class="info_qna_d"><a>전시 1</a></li>
				<li class="info_qna_d"><a>전시 2</a></li>
			</ul>
		</div> <!-- info_tb_list end -->
		
		<div class="info_tb_container">
		
			<div class="info_tb_search">
				<!-- info_tb_search -->
				<form action="noticeList.jsp" onsubmit="return searchCheck()">
					<div>
						<select name="col" class="select">
							<option value="subject_content">제목+내용</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select> 
						<input type="text" name="word" id="word"> 
						<input type="submit" value="검색">
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
						<a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=dto.getSubject()%></a> 
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
		</div> <!-- info_tb_container end -->
	</div> <!-- info_content end -->
	
	<%
	if (s_mlevel.equals("A1")) {
	%>
	<p>
		<a href="noticeForm.jsp">[글쓰기]</a>
	</p>
	<%
	} // if end
	%>
	
</div> <!-- in_content end -->

<%@ include file="../footer.jsp"%>