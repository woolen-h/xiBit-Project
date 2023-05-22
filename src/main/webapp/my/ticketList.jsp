<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 예약내역 -->
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
<%
	dto=dao.read(s_mid);
%>
	<table class="info_tb">
<!--------------------예매내역--------------------->
		<tr>
			<th>예매내역</th>	
		</tr>
		<tr>
			<th width="30%">포스터</th>
			<th>전시명</th>
			<th>관람장소</th>
<%
		ArrayList<OrderDTO> list=dao.list(s_mid);
		
		if(list==null){
			out.println("<td>예매하신 내역이 없습니다.</td>");
		}else{
			for(int i=0; i<list.size(); i++){
				dto=list.get(i);
				int excode=dto.getExcode();
				dtoE=daoE.read(excode);	
%>
		<tr>
			<td><img src="../storage/<%=dtoE.getFilename()%>"></td>
			<td><a href="ticketRead.jsp?ordernum=<%=dto.getOrdernum()%>"><%=dtoE.getExname()%></a></td>
			<td><%if(dtoE.getBcode().equals("Seo")){out.print("서울");}else
				  if(dtoE.getBcode().equals("Gwa")){out.print("과천");}else
				  if(dtoE.getBcode().equals("Deok")){out.print("덕수궁");}else
			      if(dtoE.getBcode().equals("Cheong")){out.print("청주");}else
			      if(dtoE.getBcode().equals("Kid")){out.print("어린이박물관");}%></td>
		</tr>
	
<%
			}
		}
%>
	</table>
	</div>
</div>
</div>
<!-- 본문 끝 -->