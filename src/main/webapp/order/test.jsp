<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>    

<%@ include file="ssi.jsp" %>    
<%@ include file="ordheader.jsp" %>

<div class="content">
<form name="ordfrm" id="ordfrm" action="orderProc.jsp" >
<input type="hidden" name="mid" id="mid" value="s_id">

<!-- 주문서번호 생성 -->
<!-- <input type="hidden" name="ordernum" id="ordernum" value=""> -->
	
<!-- 주문서 -->
<!-- 왼쪽 -->
<!-----------전시정보------------------------------------------------------------------>

	<div> <!-- 왼쪽 -->
	<table>
	<tr>
		<th width="30%">사진</th>
		<td></td>
	</tr>
	<tr>
		<th>전시명</th>
		<td>사회</td>
	</tr>
	<tr>
		<th>전시장소</th>
		<td>서울국현미</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
		</td>
	</tr>
	<tr>
		<th>작가</th>
		<td>홍길동</td>
	</tr>
	<tr>
		<th>전시기간</th>
		<td>2023-03-21~2023-04-12</td>
	</tr>
	<tr>
		<th>작품수</th>
		<td>30</td>
	</tr>
	<tr>
		<th>문의번호</th>
		<td>02-002-233</td>
	</tr>
	</table>
	</div>
	<hr>

<!-- 오른쪽 -->
<!-----------금액정보------------------------------------------------------------------>
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
      </div>
    </div>


    <div class="checkInOutInfo">
      <div>
        <p>
        <!-- 선택 날 표시 -->
          <label id="check_in_day"></label>
        </p>
      </div>
    </div>
</div>

<!-----------금액정보------------------------------------------------------------------>
	<div>
	<table>
	<tr class="num">
	<th>성인</th>
		<td>7,000원
			<input type="hidden" id="aprice" value="7000">
		</td>
		<td class="count">
			<a href="#" class="minus">-</a>
			<span id="result">0</span>
			<!-- 성인 수량 -->
			<input type="hidden" id="amount1" value="">
			<a href="#" class="plus">+</a>
		</td>
		<td class="totalcost"></td>
	</tr>
	<tr class="num">
	<th>어린이</th>
		<td>3,000원
			<input type="hidden" id="cprice" value="3000">			
		</td>
		<td class="count">
			<a href="#" class="minus2">-</a>
			<span id="result2">0</span>
			<!-- 어린이 수량 -->
			<input type="hidden" id="amount2" value="">
			<a href="#" class="plus2">+</a>
		</td>
		<td class="totalcost2"></td>
	</tr>
	</table>
	</div>
	<hr>
	
<!-----------주문정보------------------------------------------------------------------>
	
	<div>
	<table>
	<!-- 예매정보 -->
	<tr>
		<th colspan="3" style="text-align:left">선택내역</th>
	</tr>
	<tr>
		<td>합계</td>
		<td class="totalprice"></td>
		<td>원</td>
	</tr>
	<!-- 예매자정보 -->
	<tr>
		<th colspan="2" style="text-align:left">예매자정보</th>
	</tr>
	<tr>
		<td>예매자</td>
		<td><input type="text" name="name" id="name" value="문지오"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="tel" id="tel" value="010-7554-5626"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" id="email" value="wldh0906@naver.com"></td>
	</tr>
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
	<tr>
    <td>
        <input type="submit" value="결제하기"/>
    </td>
	</tr>
	</table>
	</div>
	</form>
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
		
		document.getElementById("amount1").value=i;
	})
	
	console.log(cnt);

	minus.addEventListener("click", () => {
		if(i>0){
			i--;
			result.textContent=i;
			let totalcostNum=i*aprice;
			totalcost.textContent=totalcostNum.toLocaleString()+"원";
			
			total-=aprice;
			totalprice.textContent=total.toLocaleString();
			
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
			
			document.getElementById("amount2").value=j;
			
		}else{
			totalcost2.textContent=0+"원";
		}
		
	})
</script>

<!-- 본문 끝 -->
   	
   	
<%@ include file="../footer.jsp" %>