<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ include file="auth.jsp" %>
	<%@ include file="ssi.jsp" %>
	
	<!-- header 시작 -->
	
	<!DOCTYPE html>
	<html lang="en">
	  <head>
	    <meta charset="UTF-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <link
	      href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	      rel="stylesheet"/>
	    <link rel="stylesheet" href="../css/reset.css" />
	    <link rel="stylesheet" href="../css/login_style.css" />
	    <script type="text/javascript" src="../js/script.js"></script> 
	    
	    <title>Login</title>
	  </head>
	  
	  <body>
	    <div class=landing_page_13_15>
	      <div class=b_box_65_4>
	
	<!-- header 끝 -->
	
        <div class=content style="text-align: center">
		<!-- 본문 시작 findID.jsp -->
		
		<form name="findID" id="findID" method="post" action="findIDProc.jsp" onsubmit="return findIDCheck()">
			<h3>아이디/비밀번호 찾기</h3>
			<br>
				<div class="form-field">
					<input type="text" name="mname" id="mname" placeholder="이름" maxlength="10" required>
				</div>
				<div class="form-field">
					<input type="email" name="email" id="email" placeholder="이메일" required>
				</div>
					<input type="submit" value="아이디/비밀번호 찾기" class="btn btn-primary">
					<input type="reset" value="취소" class="btn btn-warning">
		
		</form>
		
		<!-- 본문 끝 -->
        </div>

        
    <%@ include file="../footer.jsp" %>