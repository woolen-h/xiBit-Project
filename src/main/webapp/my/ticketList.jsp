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
		<div style="padding-bottom:30px; border-bottom: solid 1px black;">
		<h1 style="font-size:32px;">전시예매내역</h1>
		</div>
		<div style="margin:15px;">
		<button>관람예정</button>
		<button>취소/환불</button>
		<button>관람완료</button>
		</div>
		<hr>
<!--------------------------------------------------->
		<div class="my_container">		
		<ul>
					<%
					ArrayList<OrderDTO> list = dao.list(s_mid);

					if (list == null) {
						out.println("<td>예매하신 내역이 없습니다.</td>");
					} else {
						for (int i = 0; i < list.size(); i++) {
							dto = list.get(i);
							int excode = dto.getExcode();
							dtoE = daoE.read(excode);
					%>
					<li style="display:flex; margin-left:50px;padding:50px; border-bottom:1px solid grey;">
					<div style="width:28%; margin:15px;">
						<img class="myimg" src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dtoE.getFilename()%>">
					</div>
					<div style="width:60%;  margin-top:20px; margin-left:60px;">
					<div style="margin-top:20px;">
						<p style="font-weight:bold; font-size:13px; margin:30px;">관람예정일로부터 일 <br><br>남았습니다.</p>
						<p style="font-weight:bold; font-size:20px; margin:30px;"><a href="ticketRead.jsp?ordernum=<%=dto.getOrdernum()%>"><%=dtoE.getExname()%></a></p>
						<ul style="font-size:12px; margin:30px;">
							<li style="padding-bottom:8px;">관람일시<span style="margin:30px; "><%=dto.getSdate() %></span></li>
							<li style="padding-bottom:8px;">관람인원<span style="margin:30px;"><%=dto.getAmount() %></span></li>
							<li style="padding-bottom:8px;">관람장소<span style="margin:30px;"><%if(dtoE.getBcode().equals("Seo")){out.print("서울");}else
																							   if(dtoE.getBcode().equals("Gwa")){out.print("과천");}else
																							   if(dtoE.getBcode().equals("Deok")){out.print("덕수궁");}else
																						       if(dtoE.getBcode().equals("Cheong")){out.print("청주");}else
																			       if(dtoE.getBcode().equals("Kid")){out.print("어린이박물관");}%></span></li>
						</ul>
					</div>
					</div>
					</li>
				<%
					}
				}
				%>
				</ul>
		</div>

	</div>
</div>
</div>
<!-- 본문 끝 -->