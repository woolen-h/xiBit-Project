<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
	        <div class="content">	    
			<script src="../js/myscript.js"></script>
			    
			<!-- 본문 시작 memberForm.jsp-->
			<h3 style="text-align: center;">회 원 가 입</h3>
			<br>
			
			<form name="memfrm" id="memfrm" method="post" action="memberProc.jsp" onsubmit="return memberCheck()"><!-- myscript.js -->
			<table class="table" style="margin: auto;">
			<tr>
				<th>아이디</th>
				<td style="text-align: left">
					<input type="text" name="mid" id="mid" size="10" maxlength="10" readonly>&nbsp;&nbsp;
					<input type="button" value="ID 중복확인" onclick="idCheck()"><!-- myscript.js 작성 -->
				</td>
			</tr> 
			<tr>
				<th>비밀번호</th>
				<td style="text-align: left">
					<input type="password" name="passwd" id="passwd" size="10" maxlength="10" required>
				</td>
			</tr> 
			<tr>
				<th>비밀번호 확인</th>
				<td style="text-align: left">
					<input type="password" name="repasswd" id="repasswd" size="10" maxlength="10" required>
				</td>
			</tr> 
			<tr>
				<th>이름</th>
				<td style="text-align: left">
					<input type="text" name="mname" id="mname" size="20" maxlength="20" required>
				</td>
			</tr> 
			<tr>
				<th>주민등록번호</th>
				<td style="text-align: left">
					<input type="text" name="jomin1" id="jomin1" size="6" maxlength="6" required>
					-
					<input type="password" name="jomin2" id="jomin2" size="7" maxlength="7" required>
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td style="text-align: left">
					<input type="text" name="email" id="email" size="30" maxlength="50" readonly>&nbsp;&nbsp;
					<input type="button" value="E-Mail 중복확인" onclick="emailCheck()"><!-- myscript.js 작성 -->
				</td>
			</tr> 
			<tr>
				<th>전화번호</th>
				<td style="text-align: left">
					<input type="text" name="tel1" id="tel1" size="3" maxlength="3">
					-
					<input type="text" name="tel2" id="tel2" size="4" maxlength="4">
					-
					<input type="text" name="tel3" id="tel3" size="4" maxlength="4">
				</td>
			</tr> 
			<tr>
				<td colspan="2" style="text-align: center">
					<input type="submit" value="회원가입" class="btn btn-primary">
					<input type="reset" value="취소" class="btn btn-warning">
				</td>
			</tr> 
			
			</table>
			</form>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>