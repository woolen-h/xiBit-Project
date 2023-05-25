<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>


<div class="content">
	<div class="info_content">
		<div class="my_list">
			<ul>
				<li class="fa_qna"><a>마이페이지</a></li>
			</ul>
			<ul>
				<li class="info_qna_h"><a href="myList.jsp">홈</a></li>
				<li class="info_qna_h"><a href="ticketList.jsp">예매내역</a></li>
				<li class="info_qna_h">개인정보</li>
				<li class="info_qna_d"><a href="pwCheck.jsp">개인정보수정</a></li>
				<li class="info_qna_d"><a href="../member/memberWithdraw.jsp">회원탈퇴</a></li>
				<li class="info_qna_h"><a href="myFavoriteList.jsp">즐겨찾기</a></li>
			</ul>
		</div>
		<!-- my_list end -->
		<div class="my_container">
<!-- 예매상세 -->
		<div style="padding-bottom:30px; border-bottom: solid 2px black;">
		<h1 style="font-size:32px;">전시예매내역</h1>
		</div>
		<div>
		<%
			String ordernum = request.getParameter("ordernum").trim();
			dto=dao.read(ordernum);
			
			if(dto==null){
				out.println("<div>예매내역 불러오기 실패.</div>");
			}else{
				dtoM=daoM.read(s_mid);
				dtoE=daoE.read(dto.getExcode());
		%>
			
		
		<div style="width:30%; margin:30px; padding-left:3%; float:left;">
			<img class="myimg" src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dtoE.getFilename()%>">
		</div>
		<div style="width:60%; float:right; margin-top:30px;">
		<div style="margin-top:40px;">
			<div>
				<span style="font-size:20px; margin:30px;">예매번호</span><strong><%=dto.getOrdernum() %></strong>
			</div>
			<p style="font-weight:bold; font-size:26px; margin:30px;"><%=dtoE.getExname()%></p>
			<ul style="font-size:16px; margin:30px;">
				<li style="padding-bottom:15px;">관람일시<span style="margin:30px; "><%=dto.getSdate() %></span></li>
				<li style="padding-bottom:15px;">관람인원<span style="margin:30px;"><%=dto.getAmount() %></span></li>
				<li style="padding-bottom:15px;">관람장소<span style="margin:30px;"><%if(dtoE.getBcode().equals("Seo")){out.print("서울");}else
																				   if(dtoE.getBcode().equals("Gwa")){out.print("과천");}else
																				   if(dtoE.getBcode().equals("Deok")){out.print("덕수궁");}else
																			       if(dtoE.getBcode().equals("Cheong")){out.print("청주");}else
																			       if(dtoE.getBcode().equals("Kid")){out.print("어린이박물관");}%></span></li>
			</ul>
		</div>
		</div>
		</div>
<!------------------예매정보------------------>
		<div>
		<div style="padding-bottom:25px; border-bottom: solid 2px black; margin-top:10px;">
		<h1 style="font-size:26px;">예매정보</h1></div>
		<table class="info_tb">
		<tr>
			<th>예매자</th>
			<td><%=dtoM.getMname() %></td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td><%=dtoM.getTel() %></td>
		</tr>
		<tr>
			<th>예매일시</th>
			<td></td>
		</tr>
		<tr>
			<th>예매상태</th>
			<td>관람전/관람완료/취소</td>
		</tr>
		</table>
<!------------------결제정보------------------>	
		<div style="padding-bottom:25px; border-bottom: solid 2px black; margin-top:35px;">
		<h1 style="font-size:26px;">결제정보</h1></div>	
		<table class="info_tb">
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
		<div style="padding-bottom:25px; border-bottom: solid 2px black; margin-top:35px;">
		<h1 style="font-size:26px;">결제내역</h1></div>			
		<table class="info_tb">
		<tr>
		<td>
			<div style="margin-top:40px;">
			<p style="font-weight:bold; font-size:26px; margin:30px; color:red;">취소 마감시간 및 유의사항</p>
			<ul style="font-size:16px; margin:30px;">
				<li style="padding-bottom:15px;">이용 1일 전까지 결제금액에 대한 취소 수수료 없음</li>
				<li style="padding-bottom:15px;">이용 당일은 취소/환불 불가</li>
				<li style="padding-bottom:15px;">방문이 힘드신 경우&nbsp;타인을 배려하기 위해&nbsp;반드시 예약 취소 부탁드립니다.</li>
			</ul>
		</div>
		</td>
		
		</table>
<!------------------버튼------------------>
		<div style="margin-top:30px;">
		<form  method="post" action="../order/orderDelProc.jsp" onsubmit="return delCheck()">
			<input type="hidden" name="ordernum" value="<%=ordernum%>">
			<div style="float:left;"><input class="exh_list_btn1" type="submit" value="예매취소" ></div>
			<div style="float:right;"><input class="exh_list_btn2" type="button" value="예매목록" onclick="location.href='ticketList.jsp'"></div>
		</form>
		</div>		
		</div>
			

	
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