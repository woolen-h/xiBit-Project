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
<%
	if(s_mid.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")) {
		out.print("로그인 해주세요");
%>		

<%
	}else{
		dtoM=daoM.read(s_mid);
%>
	<table class="info_tb">
<!--------------------개인정보--------------------->
		<tr>
			<th style="font-size:30px;" colspan="2"><%=dtoM.getMname() %></th><!-- 이름 -->
		</tr>
		<tr>
			<td><%=dtoM.getEmail() %></td><!-- 이메일 -->
			<td><%=dtoM.getTel() %></td><!-- 이메일 -->
		</tr>
	</table>
<!--------------------예매내역--------------------->	
	<table class="info_tb">
		<tr>
			<th colspan="2">예매내역</th>
			<td><button onclick="location.href='ticketList.jsp';">더보기+</button></td>
		</tr>
		<tr>
			<th width="30%">포스터</th>
			<th>전시명</th>
			<th>관람장소</th>
		</tr>
		<tr>
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
<!------------------즐겨찾기-------------------->	
	<table class="info_tb">
		<tr>
			<th colspan="2">즐겨찾기 전시</th>
			<td><button>더보기+</button></td>
		</tr>
		<tr>
			<th>구분</th>
			<th>제목</th>
			<th>등록날짜</th>
		</tr>
		<tr>
			<td colspan="3">즐겨찾기 및 좋아요 내역이 없습니다.</td>
		</tr>
	
<%
	}
%>
	</table>
	</div>
</div>
</div>
<%@ include file="../footer.jsp" %>