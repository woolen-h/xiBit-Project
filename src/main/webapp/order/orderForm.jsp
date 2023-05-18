<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>    

<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp" %>

<div class="content">
<form name="ordfrm" id="ordfrm" action="orderProc.jsp" >
<input type="hidden" name="mid" id="mid" value="s_id">

<!-- 주문서번호 생성 -->
<!-- <input type="hidden" name="ordernum" id="ordernum" value=""> -->
	
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

<!-----------금액정보------------------------------------------------------------------>
	<div>
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
	<input type="submit" value="결제하기">
	</form>
	</div>
   	
<!----------------------------------------------------------------------------->  
	
<script>
	let plus = document.querySelector(".plus");
	let minus=document.querySelector(".minus");
	let result=document.querySelector("#result");
	let totalcost=document.querySelector(".totalcost");
	let totalprice=document.querySelector(".totalprice");
	
	let total=0;
	let i=0;

	plus.addEventListener("click", () => {
		i++;
		result.textContent=i;
		let totalcostNum=i*7000;
		totalcost.textContent=totalcostNum.toLocaleString()+"원";
		
		total+=7000;
		totalprice.textContent=total.toLocaleString();
	})

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
</script>
<%			
	}
%>
<!-- 본문 끝 -->
   	
   	
<%@ include file="../footer.jsp" %>