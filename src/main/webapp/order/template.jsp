<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
   	<div class="content">
	<form name="ordfrm" id="ordfrm" action="orderProc.jsp"  >
	<input type="hidden" name="excode" id="excode" value="1234">
	<input type="hidden" name="ordernum" id="ordernum" value="9876">
	<input type="hidden" name="mid" id="mid" value="itwill">
	
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
	<hr>
	
	<!----------------------------------------------------------------------------->
	
	<table>
	<tr class="num">
	<th>성인</th>
		<td>7000원</td>
		<td class="count">
			<a href="#" class="minus">-</a>
			<span id="result">0</span>
			<a href="#" class="plus">+</a>
		</td>
		<td class="totalcost"></td>
	</tr>
	<tr class="num">
	<th>어린이</th>
		<td>3000원</td>
		<td class="count">
			<a href="#" class="minus2">-</a>
			<span id="result2">0</span>
			<a href="#" class="plus2">+</a>
		</td>
		<td class="totalcost2"></td>
	</tr>
	</table>
	<hr>
	
	<!----------------------------------------------------------------------------->
	
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
	</form>
	</div>
   	
   	
   	<script>
	let plus = document.querySelector(".plus");
	let minus=document.querySelector(".minus");
	let result=document.querySelector("#result");
	let totalcost=document.querySelector(".totalcost");
	let totalprice=document.querySelector(".totalprice");
	
	let total=0;
	let i=0;

	let cnt=0;

	plus.addEventListener("click", () => {
		i++;
		result.textContent=i;
		let totalcostNum=i*7000;
		totalcost.textContent=totalcostNum.toLocaleString()+"원";
		
		total+=7000;
		totalprice.textContent=total.toLocaleString();

		console.log(i);
		
	})
	
	
	console.log(i);

	minus.addEventListener("click", () => {
		if(i>0){
			i--;
			result.textContent=i;
			let totalcostNum=i*7000;
			totalcost.textContent=totalcostNum.toLocaleString()+"원";
			

			total-=7000;
			
			totalprice.textContent=total.toLocaleString();
			
			
			
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
		let totalcostNum=j*3000;
		totalcost2.textContent=totalcostNum.toLocaleString()+"원";

		total+=3000;
		
		totalprice.textContent=total.toLocaleString();
		
	})

	minus2.addEventListener("click", () => {
		if(j>0){
			j--;
			result2.textContent=j;
			let totalcostNum=j*3000;
			totalcost2.textContent=totalcostNum.toLocaleString()+"원";

			total-=3000;			

			totalprice.textContent=total.toLocaleString();
			
		}else{
			totalcost2.textContent=0+"원";
		}
		
	})
	
	
	
	
	console.log(cnt);
	console.log(total.toLocaleString());
	
	
	
	
	</script>
   	
   	
   	
   	
<%@ include file="../footer.jsp" %>