<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">

	<div style="width: 100%; text-align: center;">
		<span style="display: inline-block; margin-top: 30px; font-size: 25px;">공지사항 수정</span>
	</div>

	<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	dto = dao.read(noticeno);

	if (dto == null) {
		out.println("수정할 수 없습니다.");
	} else {
	%>
	
	<p>
		<button class="search" onClick="location.href='noticeList.jsp'" style="margin: auto; margin: 10px 0 10px 0; float: right;">글목록</button>
	</p>
	
	<form name="bbsfrm" id="bbsfrm" method="post" action="noticeUpdateProc.jsp" onsubmit="return noticeCheck()">
		<input type="hidden" name="noticeno" value="<%=noticeno%>"> 
		<input type="hidden" name="col" value="<%=col%>"> 
		<input type="hidden" name="word" value="<%=word%>"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<table>
			<tr>
				<th>카테고리</th>
				<td>
					<%
					String category = dto.getCategory();
					%> 
					<select name="category">
						<option value="N" <%if (category.equals("N")) { out.print("selected"); }%>>공지사항</option>
						<option value="E" <%if (category.equals("E")) { out.print("selected"); }%>>이벤트</option>
						<option value="P" <%if (category.equals("P")) { out.print("selected"); }%>>프로그램</option>
						<option value="A" <%if (category.equals("A")) { out.print("selected"); }%>>기사</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject" value="<%=dto.getSubject()%>" maxlength="100" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" name="content" id="content"><%=dto.getContent()%></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div style="width: 100%; display: inline-block;">
						<div style="display: flex; justify-content: center;">
							<input type="submit" value="수정" class="search" style="margin-right: 5px;"> 
							<input type="reset" value="취소" class="search">
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<%
	} // if end
	%>
</div> <!-- content end -->

<%@ include file="../footer.jsp"%>