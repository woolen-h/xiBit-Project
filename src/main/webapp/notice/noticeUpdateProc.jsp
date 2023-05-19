<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">

	<h3>공지사항 수정</h3>

	<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));

	String category = request.getParameter("category").trim();
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();

	dto.setCategory(category);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setNoticeno(noticeno);

	int cnt = dao.update(dto);

	if (cnt == 0) {
		out.println("<p>수정을 실패했습니다.</p>");
		out.println("<button type='button' onClick='javascript:history.back()'>다시시도</button>");
	} else {
		out.println("<script>");
		out.println("alert('수정이 완료되었습니다.');");
		out.println("location.href='noticeList.jsp?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "';");
		out.println("</script>");
	} // if end
	%>

</div> <!-- content end -->

<%@ include file="../footer.jsp"%>