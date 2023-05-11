<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./ssi.jsp" %>
     
<!-- 본문 시작 memberProc.jsp-->

<h3>회원가입 결과</h3>
<% 
	String mid 	= request.getParameter("mid").trim();
	String passwd = request.getParameter("passwd").trim();
	String mname = request.getParameter("mname").trim();
	String jomin1 = request.getParameter("jomin1");
	String jomin2 = request.getParameter("jomin2");
	String email = request.getParameter("email").trim();
	String tel = request.getParameter("tel1").trim()+"-"+request.getParameter("tel2").trim()+"-"+request.getParameter("tel3").trim();
	
	//String tel3 = request.getParameter("tel").trim()+"-"+ request.getParameter("tel").trim()+"-";
	
	dto.setMid(mid);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setJomin1(jomin1);
	dto.setJomin2(jomin2);
	dto.setEmail(email);
	dto.setTel(tel);
	
	int cnt=dao.memcreate(dto);
	
	if(cnt==0){
		out.println("<p>회원가입에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	alert('회원가입되었습니다');");
		out.println("	location.href='loginForm.jsp';");//목록페이지 이동
		out.println("</script>");
	}//if end



%>
<!-- 본문 끝 -->
