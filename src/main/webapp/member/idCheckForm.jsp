<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idCheckForm.jsp</title>

</head>
<body>
	<div style="margin: auto;" align="center">
		<br><br>
		<h3>아이디 중복확인</h3>
		<br>
		<form action="idCheckProc.jsp" onsubmit="return midCheck()">
			아이디 : <input type="text" name="mid" id="mid" maxlength="10" autofocus>
			<br><br>
			<input type="submit" value="중복확인">
		</form>
	</div>
	<script>
		function midCheck() {
			var mid=document.getElementById("mid").value;
			mid=mid.trim();
			if(mid.length<5){
				alert("아이디는 5~10글자 이내로 입력해 주세요");
				return false;
			}//if end
			
			//id는 영어 소문자와 숫자만 입력 가능
		     var exptext = /^[a-zA-z0-9]{4,12}$/;
		     if(exptext.test(mid)==false) {       
		    	 alert("아이디는 영문 대소문자와 숫자 5~10글자 이내로 입력해 주세요")
		    	 document.getElementById("mid").focus();
		        return false;         
		     }//if end				
			
			return true;
		}//blankCheck() end
	</script>
</body>
</html>