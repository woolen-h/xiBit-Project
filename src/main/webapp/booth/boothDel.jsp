<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">
				
<%
	String bcode = request.getParameter("bcode");
	String saveDir = application.getRealPath("/storage");

	//dto.setBcode(bcode);
	
	int cnt = dao.delete(bcode, saveDir);
	
	if (cnt == 0) {
		out.println("<p>삭제 실패 했습니다.</p>");
		out.println("<button type='button' onClick='javascript:history.back()'>다시시도</button>");
	} else {
		out.println("<script>");
		out.println("alert('전시장 정보가 삭제되었습니다.');");
		out.println("location.href='boothList.jsp'");
		out.println("</script>");
	} // if end
%>

</div>

<%@ include file="../footer.jsp" %>