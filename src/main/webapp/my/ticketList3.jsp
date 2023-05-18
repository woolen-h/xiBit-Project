<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<div class="content">
<!-- 관람완료 -->
<nav><!-- side -->
	<ul>
		<li><a href="myList.jsp">홈</a></li>
		<li><a href="ticketList.jsp">예약내역</a></li>
		<li><a href="pwCheck.jsp">개인정보수정</a></li>
		<li><a href="memberlevel.jsp">회원등급</a></li>
		<li><a href="myFavoriteList.jsp">즐겨찾기·좋아요</a></li>
	</ul>
</nav>	

<section>
<div><h3>예약내역</h3></div> <!-- head -->
<div><!-- 예약내역 -->
	<div><!-- 관람정보 -->
		<ul>
			<li><a href="ticketList.jsp">관람예정</a></li>
			<li><a href="ticketList2.jsp">취소/환불0건</a></li>
			<li><a href="ticketList3.jsp">관람완료</a></li>
		</ul>
	</div>
	<div>
		<select>
			<option value="1">최근 예매순</option>
			<option value="2">최근 전시순</option>
		</select>
	</div>
	<div><!-- 예매내역 -->
		<div>
<%-- <%
	int recordPerPage=2;

	ArrayList<OrderDTO> list=dao.list(nowPage, recordPerPage, s_id);
	//오늘날짜 > 예약날짜 
	
	if(list==null){
		out.println("<div>예매하신 내역이 없습니다.</div>");
	}else{
		for(int i=0; i<list.size(); i++){
			dto=list.get(i);		
%> --%>
			<div>
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
				<div>
					<a href="ticketRead.jsp">상세/변경/취소</a>
				</div>
				</div> 
			</ul>
			</div>
	</div>
</div>
</section>
</div>
<!-- 본문 끝 -->