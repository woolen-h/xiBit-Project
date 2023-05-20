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
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/script.js"></script> 
    <title>Document</title>
  </head>
  <body>
    <div class=landing_page_13_15>
      <div class=b_box_65_4>
        <div  class="xibit_13_21">xiBit</div>
        <div  class="home_13_17"><a href="../index.jsp">Home</a></div>
        <div  class="exhibition_13_18"><a href="../exhibit/exhibition_tab.jsp">Exhibition</a></div>
        <div  class="info_13_19"><a href="../information/information_tab.jsp">Information</a></div>
        <div  class="event_13_20"><a href="../notice/noticeList.jsp">Notice</a></div>
        <div  class="booth_13_21"><a href="../booth/boothList.jsp">Booth</a></div>
        
  <%if (s_mid.equals("guest")) {%>
        <div class=sign_up_13_23>
          <span  class="sign_up_13_24"><a href="../member/agreement.jsp">Sign up</a></span>
        </div>
        <div class=sign_up_82_67>
          <div  class="login_82_68"><a href="../member/loginForm.jsp">Login</a></div>
        </div>
  <%} else{ %>
        <div class=sign_up_13_23>
          <span  class="sign_up_13_24"><a href="../my/myList.jsp">MyPage</a></span>
        </div>
        <div class=sign_up_82_67>
          <div  class="login_82_68"><a href="../member/logout.jsp">Logout</a></div>
        </div>
  <%} %>  