<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="auth.jsp" %>
	<%@ include file="./ssi.jsp" %>
	    
	<!-- 본문 시작 memberProc.jsp-->
	
	<h3>회원탈퇴 결과</h3>
	<% 
		String mid 	= request.getParameter("mid").trim();
		String passwd = request.getParameter("passwd").trim();
		
		dto.setMid(mid);
		dto.setPasswd(passwd);
		
		int cnt=dao.memdelete(dto);
		
		if(cnt==0){
			out.println("<p>회원탈퇴에 실패했습니다</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		}else{
			
			session.removeAttribute("s_mid");
			session.removeAttribute("s_passwd");
			session.removeAttribute("s_mlevel");			
			
			out.println("<script>");
			out.println("	alert('회원탈퇴 되었습니다');");
			out.println("	location.href='loginForm.jsp';");//목록페이지 이동
			out.println("</script>");
		}//if end
	
	
	
	%>
	<!-- 본문 끝 -->
