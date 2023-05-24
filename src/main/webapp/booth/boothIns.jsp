<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">

<%
	//bname, bdays, bhour, boffday, btel
	String bname = request.getParameter("bname");

	String[] bdaysarr = request.getParameterValues("bdays");
	String bdays = "";
	for (int i = 0; i < bdaysarr.length; i++) {
		bdays += bdaysarr[i] + " ";
		if (i < bdaysarr.length - 1) {
			bdays += ",";
		} //if end
	} //for end

	String bhour = request.getParameter("bhour1").trim() + "-" + request.getParameter("bhour2").trim();

	String[] boffarr = request.getParameterValues("boffday");
	String boffday = "";
	for (int i = 0; i < boffarr.length; i++) {
		boffday += boffarr[i] + " ";
		if (i < boffarr.length - 1) {
			boffday += ",";
		} //if end
	} //for end

	String btel = request.getParameter("btel").trim();;

	dto.setBname(bname);
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

<%@ include file="../footer.jsp"%>