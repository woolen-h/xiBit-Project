<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibitForm.jsp -->
		<h3> * 전시 게시하기 * </h3>
		<p><a href="exhibition_tab.jsp">[목록]</a></p>
		
		<form name="exhibitfrm" method="post" action="exhibitIns.jsp" enctype="multipart/form-data" onsubmit="return pdsCheck()">
		<table class="table">
		<tr>
		    <th>전시장코드</th> <!-- select로 수정완료 -->
		    <td>
			    <select name="bcode" id="bcode">
	                <option value="Seo" selected>서울</option>
	                <option value="Gwa">과천</option>
	                <option value="Deok">덕수궁</option>
	                <option value="Cheong">청주</option>
	                <option value="Kid">어린이박물관</option>
	            </select>
            </td>
		</tr>
		<tr>
		    <th>전시명</th>
		    <td style="text-align: left">
		    	<input type="text" name="exname" id="exname" size="15" maxlength="50" required>
		    </td>
		</tr>
		<tr>
		    <th>작가</th>
		    <td style="text-align: left">
		    	<input type="text" name="author" id="author" size="15" maxlength="50" required>
		    </td>
		</tr>
		<tr>
		    <th>전시 기한</th> <!-- 달력으로 수정완료 -->
		    <td style="text-align: left">
		    	<input type="date" name="exstart" id="exstart" required> ~ <input type="date" name="exend" id="exend" required>
		    </td>
		</tr>
		<tr>
		    <th>작품 수</th>
		    <td style="text-align: left">
		    	<input type="text" name="excnt" id="excnt" size="5" maxlength="9999" required>
		    </td>
		</tr>
		<tr>
		    <th>예매가</th>
		    <td style="text-align: left">
		    	<input type="text" name="price" id="price" size="10" required>
		    </td>
		</tr>
		<tr>
		    <th>문의번호</th>
		    <td style="text-align: left">
		    	<input type="text" name="tel" id="tel" size="14" required>
		    </td>
		</tr>
		<tr>
		    <th>작품설명</th>
		    <td style="text-align: left">
		    	<textarea rows="5" cols="30" name="contents" id="contents"></textarea>
		    </td>
		</tr>
		<tr>
		    <th>첨부파일</th>
		    <td style="text-align: left">
		    	<input type="file" name="filename" id="filename">
		    </td>
		</tr>
		<tr>
		    <td colspan="2">
		    	<input type="submit" value="올리기">
		    	<input type="reset" value="취소">
		    </td>
		</tr>
		</table>
		</form>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>