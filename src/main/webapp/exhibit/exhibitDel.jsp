<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibitDel.jsp -->
<%
		int excode = Integer.parseInt(request.getParameter("excode"));
		String saveDir = application.getRealPath("/storage");
		
		int cnt = dao.delete(excode,saveDir);
		if(cnt==0){
			out.println("<p>삭제 실패했습니다.</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		}else{
			out.println("<script>");
			out.println("		alert('게시글이 삭제되었습니다.');");
			out.println(" 	location.href='exhibition_tab.jsp';");
			out.println("</script>");
		}
%>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>