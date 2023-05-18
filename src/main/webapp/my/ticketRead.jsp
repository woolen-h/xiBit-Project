<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<div class="content">
<!-- 예매상세 -->
<nav><!-- side -->
	<ul>
		<li><a href="myList.jsp">홈</a></li>
		<li><a href="ticketList.jsp.jsp">예약내역</a></li>
		<li><a href="pwCheck.jsp">개인정보수정</a></li>
		<li><a href="memberlevel.jsp">회원등급</a></li>
		<li><a href="myFavoriteList.jsp">즐겨찾기·좋아요</a></li>
	</ul>
</nav>	

<section>
<div><h3>전시예매내역</h3></div> <!-- head -->
<div><!-- 상세내역 -->
<%-- <%
	dto=dao.read(s_id);
	if(list==null){
		out.println("<div>예매내역 불러오기 실패.</div>");
	}else{
		for(int i=0; i<list.size(); i++){
			dto=list.get(i);		
%> --%>
		<div>
			<div><!-- 맨위 -->
				<ul>
					<div><img><!-- 포스터 --></div> <!-- 왼쪽 -->
					<div>					      <!-- 오른쪽 -->
						<div>
							<span>예매번호</span>
							<p><!-- 예매번호 --></p>
						</div>
					<p><!-- 전시회제목 --></p>	
					<ul>
						<li><span>관람일시</span><!-- 관람일시 --></li>
						<li><span>관람인원</span><!-- 가격+관람인원 --></li>
						<li><span>관람장소</span><!-- 전시장 --></li>
					</ul>
					</div> 
				</ul>
			</div>
			<div><!-- 예매정보 -->
				<h3>예매정보</h3>
				<ul>
					<li><strong>예매자</strong><div><!-- 이름 --></div></li>
					<li><strong>휴대폰</strong><div><!-- 휴대폰 --></div></li>
					<li><strong>예매일시</strong><div><!-- 예매일시 --></div></li>
					<li><strong>예매상태</strong><div><!-- 관람상태 --></div></li>
				</ul>
			</div>
			<div><!-- 결제정보 -->
				<h3>결제정보</h3>
				<ul>
					<li><strong>티켓금액</strong><div><!-- 금액 --></div></li>
					<li><strong>티켓매수</strong><div><!-- 매수 --></div></li>
					<li><strong>총 결제금액 <span><!-- 총금액 -->원</span></strong>
				</ul>
			</div>
			<div><!-- 유의사항 -->
				<div>취소 마감시간 및 유의사항</div>
				<dl>
					<dt>취소 마감 시간 : <!-- ex)2023.5.18. 17:50 --> 까지
						<span>(취소 마감시간 이후에는 취소가 불가합니다.)</span>
					</dt>
					<dd>・이용회차 입장시간 10분 전까지 취소시 100% 환불</dd>
					<dd>・이용회차 입장 마감시간 이후 취소/환불 불가</dd>
					<dd>・방문이 힘드신 경우&nbsp;타인을 배려하기 위해&nbsp;반드시 예약 취소 부탁드립니다.</dd>
				</dl>
			</div>
			<div><!-- 버튼 -->
			<form method="post" action="ticketList.jsp" onsubmit="return delCheck()">
				<button type="submit">예매취소</button>
				<button type="button" onclick="location.href='ticketList.jsp'">예매목록</button>
			</form>
			</div>
	</div>
</div>
</section>
</div>
<script>
function delCheck(){
    let message="쿠폰 등 기타결제 수단의 사용기한이 지난 경우 복원되지 않습니다.\n취소하기 전 사용기간을 꼭 확인하세요.\n\n예매를 취소하시겠습니까?";
    if(confirm(message)){ //확인true, 취소false
		return true;
	}else{
		return false;
	}
}
</script>


<!-- 본문 끝 -->