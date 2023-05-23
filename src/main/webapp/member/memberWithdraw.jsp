<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file="ssi.jsp" %>
	<%@ include file="../header.jsp" %>  
        <div class=content style="text-align: center">
		<!-- 본문 시작 memberWithdraw.jsp-->
		<div class='mem_wd_flex'>
		<h3 class="mem_wd_title">회원탈퇴</h3>
		<br>
		<%
			out.println("<div class='mem_wd_id'>");
			out.println("<strong>"+ s_mid + "</strong>님");
			out.println("</div>");
			out.println("<br>");
			out.println("정말 회원탈퇴를 하시겠습니까?");
			out.println("<br><br>");
			out.println("회원탈퇴를 원하시면 비밀번호를 입력해주세요");
			out.println("<br><br>");
		%>
			<form name="drawfrm" id="drawfrm" method="post" action="memberWithdrawProc.jsp" onsubmit="return infoCheck()"><!-- myscript.js -->
			<div class="form-field">
				<input type="hidden" name="mid" value="<%=s_mid%>">
				<input type="password" name="passwd" id="passwd" class="mem_wd_pass" placeholder="비밀번호" maxlength="10" required>
			</div>
			
			<br><br>
			<input type="button" value="취소"    class="btn btn-primary" onclick="javascript:history.back()">
			<input type="submit" value="회원탈퇴"    class="btn btn-primary">
			</form>
        <!-- 본문 끝 -->
        </div>
        </div>
        
        <script>
			function infoCheck() {
				let passwd=document.getElementById("passwd").value;
				passwd=passwd.trim();
				if(<%=s_passwd%>!=passwd){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				return true;
			}
		</script>
        
        
    <%@ include file="../footer.jsp" %>