<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="auth.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://fonts.googleapis.com/css?family=Inter&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="https://use.typekit.net/usb8ffu.css">
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/style.css" />
    <title>Document</title>
  </head>
  <body>
    <div class="landing_page_13_15">
    	<a href="index.jsp" class="logo"><div class="logo">
    		<div  class="xibit_13_21">xiBit</div>
    	</div></a>
    	<hr>
    	<div class="nav">
	    	<div class="nav_1">
				<a href="index.jsp"><div class="home_13_17">Home</div></a>
			    <a href="exhibit/exhibition_tab.jsp"><div  class="exhibition_13_18">Exhibition</div></a> 
			    <a href="information/information_tab.jsp"><div  class="info_13_19">Information</div></a> 
			    <a href="notice/noticeList.jsp"><div  class="event_13_20">Notice</div></a>
			    <a href="booth/boothList.jsp"><div  class="booth_13_21">Booth</div></a>
			</div>
			<div class="nav_2">
			  	<%if (s_mid.equals("guest")) {%>
			        <a href="member/agreement.jsp"><div class="sign_up_13_23">
			          <div class="sign_up_13_24">Sign up</div>
			        </div></a>
			        <a href="member/loginForm.jsp"><div class="login">
			          <div class="login_82_68">Login</div>
			        </div></a>
			        
			  	<%} else{ %>
			        <a href="my/myList.jsp"><div class="sign_up_13_23">
			          <span  class="sign_up_13_24">MyPage</span>
			        </div></a>
			        <a href="member/logout.jsp"><div class="login">
			          <div  class="login_82_68">Logout</div>
			        </div></a>
			  <%} %>  
			</div>
  		</div><!-- nav end -->
  		<hr>
        <div class="content-box">
		        <div class="carousel_box">
		        	<ul class="flexplz">
			        	<li>
			        	<!-- 각 전시의 포스터 이미지 -->
			        	<img class="c_img1" alt="artwork" src="https://mdl.artvee.com/sftb/202837fg.jpg"/>
			        	</li>
			        	<li>
			        	<!-- 각 전시의 포스터 이미지 -->
			        	<img class="c_img2" alt="artwork" src="https://mdl.artvee.com/sftb/223059fg.jpg"/>
			        	</li>
			        	<li>
			        	<!-- 각 전시의 포스터 이미지 -->
			        	<img class="c_img3" alt="artwork" src="https://mdl.artvee.com/sftb/601146sl.jpg"/>
			        	</li>
				    </ul>
		        </div>
		        
	        <div class="content-scr">
	        전시가 있어용
	        </div>
	        </div>
        </div>
  </body>
  <script type="text/javascript" src="js/script.js"></script> 
</html>