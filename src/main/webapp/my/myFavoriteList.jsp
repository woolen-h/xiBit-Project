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
<%--
	찜 db 가져오기
--%>
	<table class="info_tb">
<!--------------------즐겨찾기목록--------------------->
		<tr>
<%--
		ArrayList<OrderDTO> list=dao.list(s_mid);
		int excode=dto.getExcode();
		if(list==null){
			out.println("<td colspan="3">즐겨찾기 및 좋아요 내역이 없습니다.</td>");
		}else{
			for(int i=0; i<list.size(); i++){
				dto=list.get(i);
				dtoE=daoE.read(excode);	
--%>
			<th colspan="2">즐겨찾기 전시</th>
			<td><button>더보기+</button></td>
		</tr>
		<tr>
			<th>구분</th>
			<th>제목</th>
			<th>등록날짜</th>
		</tr>
	</table>
	</div>
</div>
</div>
<!-- 본문 끝 -->