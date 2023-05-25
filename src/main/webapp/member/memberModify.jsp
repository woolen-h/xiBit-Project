<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="ssi.jsp" %>
	<%@ include file="../header.jsp" %>  
	
        <div class="content">
    
		<!-- 본문 시작 memberModify.jsp-->
		<div style="width: 100%; display: flex; justify-content: center; align-items: center;">
		<form name="memfrm" id="memfrm" method="post" action="memberUpdateProc.jsp" onsubmit="return memberCheck()">
		
			<div id="font" style="padding-top: 50px; padding-bottom: 50px; font-size:30px; text-align: center;"><h6>회원 정보 수정</h6></div> 
			<%
				String mid=request.getParameter("mid");
				dto=dao.read(mid);
				if(dto==null){
					out.println("회원정보를 다시 확인해주세요");
				}else{
			%>
					<div style="padding-bottom: 20px;">
						<input class="loginform" type="text" name="mid" id="mid" value="<%=dto.getMid() %>" size="30" maxlength="10" readonly><br>
					</div>
					<div style="padding-bottom: 20px;">
						<input class="loginform" type="password" name="passwd" id="passwd" size="30" maxlength="10" placeholder="Type your Password" required>
					</div>
					<div style="padding-bottom: 20px;">
						<input class="loginform" type="password" name="repasswd" id="repasswd" size="30" maxlength="10" placeholder="Check your Password" required>
					</div>
					<div style="padding-bottom: 20px;">
						<input class="loginform" type="text" name="mname" id="mname" value="<%=dto.getMname() %>" size="30" maxlength="20"required>
					</div>
					<div style="padding-bottom: 20px;">
						<input class="loginform" type="text" name="jomin1" id="jomin1" value="<%=dto.getJomin1() %>" size="14" maxlength="6" readonly>
						-
						<input class="loginform" type="password" name="jomin2" id="jomin2" value="<%=dto.getJomin2() %>" size="14" maxlength="7" readonly>
					</div>
					<div style="padding-bottom: 20px;">
						<input class="loginform" type="text" name="email" id="email" value="<%=dto.getEmail() %>" size="30" maxlength="50" readonly><br>
					</div>
					<%
					String tel = dto.getTel();
					String tel_s[] = tel.split("-");
					
					%>
					<div style="padding-bottom: 20px;">
						<h1>Phone Number</h1><br>
						<input class="loginform" type="text" name="tel1" id="tel1" value="<%=tel_s[0]%>" size="3" maxlength="3">
						-
						<input class="loginform" type="text" name="tel2" id="tel2" value="<%=tel_s[1]%>" size="4" maxlength="4">
						-
						<input class="loginform" type="text" name="tel3" id="tel3" value="<%=tel_s[2]%>" size="4" maxlength="4">
					</div>
					<div style="text-align: center; padding-top: 20px; padding-bottom: 50px">
						<input type="submit" value="수정" class="button">
						<input type="reset" value="reset" class="button">
					</div>
			</div>
		</form>
		<%	
			}//if end
		%>
		
		<!-- 본문 끝 -->
        </div>
        
    <%@ include file="../footer.jsp" %>