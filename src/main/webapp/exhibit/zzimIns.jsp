<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">

	<%
	int excode = Integer.parseInt(request.getParameter("excode"));

	dtoz = daoz.read(s_mid, excode);

	if (dtoz == null) {
		daoz.create(s_mid, excode);
		out.println("<script>");
		out.println("alert('찜 추가되었습니다.');");
		out.println("location.href='exhibitRead.jsp?excode=" + excode + "';");
		out.println("</script>");
	} else {
			int res = daoz.delete(s_mid, excode);
		
			if(res == 0) {
				out.println("<p>찜 삭제 실패했습니다.</p>");
				out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
			} else {
				out.println("<script>");
				out.println("alert('찜 삭제 성공했습니다.');");
				out.println("location.href='exhibitRead.jsp?excode=" + excode + "';");
				out.println("</script>");
			} // if end
		} //if end
	%>

</div>

<%@ include file="../footer.jsp"%>