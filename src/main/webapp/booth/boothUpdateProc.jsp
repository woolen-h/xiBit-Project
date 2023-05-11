<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

	<h3>전시장 정보 수정</h3>
		
	<%
		
	
		String bname = request.getParameter("bname").trim();
		String baddr = request.getParameter("baddr").trim();
		String bdays = request.getParameter("bdays").trim();
		String bhour = request.getParameter("bhour").trim();
		String boffday = request.getParameter("boffday").trim();
		String btel = request.getParameter("btel1").trim()+"-"+request.getParameter("btel2").trim()+"-"+request.getParameter("btel3").trim();
		String bcode = request.getParameter("bcode");
		
		
		dto.setBname(bname);
		dto.setBaddr(baddr);
		dto.setBdays(bdays);
		dto.setBhour(bhour);
		dto.setBoffday(boffday);
		dto.setBtel(btel);
		dto.setBcode(bcode);
		
		int cnt = dao.update(dto);
		
		if (cnt == 0) {
			out.println("<p>수정을 실패했습니다.</p>");
			out.println("<button type='button' onClick='javascript:history.back()'>다시시도</button>");
		} else {
			out.println("<script>");
			out.println("alert('수정이 완료되었습니다.');");
			out.println("location.href='boothList.jsp'");
			out.println("</script>");
		} // if end
	%>
	
</div>

<%@ include file="../footer.jsp" %>