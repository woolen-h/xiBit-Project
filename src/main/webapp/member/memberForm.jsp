<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
        <div class="content">
		<!-- 본문 시작 memberForm.jsp-->
		<form name="memfrm" id="memfrm" method="post" action="memberProc.jsp" onsubmit="return memberCheck()"><!-- myscript.js -->
		<h6 id="font" style="font-size:20px; text-align: center">Sign up</h6>
		<br><br><br>
			<div style="padding-left: 30%">
				<input class="loginform" type="text" name="mid" id="mid" size="30" maxlength="10" placeholder="Type your ID" readonly>&nbsp;&nbsp;
				<input class="button" type="button" value="ID Check" onclick="idCheck()"><!-- myscript.js 작성 -->
			</div>
			<div style="padding-left: 30%">
				<input class="loginform" type="password" name="passwd" id="passwd" size="30" maxlength="10" placeholder="Type your Password" required>
			</div>
			<div style="padding-left: 30%">
				<input class="loginform" type="password" name="repasswd" id="repasswd" size="30" maxlength="10" placeholder="Check your Password" required>
			</div>
			<div style="padding-left: 30%">
				<input class="loginform" type="text" name="mname" id="mname" size="30" maxlength="20" placeholder="Type your Name" required>
			</div>
			<div style="padding-left: 30%">
				<input class="loginform" type="text" name="jomin1" id="jomin1" size="14" maxlength="6" placeholder="First resident number" required>
				-
				<input class="loginform" type="password" name="jomin2" id="jomin2" size="14" maxlength="7" placeholder="Last resident number" required>
			</div>
			<div style="padding-left: 30%">
				<input class="loginform" type="text" name="email" id="email" size="30" maxlength="50" placeholder="Type your Email" readonly>&nbsp;&nbsp;
				<input class="button" type="button" value="E-Mail Check" onclick="emailCheck()"><!-- myscript.js 작성 -->
			</div>
			<div style="padding-left: 30%">
				<h1>Phone Number</h1><br>
				<input class="loginform" type="text" name="tel1" id="tel1" size="3" maxlength="3">
				-
				<input class="loginform" type="text" name="tel2" id="tel2" size="4" maxlength="4">
				-
				<input class="loginform" type="text" name="tel3" id="tel3" size="4" maxlength="4">
			</div>
			<div style="text-align: center; padding-top: 20px; padding-bottom: 50px">
				<input type="submit" value="sign up" class="button">
				<input type="reset" value="reset" class="button">
			</div>
		</form>
       <!-- 본문 끝 -->
       </div>
   <%@ include file="../footer.jsp" %>