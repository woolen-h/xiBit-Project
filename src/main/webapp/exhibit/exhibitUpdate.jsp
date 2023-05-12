<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibitUpdate.jsp -->
		<h3> * 전시 수정하기 * </h3>
		<p><a href="exhibitRead.jsp?excode=<%=dto.getExcode()%>">[돌아가기]</a></p>
<%
		String excode = request.getParameter("excode");
		dto = dao.read(excode);
		if(dto==null){
			out.println("글 없음");
		}else{
%>
			<form method="post" action="exhibitUpdateProc.jsp" enctype="multipart/form-data">
			<input type="hidden" name="excode" value="<%=excode%>" readonly>
			<table>
			<tr>
			    <th>전시코드</th>
			    <td style="text-align: left">
			    	<input type="text" name="excode" id="excode" size="10" maxlength="10" value="<%=dto.getExcode()%>" required autofocus readonly>
			    </td>
			    <th>전시장코드</th> <!-- select로 하면 편할듯..!  -->
			    <td style="text-align: left">
			    	<input type="text" name="bcode" id="bcode" size="10" maxlength="10" value="<%=dto.getBcode()%>" required>
			    </td>
			</tr>
			<tr>
			    <th>전시장소</th>
			    <td style="text-align: left">
			    	<input type="text" name="explace" id="explace" size="10" maxlength="10" value="<%=dto.getExplace()%>" required>
			    </td>
			</tr>
			<tr>
			    <th>전시명</th>
			    <td style="text-align: left">
			    	<input type="text" name="exname" id="exname" size="15" maxlength="50" value="<%=dto.getExname()%>" required>
			    </td>
			</tr>
			<tr>
			    <th>작가</th>
			    <td style="text-align: left">
			    	<input type="text" name="author" id="author" size="15" maxlength="50" value="<%=dto.getAuthor()%>" required>
			    </td>
			</tr>
			<tr>
			    <th>전시 기한</th> <!-- 달력 select로 넣으면 편할까? -->
			    <td style="text-align: left">
			    	<input type="text" name="exstart" id="exstart" size="10" maxlength="20" value="<%=dto.getExstart()%>" required> - <input type="text" name="exend" id="exend" size="10" maxlength="20" value="<%=dto.getExend()%>" required>
			    </td>
			</tr>
			<tr>
			    <th>작품 수</th>
			    <td style="text-align: left">
			    	<input type="text" name="excnt" id="excnt" size="5" maxlength="9999" value="<%=dto.getExcnt()%>" required>
			    </td>
			</tr>
			<tr>
			    <th>예매가</th>
			    <td style="text-align: left">
			    	<input type="text" name="price" id="price" size="10" value="<%=dto.getPrice()%>" required>
			    </td>
			</tr>
			<tr>
			    <th>문의번호</th>
			    <td style="text-align: left">
			    	<input type="text" name="tel" id="tel" size="14" value="<%=dto.getTel()%>" required>
			    </td>
			</tr>
			<tr>
			    <th>작품설명</th>
			    <td style="text-align: left">
			    	<textarea rows="5" cols="30" name="contents" id="contents" ><%=dto.getContents()%> </textarea>
			    </td>
			</tr>
			<tr>
			    <th>첨부파일</th>
			    <td style="text-align: left">
			    	<input type="file" name="filename" id="filename" value="<%=dto.getFilename()%>">
			    </td>
			</tr>
			<tr>
			    <td colspan="2">
			    	<input type="submit" value="수정">
			    	<input type="reset" value="취소">
			    </td>
			</tr>
			</table>
			</form>
<%
		}
%>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>