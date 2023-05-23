<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>    
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  
<%@ include file="ssi.jsp" %>    
<%@ include file="ordheader.jsp" %>

 
  
<div class="content">
<form name="ordfrm" id="ordfrm" action="orderProc.jsp" >
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
	<div> <!-- 왼쪽 -->
	<table>
	<tr>
		<th>주문서번호</th>
		<td>
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
		        
		        document.write(year+ month + day + String(excode).padStart(4, '0'));
		        
		        document.getElementById("ordernum").value=year+ month + day + String(excode).padStart(4, '0');
		        
		        
		    }
		</script>
		</td>
	</tr>
	<tr>
		<th width="30%">사진</th>
		<td><img src="../storage/<%=dtoE.getFilename()%>"></td>
	</tr>
	<tr>
		<th>전시명</th>
		<td><%=dtoE.getExname()%></td>
	</tr>
	<tr>
		<th>전시장소</th>
		<td><%if(dtoE.getBcode().equals("Seo")){out.print("서울");}else
			  if(dtoE.getBcode().equals("Gwa")){out.print("과천");}else
			  if(dtoE.getBcode().equals("Deok")){out.print("덕수궁");}else
		      if(dtoE.getBcode().equals("Cheong")){out.print("청주");}else
		      if(dtoE.getBcode().equals("Kid")){out.print("어린이박물관");}%></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
<%
	//특수문자 및 엔터 그대로 받을수 있게 문자 치환하기
	String content = Utility.convertChar(dtoE.getContents());
	out.print(content);
%>
		</td>
	</tr>
	<tr>
		<th>작가</th>
		<td><%=dtoE.getAuthor()%></td>
	</tr>
	<tr>
		<th>전시기간</th>
		<td><%=dtoE.getExstart().substring(0,11)%> ~ <%=dtoE.getExend().substring(0,11)%></td>
	</tr>
	<tr>
		<th>작품수</th>
		<td><%=dtoE.getExcnt()%></td>
	</tr>
	<tr>
		<th>문의번호</th>
		<td><%=dtoE.getTel()%></td>
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

<!-----------금액정보------------------------------------------------------------------>
	<div>
<%
	int priceA=dtoE.getPrice();
	double priceC=priceA*0.5;
	int disprice=(int)priceC;
%>
	<table>
	<tr class="num">
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
		<td><input type="hidden" id="price" name="price" value=""></td>
		<td>원</td>
	</tr>
	<!-- 예매자정보 -->
	<tr>
		<th colspan="2" style="text-align:left">예매자정보</th>
	</tr>
	<tr>
		<td>예매자</td>
		<td><input type="text" name="name" id="name" value="<%=dtoM.getMname()%>"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="tel" id="tel" value="<%=dtoM.getTel()%>"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" id="email" value="<%=dtoM.getEmail()%>"></td>
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
	</table>
	</div>
	<div class="ord_sub_flex">
	<input type="submit" value="결제하기" class="ord_submit">
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
	let price=document.getElementById("price");
	
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
	
	console.log(cnt);

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
<%			
	}
%>
<!-- 본문 끝 -->
   	
   	
<%@ include file="../footer.jsp" %>