<%@ include file="../auth.jsp" %>
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
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/script.js"></script> 
    <title>Document</title>
  </head>
  <body>
    <div class="landing_page_13_15">
    	<div class="logo">
    		<div  class="xibit_13_21">xiBit</div>
    	</div>
    	<hr>
    	<div class="nav">
	    	<div class="nav_1">
				<div  class="home_13_17"><a href="../index.jsp">Home</a></div>
			    <div  class="exhibition_13_18"><a href="../exhibit/exhibition_tab.jsp">Exhibition</a></div>
			    <div  class="info_13_19"><a href="../information/information_tab.jsp">Information</a></div>
			    <div  class="event_13_20"><a href="../notice/noticeList.jsp">Notice</a></div>
			    <div  class="booth_13_21"><a href="../booth/boothList.jsp">Booth</a></div>
			</div>
			<div class="nav_2">
			  	<%if (s_mid.equals("guest")) {%>
			        <a href="../member/agreement.jsp"><div class="sign_up_13_23">
			          <div class="sign_up_13_24">Sign up</div>
			        </div></a>
			        <a href="../member/loginForm.jsp"><div class="login">
			          <div class="login_82_68">Login</div>
			        </div></a>
			        
			  	<%} else{ %>
			        <a href="../my/myList.jsp"><div class="sign_up_13_23">
			          <span  class="sign_up_13_24">MyPage</span>
			        </div></a>
			        <a href="../member/logout.jsp"><div class="login">
			          <div  class="login_82_68">Logout</div>
			        </div></a>
			  <%} %>  
			</div>
  		</div><!-- nav end -->
  		<hr>