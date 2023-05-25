<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="ssi.jsp" %>
	<%@ include file="../header.jsp" %>  
	
        <div class=content style="text-align: center">
    
		<!-- 본문 시작 memberModify.jsp-->
		<div id="font" style="padding-top: 50px; padding-bottom: 50px; font-size:30px; text-align: center;"><h6>회원 정보 수정</h6></div> 
		<%
			String mid=request.getParameter("mid");
			dto=dao.read(mid);
			if(dto==null){
				out.println("회원정보를 다시 확인해주세요");
			}else{
		%>
		<form name="memfrm" id="memfrm" method="post" action="memberUpdateProc.jsp" onsubmit="return memberCheck()"><!-- myscript.js -->
		<table class="table" style="margin: auto; width: 550px">
		<tr>
			<th>아이디</th>
			<td style="text-align: left">
				<input type="text" name="mid" id="mid" value="<%=dto.getMid() %>" size="10" maxlength="10" readonly>&nbsp;&nbsp;
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
				<input type="text" name="mname" id="mname" value="<%=dto.getMname() %>" size="20" maxlength="20" readonly>
			</td>
		</tr> 
		<tr>
			<th>주민등록번호</th>
			<td style="text-align: left">
				<input type="text" name="jomin1" id="jomin1" value="<%=dto.getJomin1() %>" size="6" maxlength="6" readonly>
				-
				<input type="password" name="jomin2" id="jomin2" value="<%=dto.getJomin2() %>" size="7" maxlength="7" readonly>
			</td>
		</tr> 
		<tr>
			<th>이메일</th>
			<td style="text-align: left">
				<input type="text" name="email" id="email" value="<%=dto.getEmail() %>" size="30" maxlength="50" readonly>&nbsp;&nbsp;
				<input type="button" value="E-Mail 중복확인" onclick="emailCheck()"><!-- myscript.js 작성 -->
			</td>
		</tr> 
		<tr>
			<th>전화번호</th>
			<td style="text-align: left">
				<input type="text" name="tel" id="tel"  value="<%=dto.getTel() %>"size="15" maxlength="14">
			</td>
		</tr> 
		<tr>
			<td colspan="2">
				<input type="submit" value="회원정보 수정" class="btn btn-primary">
				<input type="reset" value="취소" class="btn btn-warning">
			</td>
		</tr> 
		
		
		</table>
		</form>
		<%	
			}//if end
		%>
		
		<!-- 본문 끝 -->
        </div>
        
    <%@ include file="../footer.jsp" %>