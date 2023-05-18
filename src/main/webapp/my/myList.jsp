<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
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
<%
	dtoM=daoM.read(s_mid);
%>
<section>
<h3>나의 페이지</h3> <!-- head -->
<hr>
<div><!-- 개인정보 -->
	<div><!-- 개인정보 -->
		<p><%-- 이름 --%><%=dtoM.getMname() %></p>
		<p><%-- 이메일 --%><%=dtoM.getEmail() %></p>
		<ul>
		<li><a href="pwCheck.jsp">개인정보수정</a></li>
		<li><a href="../member/memberWithdraw.jsp">회원탈퇴</a></li>
		<li><strong>회원등급</strong><p><%=dtoM.getMlevel() %></p></li>
		</ul>
	</div>
<hr>
	<div><!-- 예매 -->
		<div>
			<h4>최근예매</h4>
			<button onclick="location.href='ticketList.jsp';">더보기+</button>
		</div>
		<div>
<%
		ArrayList<OrderDTO> list=dao.list(s_mid);
		if(list==null){
			out.println("예매하신 내역이 없습니다.");
		}else{
			for(int i=0; i<list.size(); i++){
				dto=list.get(i);
				dtoE=daoE.read(dto.getExcode());	
%>
		<ul>
		<li> <!-- 예약 내역  -->
			<div>사진<%=dtoE.getFilename()%></div>
			<div>
				<p>관람 예정일로부터 D-<!-- 관람선택일 - 현재 날짜 --></p>
				<p><%=dtoE.getExname()%></p>
				<ul>
				<li><span>관람일시</span>
					<!-- 관람선택일 선택 시간 -->
				</li>
				<li><span>관람인원</span>
					<!-- 어린이, 성인, 어르신? -->
					<!--  -->
				</li>
				<li><span>관람장소</span>
					<p><%=dtoE.getExplace()%></p>
				</li>
				</ul>
				<!-- QR관람권 -->
<%
			}
		}
%>
			</div>
		</li>
		</ul>
		</div>
	</div>
	<hr>
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