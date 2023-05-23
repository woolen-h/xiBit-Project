<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">
	<div style="width: 100%; text-align: center;">
		<span style="display: inline-block; margin-top: 30px; font-size: 25px;">공지사항 상세보기</span>
	</div>
	<p>
		<button class="search" onClick="location.href='noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'" style="margin: auto; margin: 10px 0 10px 0; float: right;">글목록</button>
	</p>

	<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));

	dto = dao.read(noticeno);

	if (dto == null) {
		out.println("존재하지 않는 글입니다.");
	} else {
		
	%>
	<div>
		<br>
		<table>
			<tr>
				<th>카테고리</th>
				<td colspan="5">
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
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5"><%=dto.getSubject()%></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto.getRegdate()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2" style="text-align: left; height: 100px;">
					<%
					// 특수문자 및 엔터를 <br>태그로 치환하기
					String content = Utility.convertChar(dto.getContent());
					out.print(content);
					%>
				</td>
			</tr>
		</table>
	</div> <!-- end -->
	
	<div style="width: 100%; display: inline-block; margin-top: 10px;">
		<form style="display: flex; float: right;" method="post" action="noticeDel.jsp?noticeno=<%=noticeno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" onsubmit="return removeCheck()">
			<button style="margin-right: 5px;" type="button" onClick="location.href='noticeUpdate.jsp?noticeno=<%=noticeno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'" class="search">수정</button>
			<input type="submit" value="삭제" class="search">
		</form>
	</div>
	
	<%
	} // if end
	%>
	
</div> <!-- content end -->

<%@ include file="../footer.jsp"%>