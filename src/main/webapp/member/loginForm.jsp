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
		<!-- 본문 시작 loginForm.jsp-->
		
		
		<br>
		<% if(s_mid.equals("guest") || s_mlevel.equals("F1") || s_passwd.equals("guest") || s_mlevel.equals("guest")) {
			//ID저장 쿠키 확인/////////////////////////////////////////////////////
			Cookie[] cookies=request.getCookies();//사용자 PC에 저장된 모든 쿠키값 가져오기
			String c_mid="";
			if(cookies!=null){//쿠키값들이 존재하는지?
				for(int i=0; i<cookies.length; i++){//모든 쿠키값들 검색
					Cookie cookie=cookies[i];//쿠키 하나씩 가져오기
					if(cookie.getName().equals("c_mid")==true){
						c_mid=cookie.getValue();//쿠키변수값 가져오기				
					}//if end			
				}//for end
			}//if end
			
			//ID저장 쿠키 확인 끝/////////////////////////////////////////////////////
		%>
		<form name="loginfrm" id="loginfrm" method="post" action="loginProc.jsp" onsubmit="return loginCheck()"><!-- myscript.js -->
			<h3>L O G I N</h3>
			<br><br><br>
	
			<div>
				<input class="loginform" type="text" name="mid" id="mid" value="<%=c_mid %>" placeholder="ID" maxlength="10" required>
			</div>
			<br>
			<div>
				<input class="loginform" type="password" name="passwd" id="passwd" placeholder="PASSWORD" maxlength="10" required>
			</div>
	
			<br><br>
				<label><input type="checkbox" name="c_mid" value="SAVE">&nbsp;&nbsp;ID memory</label>
			<br><br>
				<input class="button" type="button" value="sign up" onclick="location.href='agreement.jsp'">
				&nbsp;&nbsp;
				<input class="button" type="button" value="Find ID/Password" onclick="location.href='findID.jsp'">
			<br>
			<br>
				<input class="button" type="submit" value="login" class="btn btn-primary">
		</form>
		<form>
		<%
		}else{
			//로그인 성공했다면	
			out.println("<strong>"+ s_mid + "</strong>님");
			out.println("<br>");
			out.println("좋은하루 보내세용");
			out.println("<br><br>");
		%>
			<input type='button' value='logout' class='btn btn-warning' onclick="location.href='logout.jsp'">
		
			<br><br>
			<a href='../my/myList.jsp?mid=<%=s_mid%>'>[마이페이지]</a>
			<br>
			&nbsp;&nbsp;
			<a href='memberModify.jsp?mid=<%=s_mid%>'>[회원정보수정]</a>
			<br>
			&nbsp;&nbsp;
			<a href='memberWithdraw.jsp?mid=<%=s_mid%>'>[회원탈퇴]</a>
		<%
		}//if end
		%>
		</form>
        <!-- 본문 끝 -->
        </div>

        
    <%@ include file="../footer.jsp" %>
