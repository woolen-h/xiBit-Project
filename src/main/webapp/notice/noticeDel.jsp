<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">
				
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	
	dto.setNoticeno(noticeno);
	
	int cnt = dao.delete(dto);
	
	if (cnt == 0) {
		out.println("<p>삭제 실패 했습니다.</p>");
		out.println("<button type='button' onClick='javascript:history.back()'>다시시도</button>");
	} else {
		out.println("<script>");
		out.println("alert('공지사항이 삭제되었습니다.');");
		out.println("location.href='noticeList.jsp?col=" + col + "&word=" + word + "&nowPage="+ nowPage +"';");
		out.println("</script>");
	} // if end
%>

</div>

<%@ include file="../footer.jsp" %>