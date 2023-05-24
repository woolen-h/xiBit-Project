<%@page import="net.zzim.ZzimDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">
	<div class="info_content">
		<div class="my_list">
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
		<!-- my_list end -->
		<div class="my_container">
			<%
			if (s_mid.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")) {
				out.print("로그인 해주세요");
			%>

			<%
			} else {
			dtoM = daoM.read(s_mid);
			%>
			<table class="info_tb">
				<!--------------------개인정보--------------------->
				<tr>
					<th style="font-size: 30px;" colspan="2"><%=dtoM.getMname()%></th>
					<!-- 이름 -->
				</tr>
				<tr>
					<td><%=dtoM.getEmail()%></td>
					<!-- 이메일 -->
					<td><%=dtoM.getTel()%></td>
					<!-- 이메일 -->
				</tr>
			</table>
			<!--------------------예매내역--------------------->
			<div class="my_flex">
			<h1 class="my_exh_title">예매내역</h1>
			<button onclick="location.href='myFavoriteList.jsp';" class="my_exh_more_btn">더보기+</button>
			</div>
			<div class=scroll_9_139>
				<div class="my_component">
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
					<div class="component_1_121_35">
						<img class="img" src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dtoE.getFilename()%>">
						<div class=frame_8_i121_35_9_93>
							<span class="my_title"><a href="../exhibit/exhibitRead.jsp?excode=<%=dtoE.getExcode()%>"><%=dtoE.getExname()%></a></span>
							<div class="ex_durate">
								<%=dtoE.getExstart().substring(0, 11)%>
								~
								<%=dtoE.getExend().substring(0, 11)%>
							</div>
						</div>
						</div>
				<%
					}
				}
				%>
				</div>
				</div>
			<!------------------즐겨찾기-------------------->
			<div class="my_flex">
			<h1 class="my_exh_title">즐겨찾기 전시</h1>
			<button onclick="location.href='myFavoriteList.jsp';" class="my_exh_more_btn">더보기+</button>
			</div>
			<%
			ArrayList<ZzimDTO> listz = daoZ.list(s_mid);

			if (listz == null) {
				out.print("<tr>");
				out.println("<td colspan='3'>즐겨찾기 및 좋아요 내역이 없습니다.</td>");
				out.print("</tr>");
			} else {
			%>

			<div class=scroll_9_139>
				<div class="my_component">

					<%
					for (int i = 0; i < listz.size(); i++) {
						dtoZ = listz.get(i);
						int excode = dtoZ.getExcode();
						dtoE = daoE.read(excode);
						if (i % 5 == 0 && i != 0) {
					%>
				</div>
				<!-- component_8_121_36 end -->
				<div class="my_component">
					<%
					} // if end
					%>
					<div class="component_1_121_35">
						<img class="img" src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dtoE.getFilename()%>">

						<div class=frame_8_i121_35_9_93>
							<span class="my_title"><a href="../exhibit/exhibitRead.jsp?excode=<%=dtoE.getExcode()%>"><%=dtoE.getExname()%></a></span>
							<div class="ex_durate">
								<%=dtoE.getExstart().substring(0, 11)%>
								~
								<%=dtoE.getExend().substring(0, 11)%>
							</div>
						</div>
					</div>
					<%
							} // for end
						} // if end
					} // if end
					%>
				</div>
			</div>
		</div>
</div>
</div>
<%@ include file="../footer.jsp"%>