<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>
    
<!-- 본문 시작 memberUpdateProc.jsp-->

<h3>회원정보 수정 결과</h3>
<% 
	String mid 	= request.getParameter("mid").trim();
	String passwd = request.getParameter("passwd").trim();
	String mname = request.getParameter("mname").trim();
	String jomin1 = request.getParameter("jomin1").trim();
	String jomin2 = request.getParameter("jomin2").trim();
	String tel = request.getParameter("tel1").trim()+"-"+request.getParameter("tel2").trim()+"-"+request.getParameter("tel3").trim();
	String email = request.getParameter("email").trim();

	
	dto.setMid(mid);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	
	int cnt=dao.memupdate(dto);
	
	if(cnt==0){
		out.println("<p>회원정보 수정에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	alert('회원정보가 수정되었습니다');");
		out.println("	location.href='../index.jsp';");//목록페이지 이동
		out.println("</script>");
	}//if end
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>