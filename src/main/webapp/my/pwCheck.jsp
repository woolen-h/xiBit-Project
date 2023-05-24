<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
	
<div class=content style="text-align: center">
<div class='mem_wd_flex'>
<h3 class="mem_wd_title">개인정보 확인</h3>
	<form method="post" action="../member/memberModify.jsp" onsubmit="return infoCheck()">
		
		<!-- <input type="hidden"> -->
		<div class='mem_wd_id'>
			<p style="font-weight:bold; font-size:16px; margin-top:55px;">개인정보 수정 시 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</p>
			<p style="font-weight:bold; font-size:16px; margin:25px;">비밀번호는 타인에게 노출되지 않도록 주의해주세요</p>
			
		</div>
		<div>
			<div style="margin:15px;">
				<input type="hidden" name="mid" value="<%=s_mid%>">
				<input type="password" placeholder="비밀번호를 입력하세요."  class="mem_wd_pass"  name="password" id="password" required >
			</div>
			<div style="margin:15px;">
				<button type="submit">로그인</button>
			</div>
			<div>
				<a href="../member/findID.jsp">아이디/비밀번호 찾기 | </a>
				<a href="../member/agreement.jsp">회원가입</a>
			</div>
		</div>
		
	</form>
</div>

<script>
	function infoCheck() {
		let password=document.getElementById("password").value;
		password=password.trim();
		if(<%=s_passwd%>!=password){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		return true;
	}
</script>
<%@ include file="../footer.jsp"%>