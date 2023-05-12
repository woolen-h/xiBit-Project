<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibitRead.jsp -->
		<h3> * 전시 상세보기 * </h3>
		<a href="exhibition_tab.jsp">[목록으로]</a>
		<a href="exhibitForm.jsp">[게시하기]</a>
		
<%
		String excode = request.getParameter("excode").trim();
		dto = dao.read(excode);
		if(dto==null){
			out.print("글 없음");
		}else{
%>
		<!-- 일단 게시판 형식으로 출력 -->
			<div>
			<table>
			<tr>
				<th width="30%">사진</th>
				<td><img src="../storage/<%=dto.getFilename()%>"></td>
			</tr>
			<tr>
				<th>전시코드</th>
				<td><%=dto.getExcode()%></td>
			</tr>
			<tr>
				<th>전시장소</th>
				<td><%=dto.getExplace()%></td>
			</tr>
			<tr>
				<th>전시명</th>
				<td><%=dto.getExname()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
<%
			//특수문자 및 엔터 그대로 받을수 있게 문자 치환하기
			String content = Utility.convertChar(dto.getContents());
			out.print(content);
%>
				</td>
			</tr>
			<tr>
				<th>작가</th>
				<td><%=dto.getAuthor()%></td>
			</tr>
			<tr>
				<th>전시기간</th>
				<td><%=dto.getExstart()%> ~ <%=dto.getExend()%></td>
			</tr>
			<tr>
				<th>작품수</th>
				<td><%=dto.getExcnt()%></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><%=dto.getPrice()%></td>
			</tr>
			<tr>
				<th>문의번호</th>
				<td><%=dto.getTel()%></td>
			</tr>
			</table>
			</div>
			<br>
			<input type="button" value="수정" onclick="location.href='exhibitUpdate.jsp?excode=<%=excode%>'">
			<input type="button" value="삭제" onclick="location.href='exhibitDel.jsp?excode=<%=excode%>'"> 
<%			
		}
%>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>