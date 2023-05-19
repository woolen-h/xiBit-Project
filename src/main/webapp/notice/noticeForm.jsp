<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="content">

	<h3>공지사항</h3>
	<p>
		<a href="noticeList.jsp">[목록]</a>
	</p>

	<div class="container">
		<form name="noticefrm" id="noticefrm" method="post" action="noticeIns.jsp" onsubmit="return noticeCheck()">
			<table>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="category">
								<option value="N">공지사항</option>
								<option value="E">이벤트</option>
								<option value="P">프로그램</option>
								<option value="A">기사</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id="subject" maxlength="100" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" name="content" id="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="쓰기"> 
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div> <!-- container end -->
	
</div> <!-- content end -->

<%@ include file="../footer.jsp"%>