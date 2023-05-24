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
	    
	    <title>Find ID/PW</title>
	  </head>
	  
	  <body>
	    <div class=landing_page_13_15>
	      <div class=login_box>
	
	<!-- header 끝 -->
	
        <div class=content_login style="text-align: center">
		<!-- 본문 시작 findID.jsp -->
		
		<form name="findID" id="findID" method="post" action="findIDProc.jsp" onsubmit="return findIDCheck()">
			<h6 id="font" style="font-size:20px;" class="mem_login">Find ID/Password</h6>
			<br><br><br>
				<div class="form-field">
					<input class="loginform" type="text" name="mname" id="mname" placeholder="Type your ID" maxlength="10" required>
				</div>
				<div class="form-field">
					<input class="loginform" type="email" name="email" id="email" placeholder="Type your Email" required>
				</div>
					<input class="button" type="submit" value="Find ID/PW">
					<input class="button" type="reset" value="reset">
					<br><br><br>
					<input class="button" type='button' value='HOME' onclick="location.href='../index.jsp'">
		
		</form>
		
		<!-- 본문 끝 -->
        </div>

        
    <%@ include file="../footer.jsp" %>