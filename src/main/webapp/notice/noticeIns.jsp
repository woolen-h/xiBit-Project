<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

<%
	String category = request.getParameter("category").trim();
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	
	dto.setCategory(category);
	dto.setSubject(subject);
	dto.setContent(content);
	
	int cnt = dao.create(dto); 
	
	if (cnt == 0) {
		out.println("<p>공지사항 작성을 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("alert('공지사항이 추가되었습니다.');");
		out.println("location.href='noticeList.jsp';");
		out.println("</script>");
	} // if end
%>
</div>

<%@ include file="../footer.jsp" %>