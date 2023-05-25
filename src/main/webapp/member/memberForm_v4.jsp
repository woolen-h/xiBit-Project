<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
        <div class="content">
		<!-- 본문 시작 memberForm.jsp-->
		<form name="memfrm" id="memfrm" method="post" action="memberProc.jsp" onsubmit="return memberCheck()"><!-- myscript.js -->
		<div id="font" style="padding-top: 50px; padding-bottom: 50px; font-size:30px; text-align: center;"><h6>Sign up</h6></div>
			<div style="padding-bottom: 20px;" id="divId">
				<input class="loginform" type="text" name="mid" id="mid" size="30" maxlength="10" placeholder="Type your ID">&nbsp;&nbsp;<br>
				<font id = "checkId" size = "2"></font>
			</div>
			<div style="padding-bottom: 20px;">
				<input class="loginform" type="password" name="passwd" id="passwd" size="30" maxlength="10" placeholder="Type your Password" required>
			</div>
			<div style="padding-bottom: 20px;">
				<input class="loginform" type="password" name="repasswd" id="repasswd" size="30" maxlength="10" placeholder="Check your Password" required>
			</div>
			<div style="padding-bottom: 20px;">
				<input class="loginform" type="text" name="mname" id="mname" size="30" maxlength="20" placeholder="Type your Name" required>
			</div>
			<div style="padding-bottom: 20px;">
				<input class="loginform" type="text" name="jomin1" id="jomin1" size="14" maxlength="6" placeholder="First resident number" required>
				-
				<input class="loginform" type="password" name="jomin2" id="jomin2" size="14" maxlength="7" placeholder="Last resident number" required>
			</div>
			<div style="padding-bottom: 20px;">
				<input class="loginform" type="text" name="email" id="email" size="30" maxlength="50" placeholder="Type your Email" readonly>&nbsp;&nbsp;
				<input class="button" type="button" value="E-Mail Check" onclick="emailCheck()"><!-- myscript.js 작성 -->
			</div>
			<div style="padding-bottom: 20px;">
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
       
       
       
       <script>

       <!-- 아이디중복체크 -->
       
       function winopen(){
			//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
			//1. 아이디가 없으면 알림창과 진행x
			if(document.getElementById("mid").value =="" || document.getElementById("mid").value < 0){
				alert("아이디를 먼저 입력해주세요")
				document.getElementById("mid").focus();
			}else{
				//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
				//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
				window.open("idCheckProc.jsp?mid="+document.getElementById("mid").value,"","width=500, height=300");
			}
		}
       
       
       $('#mid').focusout(function () {
    	   
    	   var mid = $('#mid').val();
    	   
			mid=mid.trim();
			if(mid.length<5){
				$("#checkId").html("5~10글자 이내로 입력해 주세요");
                $("#checkId").attr('color', 'red');
		    	 document.getElementById("mid").focus();
				return false;
			}else{
				$("#checkId").html("");
			}//if end
			
			//id는 영어 소문자와 숫자만 입력 가능
		     var exptext = /^[a-zA-z0-9]{4,12}$/;
		     if(exptext.test(mid)==false) {       
		    	 $("#checkId").html("영문 대소문자와 숫자 5~10글자 이내로 입력해 주세요")
                $("#checkId").attr('color', 'red');
		    	 document.getElementById("mid").focus();
		        return false;         
		     }else{
				$("#checkId").html("");
		     }//if end	  	   
  			
			$.ajax({    	   					
			    type: 'post',
			    url: 'idCheckProc.do',
			    data: {"mid": "mid"},
			    dataType: 'text',
			    success: function(data) {
			        if (data == 0) {
			            $("#checkId").html('사용 가능한 아이디입니다.');
			        } else {
			        	alert(result);
			            $("#checkId").html('이미 사용중인 아이디입니다.');
		                $("#checkId").attr('color', 'red');
			        }//if end
			    },
			    error: function(request,status,error) {
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			})//ajax() end
    	})//end

       </script>

       
       
       
       
       
       
   <%@ include file="../footer.jsp" %>