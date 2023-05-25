<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="ordheader.jsp" %>
<!DOCTYPE html>
<html>
<% 
   /* 아이디  */
   String mid    = request.getParameter("mid").trim();
   /* 이름  */
   String name    = request.getParameter("name").trim();
   /* 이메일  */
   String email    = request.getParameter("email").trim();   
   /* 전화번호  */
   String phone    = request.getParameter("phone").trim();   
   /* 전화번호  */
   String exname    = request.getParameter("exname").trim();
   
   
   /* 주문번호  */
   String ordernum    = request.getParameter("ordernum").trim();
   /* 전시코드  */
   int excode = Integer.parseInt(request.getParameter("excode"));
   /* 수량  */
   int amount_A = Integer.parseInt(request.getParameter("amount1"));
   int amount_C = Integer.parseInt(request.getParameter("amount2"));
   int amount = amount_A+amount_C;
   /* 금액  */
   String price = request.getParameter("price");
   /* 선택날짜  */
   String sdate = request.getParameter("sdate").trim();

%>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
    	let name=<%=name%>;
    	console.log(name);
    <%-- 
    	var IMP = window.IMP; 
        IMP.init("imp21380672"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'kakaopay',
                merchant_uid: "merchant"+makeMerchantUid, 
                name : '<%=exname%>',
                amount : <%=price%>,
                buyer_email : '<%=email%>',
                buyer_name : '<%=name%>',
                buyer_tel : '<%=phone%>',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
        
        function requestPay() {
        	  IMP.init('imp21380672'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
        	  IMP.request_pay({
        	    pg: "inicis",
        	    pay_method: "card",
        	    merchant_uid : 'merchant_'+new Date().getTime(),
        	    name : '<%=exname%>',
        	    amount : <%=price%>,
        	    buyer_email : '<%=email%>',
        	    buyer_name : '<%=name%>',
        	    buyer_tel : '<%=phone%>',
        	    buyer_addr : '서울특별시 강남구 삼성동',
        	    buyer_postcode : '123-456'
        	  }, function (rsp) { // callback
        	      if (rsp.success) {
        	    	  <%
        	    	   dto.setMid(mid);
        	    	   dto.setOrdernum(ordernum);
        	    	   dto.setExcode(excode);
        	    	   dto.setAmount(amount);
        	    	   dto.setPrice(price);
        	    	   dto.setSdate(sdate);
        	    	  %>
        	    	  var msg = '결제가 완료되었습니다.';
        	          alert(msg);
        	      } else {
        	    	  var msg = '결제에 실패하였습니다.';
        	          msg += '에러내용 : ' + rsp.error_msg;
        	          alert(msg);
        	      }
        	  });
        }
         --%>
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
    
</head>
<body>
    <button onclick="requestPay()">결제하기</button>
</body>
</html>   	