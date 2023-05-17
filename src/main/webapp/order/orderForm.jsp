<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Date" %>

<%@page import="java.text.SimpleDateFormat" %>    


<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp" %>


<div class="content">
<!-- 주문서 -->

<%
	dtoM=daoM.selectinfo(s_mid);

	String excode = request.getParameter("excode").trim();
	dtoE=daoE.read(excode);
	if(dtoE==null){
		out.print("글 없음");
	}else{
%>
	<div> <!-- 왼쪽 -->
	<table>
	<tr>
		<th width="30%">사진</th>
		<td><img src="../storage/<%=dtoE.getFilename()%>"></td>
	</tr>
	<tr>
		<th>전시명</th>
		<td><%=dtoE.getExname()%></td>
	</tr>
	<tr>
		<th>전시장소</th>
		<td><%=dtoE.getExplace()%></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
<%
	//특수문자 및 엔터 그대로 받을수 있게 문자 치환하기
	String content = Utility.convertChar(dtoE.getContents());
	out.print(content);
%>
		</td>
	</tr>
	<tr>
		<th>작가</th>
		<td><%=dtoE.getAuthor()%></td>
	</tr>
	<tr>
		<th>전시기간</th>
		<td><%=dtoE.getExstart()%> ~ <%=dtoE.getExend()%></td>
	</tr>
	<tr>
		<th>작품수</th>
		<td><%=dtoE.getExcnt()%></td>
	</tr>
	<tr>
		<th>문의번호</th>
		<td><%=dtoE.getTel()%></td>
	</tr>
	</table>
	</div>
	
	<div> <!-- 오른쪽 -->
	<form name="ordfrm" id="ordfrm" action="orderProc.jsp" onsubmit="return orderCheck()" >
	<input type="hidden" name="id" id="id" value="s_id">
	<input type="hidden" name="excode" id="excode" value="<%=dtoE.getExcode() %>">	
	
<%
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
	String today = sf.format(now); //오늘날짜
%>
	<input type="hidden" name="ordernum" id="ordernum" value="today">
	
	
	
	<div><!-- 날짜, 금액, 나이 선택 -->
		<div>
			<p>성인(만 19세 이상)</p>
			<%=dtoE.getPrice()%>
			<div><!-- 버튼 증가 감소 --></div>
		</div>
		<div>
			<p>성인(만 19세 이상)</p>
			<%=dtoE.getPrice()%>
			<div><!-- 버튼 증가 감소 --></div>
		</div>
	</div>
	<div><!-- 총매수, 금액 -->
		<h3>선택내역</h3>
		<div>
			<div>
				<span>기본요금</span>
				<!-- 선택한 나이, 매수 -->
				<!-- 선택금액 -->
			</div>
			<div>
				<span>합계</span>
				<span><!-- 총 금액 --></span>
				<input type="hidden" name="price" id="price">
			</div>
		</div>
	</div>
	<div><!-- 예매자정보 -->
		<h3>예매자 정보</h3>
		<table>
			<tr>
				<th>예매자</th>
				<td><input type="text" name="name" id="name" value="<%=dtoM.getMname() %>" ></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="tel" id="tel" value="<%=dtoM.getTel() %>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" value="<%=dtoM.getEmail() %>"></td>
			</tr>
			<tr>
				<th>예매내용</th>
				<td><p></p></td>
			</tr>
		</table>
	</div>
	<div><!-- 취소/환불 규정 -->
		<h3>취소/환불 규정</h3>
		<table>
			<tr>
				<td>이용 1일 전까지</td>
				<td>결제금액에 대한 취소 수수료 없음</td>
			</tr>
			<tr>
				<td>이용 당일</td>
				<td>취소 불가</td>
			</tr>
		</table>
		<p>구매하신 티켓을 취소하실 경우, 구매 시점에 판매 중인 티켓 가격으로만 재구매 가능합니다.</p>
	</div>
	<div>예약 서비스 이용을 위한 개인정보 수집 및 제3자 제공, 취소/환불 규정을 확인하였으며 이에 동의합니다.</div>
	<input type="submit" value="예매하기"/>
	</form>
	</div>
<%			
	}
%>
<!-- 본문 끝 -->
</div>
   	
   	
<%@ include file="../footer.jsp" %>