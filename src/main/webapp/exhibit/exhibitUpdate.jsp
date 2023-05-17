<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibitForm.jsp -->
		<h3> * 전시 수정하기 * </h3>
		<p><a href="exhibition_tab.jsp">[목록으로]</a></p>
<%
		int excode = Integer.parseInt(request.getParameter("excode"));
		dto = dao.read(excode);
		if(dto==null){
			out.println("글 없음");
		}else{
%>
			<form method="post" action="exhibitUpdateProc.jsp" enctype="multipart/form-data">
			<input type="hidden" name="excode" value="<%=excode%>">
			<table>
			<tr>
			    <th>전시장코드</th>
			    <td>
			    <select name="bcode">
                   <option value="Seo" <%if(dto.getBcode().equals("Seo")){ out.print("selected"); }%>>서울</option>
                   <option value="Gwa" <%if(dto.getBcode().equals("Gwa")){ out.print("selected"); }%>>과천</option>
                   <option value="Deok" <%if(dto.getBcode().equals("Deok")){ out.print("selected"); }%>>덕수궁</option>
                   <option value="Cheong" <%if(dto.getBcode().equals("Cheong")){ out.print("selected"); }%>>청주</option>
                   <option value="Kid" <%if(dto.getBcode().equals("Kid")){ out.print("selected"); }%>>어린이미술관</option>
               </select>
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
			    <th>전시 기한</th>
			    <td style="text-align: left">
		    		<input type="date" name="exstart" id="exstart" value=<%=dto.getExstart()%> required> ~ <input type="date" name="exend" id="exend" value=<%=dto.getExend()%>required>
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
			    	<textarea rows="5" cols="30" name="contents" id="contents"><%=dto.getContents()%></textarea>
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