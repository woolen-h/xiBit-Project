<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="auth.jsp" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<div class="content">
<%
	//dto=dao.selectinfo(s_id);
%>
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
<h3>나의 페이지</h3> <!-- head -->
<div><!-- 개인정보 -->
	<div><!-- 개인정보 -->
		<p><%-- <%=dto.getMname() %> --%></p>
		<p><%-- <%=dto.getEmail() %> --%></p>
		<ul>
		<li><a href="pwCheck.jsp">개인정보수정</a></li>
		<li><a>회원탈퇴</a></li>
		<li><a>회원등급</a></li>
		</ul>
	</div>
	<div><!-- 예매 -->
		<div>
			<h4>최근예매</h4>
			<button>더보기+</button>
		</div>
		<div>
			<div>예매하신 내역이 없습니다.</div>
		</div>
	</div>
	<div><!-- 즐겨찾기 -->
		<div>
			<h4>즐겨찾기 전시</h4>
			<button>더보기+</button>
		</div>
		<div>
			<ul>
				<li>즐겨찾기</li>
				<li>좋아요</li>
			</ul>
		</div>
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
					<td colspan="3">즐겨찾기 및 좋아요 내역이 없습니다.</td>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
</div>
</section>
</div>

<%@ include file="../footer.jsp" %>