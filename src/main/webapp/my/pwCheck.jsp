<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="auth.jsp" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<div>
	<h3>개인정보 확인</h3>
</div>
<div class="content">
	<form method="post" action="../member/memberModify.jsp" onsubmit="return infoCheck()">
		<!-- <input type="hidden"> -->
		<div>
			<p style="font-weigth:bold;">
				개인정보 수정 시 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.<br>
				비밀번호는 타인에게 노출되지 않도록 주의해주세요
			</p>
		</div>
		<div>
			<div>
				<input type="hidden" name="id" id="id">
				<input type="password" placeholder="비밀번호를 입력하세요." name="password" id="password" required>
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
			<div>
				<a href="../member/findID.jsp">아이디/비밀번호 찾기</a>
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