<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<%
	String ordernum=request.getParameter("ordernum").trim();
	
	dto.setOrdernum(ordernum);
	dto.setMid(s_mid);
	
	int cnt=dao.delete(dto); 
	if(cnt==0){
		out.println("<p>예매 취소에 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	  alert('예매취소되었습니다..');");
		out.println("	  location.href='../my/myList.jsp';");
		out.println("</script>");
	}
%>



<%@ include file="../footer.jsp"%>