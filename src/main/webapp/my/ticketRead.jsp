<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>


<div class="in_content">
	<div class="info_content">
		<div class="info_tb_list">
		<ul>
			<li class="fa_qna"><a>마이페이지</a></li>
		</ul>
		<ul>
			<li class="info_qna_h"><a href="myList.jsp">홈</a></li>
			<li class="info_qna_h"><a href="ticketList.jsp">예약내역</a></li>
			<li class="info_qna_h">개인정보</li>
			<li class="info_qna_d"><a href="pwCheck.jsp">개인정보수정</a></li>
			<li class="info_qna_d"><a href="../member/memberWithdraw.jsp">회원탈퇴</a></li>
			<li class="info_qna_h"><a href="myFavoriteList.jsp">즐겨찾기</a></li>
		</ul>
		</div>
	<div class="info_tb_container">
<!-- 예매상세 -->
<%
	String ordernum = request.getParameter("ordernum");
	dto=dao.read(ordernum);
	
	if(dto==null){
		out.println("<div>예매내역 불러오기 실패.</div>");
	}else{
		dtoM=daoM.read(s_mid);
		dtoE=daoE.read(dto.getExcode());
%>
	
	<table class="info_tb">
	<tr>
		<th colspan="2">전시정보</th>
	</tr>
	<tr>
		<td colspan="2"><img src="../storage/<%=dtoE.getFilename()%>"></td>
	</tr>
	<tr>
		<th>예매번호</th>
		<td><%=dto.getOrdernum() %></td>
	</tr>
	<tr>
		<th>전시명</th>
		<td><%=dtoE.getExname()%></td>
	</tr>
	<tr>
		<th>관람일시</th>
		<td><%=dto.getSdate() %></td>
	</tr>
	<tr>
		<th>관람인원</th>
		<td><%=dto.getAmount() %></td>
	</tr>
	<tr>
		<th>관람장소</th>
		<td><%if(dtoE.getBcode().equals("Seo")){out.print("서울");}else
			  if(dtoE.getBcode().equals("Gwa")){out.print("과천");}else
			  if(dtoE.getBcode().equals("Deok")){out.print("덕수궁");}else
		      if(dtoE.getBcode().equals("Cheong")){out.print("청주");}else
		      if(dtoE.getBcode().equals("Kid")){out.print("어린이박물관");}%></td>
	</tr>
	</table>
<!------------------예매정보------------------>
	<table class="info_tb">
	<tr>
		<th  colspan="2">예매정보</th>
	</tr>
	<tr>
		<th>예매자</th>
		<td><%=dtoM.getMname() %></td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td><%=dtoM.getTel() %></td>
	</tr>
	<!-- 
	<tr>
		<th>예매일시</th>
		<td></td>
	</tr>
	-->
	</table>
<!------------------결제정보------------------>	
	<table class="info_tb">
	<tr>
		<th  colspan="2">결제정보</th>
	</tr>
	<tr>
		<th>티켓금액</th>
		<td><%=dtoE.getPrice() %></td>
	</tr>
	<tr>
		<th>티켓매수</th>
		<td><%=dto.getAmount() %></td>
	</tr>
	<tr>
		<th>총 결제금액</th>
		<td><%=dto.getPrice() %></td>
	</tr>
	</table>

<!------------------유의사항------------------>		
	<table class="info_tb">
	<tr>
		<th>취소 마감시간 및 유의사항</th>
	</tr>
	<tr>
		<th colspan="3">
			・이용 1일 전까지 결제금액에 대한 취소 수수료 없음<br>
			・이용 당일은 취소/환불 불가<br>
			・방문이 힘드신 경우&nbsp;타인을 배려하기 위해&nbsp;반드시 예약 취소 부탁드립니다.<br>
		</th>
	</tr>
	</table>
<!------------------버튼------------------>
	<form  method="post" action="../order/orderDelProc.jsp" onsubmit="return delCheck()">
		<input type="hidden" name="bbsno" value="<%=ordernum%>">
		<input type="submit" value="예매취소" >
		<input type="button" value="예매목록" onclick="location.href='ticketList.jsp'">
	</form>
	
<%
	}
%>
	</div>
</div>
</div>

<script>
function delCheck(){
    let message="예매를 취소하시겠습니까?";
    if(confirm(message)){ //확인true, 취소false
		return true;
	}else{
		return false;
	}
}
</script>


<!-- 본문 끝 -->