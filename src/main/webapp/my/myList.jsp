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
		<li><a href="myFavoriteList.jsp">즐겨찾기</a></li>
	</ul>
</nav>
<%
	dtoM=daoM.read(s_mid);
%>
<div>
<h3>나의 페이지</h3>
<!----------개인정보----------->
<hr>
<div>
	<table>
	<tr>
		<th><%=dtoM.getMname() %></th><!-- 이름 -->
	</tr>
	<tr>
		<th><%=dtoM.getEmail() %></th><!-- 이메일 -->
	</tr>
	<tr>
		<td><a href="pwCheck.jsp">개인정보수정</a></td>
		<td><a href="../member/memberWithdraw.jsp">회원탈퇴</a></td>
	</tr>
	<tr>
		<th>회원등급</th>
		<td><%=dtoM.getMlevel() %></td>
	</tr>
	</table>
<hr>
	<table>
	<tr>
		<th>예매내역</th>
		<td><button onclick="location.href='ticketList.jsp';">더보기+</button></td>
	</tr>
<%
		ArrayList<OrderDTO> list=dao.list(s_mid);
		if(list==null){
			out.println("예매하신 내역이 없습니다.");
		}else{
			for(int i=0; i<list.size(); i++){
				dto=list.get(i);
				dtoE=daoE.read(dto.getExcode());	
%>
	<tr>
		<th width="30%">사진</th>
		<td><img src="../storage/<%=dtoE.getFilename()%>"></td>
	</tr>
	<tr>
		<th>전시명</th>
		<td><a href="ticketRead.jsp?ordernum=<%=dto.getOrdernum()%>"><%=dtoE.getExname()%></a></td>
	</tr>
	<tr>
		<th>관람 예정일로부터 D-</th>
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

<%
			}
		}
%>
	</div>
	<hr>
<!------------------즐겨찾기-------------------->	
	<div>
	<table>
		<tr>
			<th>즐겨찾기 전시</th>
			<td><button>더보기+</button></td>
		</tr>
		<tr>
			<td>즐겨찾기</td>
		</tr>
		<tr>
			<th>구분</th>
			<th>제목</th>
			<th>등록날짜</th>
		</tr>
		<tr>
			<td colspan="3">즐겨찾기 및 좋아요 내역이 없습니다.</td>
		</tr>
	</table>
	</div>
</div>
</div>
<%@ include file="../footer.jsp" %>