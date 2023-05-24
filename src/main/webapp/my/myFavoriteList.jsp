<%@page import="net.zzim.ZzimDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<br>
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
			<table class="info_tb">
				<tr>
					<th width="20%">포스터</th>
					<th>제목</th>
					<th width="50%">전시일정</th>
				</tr>
				<tr>

					<%
					ArrayList<ZzimDTO> list = daoZ.list(s_mid);

					if (list == null) {
						out.print("<tr>");
						out.println("<td colspan='3'>즐겨찾기 및 좋아요 내역이 없습니다.</td>");
						out.print("</tr>");
					} else {

						for (int i = 0; i < list.size(); i++) {
							dtoZ = list.get(i);
							int excode = dtoZ.getExcode();
							dtoE = daoE.read(excode);
					%>

					<td><img width="10%" src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dtoE.getFilename()%>"></td>
					<td><%=dtoE.getExname()%></td>
					<td><%=dtoE.getExstart().substring(0,11)%> ~ <%=dtoE.getExend().substring(0,11)%></td>
				</tr>
				<%
				} // for end
				} // if end
				%>
			</table>

		</div>
	</div>
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>