<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

<%	//bname, baddr, bdays, bhour, boffday, btel
	String bname = request.getParameter("bname").trim();
	String baddr = request.getParameter("baddr").trim();
	String bdays = request.getParameter("bdays").trim();
	String bhour = request.getParameter("bhour").trim();
	String boffday = request.getParameter("boffday").trim();
	String btel = request.getParameter("btel1").trim()+"-"+request.getParameter("btel2").trim()+"-"+request.getParameter("btel3").trim();

	
	dto.setBname(bname);
	dto.setBaddr(baddr);
	dto.setBdays(bdays);
	dto.setBhour(bhour);
	dto.setBoffday(boffday);
	dto.setBtel(btel);
	
	int cnt = dao.create(dto); 
	
	if (cnt == 0) {
		out.println("<p>전시장 정보 작성을 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else {
		out.println("<script>");
		out.println("alert('전시장 정보가 추가되었습니다.');");
		out.println("location.href='boothList.jsp';");
		out.println("</script>");
	} // if end
%>
</div>

<%@ include file="../footer.jsp" %>