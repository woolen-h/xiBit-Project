<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idCheckProc.jsp</title>
</head>
<body>
	<h3>아이디 중복확인 결과</h3>
<%
	String mid=request.getParameter("mid").trim();
	PrintWriter oout = response.getWriter();

	int cnt=dao.duplecateID(mid);
	
	if(cnt==0){
		System.out.println("사용 가능한 아이디 입니다.");
		System.out.println(cnt);
	}else{
		System.out.println("해당 아이디는 사용할 수 없습니다.");
		System.out.println(cnt);
	}//if end
	
	oout.write(cnt+"");
%>


</body>
</html>