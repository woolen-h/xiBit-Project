<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<div class="content">

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
<div><h3>회원등급</h3></div> <!-- head -->
<div>
	<div><!-- 등급 -->
		<div>
			<table border="1">
			<thead>
				<tr>
					<th>회원등급</th>
					<th>유효기간</th>
					<th>금액</th>
					<th>상태</th>
					<th>영수증출력</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5">데이터가 없습니다.</td>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
</div>
</section>
</div>
<!-- 본문 끝 -->