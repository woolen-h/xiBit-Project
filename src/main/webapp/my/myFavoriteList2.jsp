<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="ssizzim.jsp" %>
<%@ include file="../header.jsp" %>

<div class="content">

<nav><!-- side -->
	<ul>
		<li><a href="myList.jsp">홈</a></li>
		<li><a href="ticketList.jsp">예약내역</a></li>
		<li><a href="pwCheck.jsp">개인정보수정</a></li>
		<li><a href="memberlevel.jsp">회원등급</a></li>
		<li><a href="myFavoriteList2.jsp">즐겨찾기·좋아요</a></li>
	</ul>
</nav>	

<%
	String mid = request.getParameter("mid");

	zzimDAO zzimDAO = new zzimDAO();
	ArrayList<ExhibitDTO> list = dao.list(mid);
	
	if (list == null) {
		out.print("<tr>");
		out.print("<td colspan='3'>글 없음</td>");
		out.print("</tr>");
		out.print("</table>");
	} else {
	for(int i=0; i<list.size(); i++){	

	
	

	%>



	



<section>
<div><h3>즐겨찾기·좋아요</h3></div> <!-- head -->
<div>
	<div><!-- 카테고리 -->
		<ul>
		<li><a>즐겨찾기</a></li>
		<li><a>좋아요</a></li>
		</ul>
	</div>
	<div><!-- 즐겨찾기 -->
		<div>
			<table border="1">
			<thead>
				<tr>
					<th>구분</th>
					<th>제목</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					
					<td><%= list.get(i).getExname() %></td>
	
					
				
				</tr>
			</tbody>
			</table>
		</div>
	</div>
	<div><!-- 좋아요 -->
		<div>
			<table border="1">
			<thead>
				<tr>
					<th>구분</th>
					<th>제목</th>
					<th>등록날짜</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">즐겨찾기 및 좋아요 내역이 없습니다.</td>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
</div>
</section>
	
	<%
	}}
	%>
</div>
<!-- 본문 끝 -->