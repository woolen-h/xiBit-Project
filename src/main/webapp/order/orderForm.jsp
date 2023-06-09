<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
    
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>    
 
  
<%@ include file="ssi.jsp" %>    

 
  
<div class="content">
	<div class="my_order_container">
		<input type="hidden" name="mid" id="mid" value="<%=s_mid %>">
<!-- 주문서 -->
<!-----------전시정보------------------------------------------------------------------>
<%
	dtoM=daoM.read(s_mid);

	int excode = Integer.parseInt(request.getParameter("excode"));
	dtoE=daoE.read(excode);
	if(dtoE==null){
		out.print("글 없음");
	}else{
%>
	<input type="hidden" name="mid" id="name" value="<%=dtoM.getMname() %>">
	<input type="hidden" name="email" id="email" value="<%=dtoM.getEmail() %>">
	<input type="hidden" name="phone" id="phone" value="<%=dtoM.getTel() %>">
	<input type="hidden" name="exname" id="exname" value="<%=dtoE.getExname() %>">
	
	
	<div style="padding-bottom:30px; border-bottom: solid 1px black;">
		<h1 class="order_title" style="font-size:32px;"><%=dtoE.getExname()%></h1>
	</div>
	<div class="my_order_flex" >
		<img class="img" src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dtoE.getFilename()%>">
		<div class="calender_full">
			<input type="hidden" id="excode" name="excode" value="<%=excode %>">
			<input type="hidden" id="ordernum" name="ordernum" value="">
			<script>
				getCurrentDate();
				
				function getCurrentDate()
			    {
					var excode=parseInt(document.getElementById("excode").value);
					var date = new Date();
			        var year = date.getFullYear().toString();
	
			        var month = date.getMonth() + 1;
			        month = month < 10 ? '0' + month.toString() : month.toString();
	
			        var day = date.getDate();
			        day = day < 10 ? '0' + day.toString() : day.toString();
			        
			        document.getElementById("ordernum").value=year+ month + day + String(excode).padStart(4, '0');
			        
			        
			    }
			</script>
			<!-- 달력 -->
			<div class="calendar-wrap">
		    <div class="calendar-middle-wrap">
		      <!-- 상단 -->
		      <div class="cal_nav">
		      	<!-- 이전 달 -->
		        <a href="javascript:;" class="nav-btn go-prev"></a>
		        <!-- 달력 월 표시 -->
		        <span class="year-month start-year-month"></span>
		        <!-- 다음 달 -->
		        <a href="javascript:;" class="nav-btn go-next"></a>
		      </div>
		      <!-- 달력시작 -->
		      <div class="cal_wrap">
		      	<!-- 요일 -->
		        <div class="days">
		          <div class="day">일</div>
		          <div class="day">월</div>
		          <div class="day">화</div>
		          <div class="day">수</div>
		          <div class="day">목</div>
		          <div class="day">금</div>
		          <div class="day">토</div>
		        </div>
		        <!-- 현재 월 달력 -->
		        <div class="dates start-calendar"></div>
		        <input type="hidden" id="sdate" name="sdate" value="">
		      </div>
		      <br>
		      <br>
		      <div class="checkInOutInfo">
		      <div>
		        <p>
		        <!-- 선택 날 표시 -->
		          <label id="check_in_day"></label>
		        </p>
		      </div>
		    </div>
			</div>
		</div>
		<!-- 달력끝 -->
	</div> <!-- class : calender_full -->
	</div> <!-- class : my_order_flex -->
<!-----------금액정보------------------------------------------------------------------>
	<div>
<%
	int priceA=dtoE.getPrice();
	double priceC=priceA*0.5;
	int disprice=(int)priceC;
%>
	<table class="info_tb">
	<tr>
	<th>성인</th>
		<td><%=dtoE.getPrice() %>
			<input type="hidden" id="aprice" value="<%=dtoE.getPrice() %>">
		</td>
		<td class="count">
			<a href="#" class="minus">-</a>
			<span id="result">0</span>
			<!-- 성인 수량 -->
			<input type="hidden" id="amount1" name="amount1" value="">
			<a href="#" class="plus">+</a>
		</td>
		<td class="totalcost"></td>
	</tr>
	<tr class="num">
	<th>어린이</th>
		<td><%=disprice %>
			<input type="hidden" id="cprice" value="<%=disprice %>">
		</td>
		<td class="count">
			<a href="#" class="minus2">-</a>
			<span id="result2">0</span>
			<!-- 어린이 수량 -->
			<input type="hidden" id="amount2" name="amount2" value="">
			<a href="#" class="plus2">+</a>
		</td>
		<td class="totalcost2"></td>
	</tr>
	<tr>
		<td>합계</td>
		<td class="totalprice"></td>
		<td>원</td>
		<td><input type="hidden" id="price" name="price" value=""></td>
	</tr>
	</table>
	</div>
	<hr>
<!-----------주문정보------------------------------------------------------------------>
	<!-- 주문 정보 -->
	<!-- class : order_check_content -->
	<div class="order_check_content">
		<div style="padding-bottom:35px; margin-top:10px;">
		<h1 class="order_title" style="font-size:23px;">예약자 확인</h1></div>
	
		<div class="order_check_user">
			<p><%=dtoM.getMname()%> / <%=dtoM.getTel()%> / <%=dtoM.getEmail()%></p>
		</div>
	
	</div> <!-- class : order_check_content --> <!-- 주문 정보 -->
	<!-- class : order_cancel -->
	<div class="order_cancel">
		<table>
			<!-- 취소/환불 규정 -->
			<tr>
				<th colspan="2" style="text-align:left">취소/환불 규정</th>
			</tr>
			<tr>
				<td>이용 1일 전까지</td>
				<td>결제금액에 대한 취소 수수료 없음</td>
			</tr>
			<tr>
				<td>이용 당일</td>
				<td>취소 불가</td>
			</tr>
		</table>
		<div class="ord_sub_flex">
			<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
		</div>
	</div>
	</div> <!-- class : order_cancel -->
	</div>
<!----------------------------------------------------------------------------->  
	
<script>
   	let aprice=parseInt(document.getElementById("aprice").value);
   	let cprice=parseInt(document.getElementById("cprice").value);
	
   	let plus = document.querySelector(".plus");
	let minus=document.querySelector(".minus");
	let result=document.querySelector("#result");
	let totalcost=document.querySelector(".totalcost");
	let totalprice=document.querySelector(".totalprice");
	let price=document.getElementById("price");
	
	let Price=0;
	
	let total=0;
	let i=0;

	const cnt=0;

	plus.addEventListener("click", () => {
		i++;
		result.textContent=i;
		let totalcostNum=i*aprice;
		totalcost.textContent=totalcostNum.toLocaleString()+"원";
		
		total+=aprice;
		totalprice.textContent=total.toLocaleString();
		price.value=total.toLocaleString();
		document.getElementById("amount1").value=i;
	})

	minus.addEventListener("click", () => {
		if(i>0){
			i--;
			result.textContent=i;
			let totalcostNum=i*aprice;
			totalcost.textContent=totalcostNum.toLocaleString()+"원";
			
			total-=aprice;
			totalprice.textContent=total.toLocaleString();
			price.value=total.toLocaleString();

			document.getElementById("amount1").value=i;
			
		}else{
			totalcost.textContent=0+"원";
		}
		
	})
	
		
	let plus2 = document.querySelector(".plus2");
	let minus2=document.querySelector(".minus2");
	let result2=document.querySelector("#result2");
	let totalcost2=document.querySelector(".totalcost2");
	let j=0;
	
	plus2.addEventListener("click", () => {
		j++;
		result2.textContent=j;
		let totalcostNum=j*cprice;
		totalcost2.textContent=totalcostNum.toLocaleString()+"원";
		
		total+=cprice;
		totalprice.textContent=total.toLocaleString();
		price.value=total.toLocaleString();

		document.getElementById("amount2").value=j;
		
	})

	minus2.addEventListener("click", () => {
		if(j>0){
			j--;
			result2.textContent=j;
			let totalcostNum=j*cprice;
			totalcost2.textContent=totalcostNum.toLocaleString()+"원";
			
			total-=cprice;
			totalprice.textContent=total.toLocaleString();
			price.value=total.toLocaleString();

			document.getElementById("amount2").value=j;
			
		}else{
			totalcost2.textContent=0+"원";
		}
		
	})
</script>

<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
    	let name=document.getElementById("name").value;
    	let email=document.getElementById("email").value;
    	let phone=document.getElementById("phone").value;
    	let exname=document.getElementById("exname").value;
    
    	console.log(name);
    	console.log(email);
    	console.log(phone);
    	console.log(total);
    	console.log(exname);
    

        var IMP = window.IMP; 
        IMP.init("imp21380672"); 
      
        var todays = new Date();   
        var hourss = today.getHours(); // 시
        var minutess = today.getMinutes();  // 분
        var secondss = today.getSeconds();  // 초
        var milliseconds = todays.getMilliseconds();
        var makeMerchantUid = hourss +  minutess + secondss + milliseconds;
        

        /* kg 이니시스 */
        function requestPay() {
            IMP.request_pay({
                pg : 'html5_inicis',
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : exname,
                amount : total,
                buyer_email : email,
                buyer_name : name,
                buyer_tel : phone,
                buyer_addr : '서울특별시 강남구 역삼동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                		var msg = '결제가 완료되었습니다.';
      	          	alert(msg);
                } else {
	                	var msg = '결제에 실패하였습니다.';
      	          	msg += '에러내용 : ' + rsp.error_msg;
      	          	alert(msg);
                }
            });
        }
        
       
       /* 카카오페이 */
       <%-- function requestPay() {
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
        } --%>
        
        
        
    </script>
<%			
	}
%>
<!-- 본문 끝 -->
   	
   	
<%@ include file="../footer.jsp" %>